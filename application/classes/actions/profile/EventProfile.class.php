<?php

/**
 * Description of ActionProfile_EventSettings
 *
 * @author oleg
 */
class ActionProfile_EventProfile extends Event {
    
    /**
     * Инициализация
     *
     */
    public function Init()
    {

        $userCurrent = $this->User_GetUserCurrent();
        if($userCurrent->getId() != $this->oUserProfile->getId() || $userCurrent->isAdmin()){ 
            return Router::Action('error', '404');;
        }
    }
    /**
     * Главная страница
     *
     */
    public function EventIndex()
    {
        
        $this->sMenuHeadItemSelect = 'index';
        $this->SetTemplateAction('index');
    }
    
    
    
    
}
