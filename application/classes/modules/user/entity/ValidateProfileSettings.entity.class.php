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
 * Description of ModuleUser_EntityValidateProfileSettings
 *
 * @author oleg
 */
class ModuleUser_EntityValidateProfileSettings extends Entity{
    
    public function rules() {
        return [
            [   
                'name', 
                'string', 
                'allowEmpty' => false,
                'on'        => ['settings', ''],
                'label' => $this->Lang_Get('user.settings.profile.form.name.label')
            ],
            [   
                'login', 
                'string',
                'min'   => Config::Get('module.user.login.min_size'),
                'max'   => Config::Get('module.user.login.max_size'),
                'allowEmpty' => false,
                'on'        => ['settings', ''],
                'label' => $this->Lang_Get('auth.registration.form.fields.login.label')
            ],
            [   
                'login', 
                'regexp',
                'pattern'   => Config::Get('module.user.login.pattern'),
                'msg'       => $this->Lang_Get('auth.registration.notices.error_login_pattern'),
                'allowEmpty' => false, 
                'on'        => array('settings', ''),
                'label'     => $this->Lang_Get('auth.registration.form.fields.login.label') 
            ],
            [   
                'about', 
                'string', 
                'allowEmpty' => true,
                'on'        => ['settings', ''],
                'label'     => $this->Lang_Get('user.settings.profile.form.about.label')
            ]
        ];
    }
    
}
