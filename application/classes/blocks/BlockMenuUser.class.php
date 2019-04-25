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
class BlockMenuUser extends BlockMenu {

    public function __construct($aParams) {
        
        if (!$oUser = $this->User_GetUserCurrent()) {
            return false;
        } 
       
        $aParams['name'] = 'user';
        parent::__construct($aParams);
    }    
    

}
