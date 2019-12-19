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
 * Description of BlockMenu
 *
 * @author oleg
 */
class BlockMenu extends Block {

    public function Exec() {
        $sNameMenu = $this->GetParam('name');
                
        if(!$oMenu = $this->Menu_Get($sNameMenu)){
            return false;
        }
        
        $this->Hook_Run('menu_' . $sNameMenu, ['menu' => $oMenu, 'activeItem' => &$activeItem]);
        
        $ItemsTree = $this->prepareItems($oMenu->getItems());
                        
        $this->Viewer_Assign('activeItem', $oMenu->getActiveItem());
        $this->Viewer_Assign('items', $ItemsTree);
        
        $this->SetTemplate("component@menu.{$sNameMenu}");
    }
    
    public function prepareItems($ItemsTree) {
        if( !is_array($ItemsTree) or !count($ItemsTree) ){
            return null;
        }
        $aItemsNav = [];
        
        foreach ($ItemsTree as $ItemTree) {
            $aChildrens = $ItemTree->getChildren();
            $aItemsNav[] = [
                'url'           => Router::GetPath( $ItemTree->getUrl() ),
                'name'          => $ItemTree->getName(),
                'icon'          => $ItemTree->getIcon(),
                'text'          => $this->Lang_Get($ItemTree->getTitle()),
                'count'         => $ItemTree->getCount(),
                'is_enabled'    => $ItemTree->getEnable(),
                'menu'          => $this->prepareItems( $aChildrens )
            ];
        }
        return $aItemsNav;
    }

}
