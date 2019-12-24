<?php

/**
 * Description of ActionProfile_EventSettings
 *
 * @author oleg
 */
class ActionProfile_EventProfile extends Event {
    
    
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
