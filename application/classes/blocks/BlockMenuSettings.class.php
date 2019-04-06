<?php

/*
 * LiveStreet CMS
 * Copyright © 2018 OOO "ЛС-СОФТ"
 *
 * ------------------------------------------------------
 *
 * Official site: www.livestreetcms.com
 * Contact e-mail: office@livestreetcms.com
 *
 * GNU General Public License, version 2:
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 * ------------------------------------------------------
 *
 * @link http://www.livestreetcms.com
 * @copyright 2013 OOO "ЛС-СОФТ"
 * @author Oleg Demodov <boxmilo@gmail.com>
 *
 */

/**
 * Description of BlockMenuSettings
 *
 * @author oleg
 */
class BlockMenuSettings extends BlockMenu {

    public function __construct($aParams) {
        
        if (!($this->oUserProfile = $this->User_GetUserByLogin(Router::GetActionEvent()))) {
            return false;
        } 
        
        $this->Menu_Get('settings')->appendChild(Engine::GetEntity("ModuleMenu_EntityItem", [
            'title' => $this->Lang_Get('user.settings.profile.title'), 
            'name' => 'profile', 
            'url' => 'profile/'.$this->oUserProfile->getLogin()."/settings/profile"
        ]));
        
        $aParams['name'] = 'settings';
        parent::__construct($aParams);
    }   
    

}
