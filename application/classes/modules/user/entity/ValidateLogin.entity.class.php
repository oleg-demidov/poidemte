<?php

/*
 * LiveStreet CMS
 * Copyright © 2013 OOO "ЛС-СОФТ"
 *
 * ------------------------------------------------------
 *
 * Official site: www.livestreetcms.com
 * Contact e-mail: end-fin@yandex.ru
 *
 * GNU General Public License, version 2:
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 * ------------------------------------------------------
 *
 * @link https://vk.com/u_demidova
 * @copyright 2013 OOO "ЛС-СОФТ"
 * @author Oleg Demidov <end-fin@yandex.ru>
 *
 */

/**
 * Description of ModuleUser_EntityValidateLogin
 *
 * @author oleg
 */
class ModuleUser_EntityValidateLogin extends Entity{
    
    public function rules() {
        return [
            [   
                'mail_login', 
                'string', 
                'allowEmpty' => false,
                'on'        => ['login', '']
            ],
            [   
                'mail_login', 
                'mail_login',
                'on'        => ['login', '']
            ],
            [   
                'password', 
                'string', 
                'allowEmpty' => false,
                'on'        => ['login', '']
            ],
            [   
                'password', 
                'password', 
                'allowEmpty' => false,
                'on'        => ['login', '']
            ],
        ];
    }
    
    public function ValidateMailLogin($sValue) 
    {
        $user = $this->User_GetUserByLogin($sValue);
        if(!$user){
            $user = $this->User_GetUserByMail($sValue);
        }
        
        if(!$user){
            return $this->Lang_Get('auth.login.notices.error_no_user');
        }
        
        if(!$this->User_VerifyAccessAuth($user)){
            return $this->Lang_Get('auth.login.notices.error_user_no_access', ['login' => $user->getLogin()]);
        }
        
        if (!$user->getActivate()) {
            return $this->Lang_Get('auth.login.notices.error_not_activated',
                array('reactivation_path' => Router::GetPath('auth/reactivation')));
        }
        
        $this->setUser($user);
        
        return true;
    }
    
    public function ValidatePassword($sValue) {
        if (!$this->getUser()) {
            return '';
        }
        if ($this->getUser()->getPassword() != $this->User_MakeHashPassword($sValue)) {
            return $this->Lang_Get('auth.login.notices.error_login');
        }
        
        return true;
    }
}
