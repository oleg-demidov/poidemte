<?php

class ModuleUser_EntityUser extends EntityORM
{
        
    protected function rules() {
        $rules = [
            array(
                'mail', 
                'email', 
                'allowEmpty' => false, 
                'on' => array('registration'),
                'label' => $this->Lang_Get('auth.registration.form.fields.email.label')
            ),
            
            [   
                'mail', 
                'mail_exists', 
                'on' => array('registration'),
                'allowEmpty' => false,
                'label' => $this->Lang_Get('auth.registration.form.fields.email.label')
            ],
            [
                'login', 
                'login_exists', 
                'allowEmpty' => false,
                'on' => array('registration'),
                'label' => $this->Lang_Get('auth.registration.form.fields.login.label')
            ],
            [
                'login', 
                'string', 
                'min'   => Config::Get('module.user.login.min_size'),
                'max'   => Config::Get('module.user.login.max_size'),
                'allowEmpty' => false,
                'on' => array('registration'),
                'label' => $this->Lang_Get('auth.registration.form.fields.login.label')
            ],
            [
                'password', 
                'string', 
                'on' => array('registration'),
                'allowEmpty' => false,
                'label' => $this->Lang_Get('auth.registration.form.fields.password.label')
            ],
            [
                'password_confirm', 
                'string', 
                'on' => array('registration'),
                'allowEmpty' => false,
                'label' => $this->Lang_Get('auth.registration.form.fields.password_confirm.label')
            ],
            [
                'password', 
                'password', 
                'on' => array('registration'),
                'allowEmpty' => false,
                'label' => $this->Lang_Get('auth.registration.form.fields.password.label')
            ],
            [
                'password_confirm', 
                'password_confirm', 
                'on' => array('registration'),
                'allowEmpty' => false,
                'label' => $this->Lang_Get('auth.registration.form.fields.password_confirm.label')
            ]
        ];
        
        if (Config::Get('module.user.captcha_use_registration')) {
            
            $rules[] = [
                'recaptcha', 
                'captcha_recaptcha',
                'allowEmpty' => false, 
                'on'        => array('registration'),
                'msg'       => $this->Lang_Get('validate.recaptcha.is_empty'),
            ];
        }
        
        $rules[] = [
            'login', 
            'regexp',
            'pattern'   => Config::Get('module.user.login.pattern') ,
            'msg'       => $this->Lang_Get('auth.registration.notices.error_login_pattern'),
            'allowEmpty' => false, 
            'on'        => array('registration'),
            'label'     => $this->Lang_Get('auth.registration.form.fields.login.label')
        ];
        
        return $rules;        
    }    

    protected $aRelations = array(
        'session' => array(self::RELATION_TYPE_HAS_ONE, 'ModuleUser_EntitySession', 'user_id'),
    );

    public function ValidateLogin($sValue, $aParams)
    {
        if ($this->User_CheckLogin($sValue)) {
            return true;
        }
        return $this->Lang_Get('auth.registration.notices.error_login');
    }

    /**
     * Проверка емайла на существование
     *
     * @param string $sValue Валидируемое значение
     * @param array $aParams Параметры
     * @return bool
     */
    public function ValidateMailExists($sValue, $aParams)
    {
        if (!$this->User_GetUserByMail($sValue)) {
            return true;
        }
        return $this->Lang_Get('auth.registration.notices.error_mail_used');
    }
    
    public function ValidateRoleExists($sValue, $aParams)
    {
        if ($this->Rbac_GetRoleByFilter(['code' => $sValue])) {
            return true;
        }
        return $this->Lang_Get('auth.registration.notices.role_no_exists', ['role' => $sValue]);
    }
    
    public function ValidateLoginExists($sValue, $aParams)
    {
        $aPages = array_keys( Config::Get('router.page') ); 
        if(in_array($sValue, $aPages)){
            return $this->Lang_Get('auth.registration.notices.error_login_used');
        }
        
        if (!$this->User_GetUserByLogin($sValue)) {
            return true;
        }
        
        return $this->Lang_Get('auth.registration.notices.error_login_used');
    }
    
    public function ValidatePassword($sValue)
    {
        return true;
    }
    
    public function ValidatePasswordConfirm($sValue)
    {
        if($sValue != $this->getPassword()){
            return $this->Lang_Get('auth.registration.notices.passwords_mismatch');
        }
        return true;
    }

    protected function beforeSave()
    {
        if ($this->_isNew()) {
            if (!$this->getDateCreate()) {
                $this->setDateCreate(date("Y-m-d H:i:s"));
            }
            if (!$this->getIpCreate()) {
                $this->setIpCreate(func_getIp());
            }
        }
        return true;
    }

    public function isAdministrator()
    {
        return $this->isAdmin();
    }

    public function isAdmin()
    {
        return $this->getIsAdmin();
    }

    public function getDisplayName()
    {
        return htmlspecialchars($this->getMail());
    }

    /**
     * Возвращает статус онлайн пользователь или нет
     *
     * @return bool
     */
    public function isOnline()
    {
        if ($oSession = $this->getSession()) {
            if (time() - strtotime($oSession->getDateLast()) < Config::Get('module.user.time_onlive')) { // 10 минут
                return true;
            }
        }
        return false;
    }

    public function getProfileUrl() { 
        return Router::GetPath('profile/'.$this->getLogin());
    }
    
    public function getProfilePhoto() {
        return $this->User_GetDefaultPhoto();
    }
    
    public function getProfileAvatar($size = 'x100') {
        return $this->User_GetDefaultAvatar();
    }
    
}