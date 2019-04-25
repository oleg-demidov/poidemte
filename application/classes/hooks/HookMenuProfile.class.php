<?php

class HookMenuProfile extends Hook {
    
    /**
     * Регистрируем хуки
     */
    public function RegisterHook() {
        //$this->AddHook('menu_before_prepare', 'Menu', null, 100);
    }

    public function Menu($aParams) { 
        
        if($aParams['menu']->getName() != 'profile'){
            return false;
        }
        
        if(!$oUser = $this->User_GetUserByLogin(Router::GetActionEvent())){
            return false;
        }
        
        if(!$oUserCurrent = $this->User_GetUserCurrent()){
            return false;
        }
        
        if($oUserCurrent->getId() != $oUser->getId()){
            return false;
        }
         
        
        $aParams['activeItem'] = Router::GetParam(0)?Router::GetParam(0):'profile';
        
        //$aParams['menu']
        
        
    }
}