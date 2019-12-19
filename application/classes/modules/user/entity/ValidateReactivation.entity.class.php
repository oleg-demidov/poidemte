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
 * Description of ModuleUser_EntityPasswordReset
 *
 * @author oleg
 */
class ModuleUser_EntityValidateReactivation extends Entity{
    
    public function rules() {
        return [
            [   
                'recaptcha', 
                'captcha_recaptcha',
                'allowEmpty' => false, 
                'on'        => array('reactivation', ''),
                'msg'       => $this->Lang_Get('validate.recaptcha.is_empty'),
            ],
            [   
                'mail', 
                'mail_exists',
                'on'        => ['reactivation', '']
            ],
            [   
                'mail', 
                'email', 
                'allowEmpty' => false,
                'on'        => ['reactivation', '']
            ]
        ];
    }
    
    public function ValidateMailExists($sValue) 
    {        
        if ($this->_hasValidateErrors()) {
            return true;
        }
        $user = $this->User_GetUserByMail($sValue);

        if(!$user){
            return $this->Lang_Get('auth.activation.notice.error_no_user');
        }
                
        $this->setUser($user);
        
        return true;
    }
    
}
