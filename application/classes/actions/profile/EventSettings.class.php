<?php

/**
 * Description of ActionProfile_EventSettings
 *
 * @author oleg
 */
class ActionProfile_EventSettings extends Event {
       
    public function EventProfile() {
        $this->Menu_Get('settings')->setActiveItem('profile');
        $this->assign('sActiveItemSettings', 'profile');
        $this->SetTemplateAction('settings/profile');
    }
    
    public function EventNotices() {
        
        $this->assign('sActiveItemSettings', 'notices');
        $this->SetTemplateAction('settings/notices');
    }
    public function EventSecurity() {
       
        $this->assign('sActiveItemSettings', 'security');
        $this->SetTemplateAction('settings/security');
    }
    
}
