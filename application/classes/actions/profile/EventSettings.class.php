<?php

/**
 * Description of ActionProfile_EventSettings
 *
 * @author oleg
 */
class ActionProfile_EventSettings extends Event {
    
    public function Init() {
        if(!$this->CheckUserProfileAccess()){
            $this->Message_AddError($this->Lang_Get('common.error.system.code.404'), '404', true);
            Router::LocationAction('error');
        }
        
    }
    
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
    
    public function EventSecurityAjax() {
        $this->Viewer_SetResponseAjax('json');
        
        $this->Message_AddNotice('успешно');
        $this->assign('data', $_REQUEST);
    }
    
    public function EventProfileAjax() {
        $this->Viewer_SetResponseAjax('json');
        
        
        $this->oUserProfile->setName(getRequest('name'));
        $this->oUserProfile->setAbout(getRequest('about'));
        $this->oUserProfile->setSite(getRequest('site'));
        $this->oUserProfile->setLogin(getRequest('login'));
        
        $this->Hook_Run('profile_settings_validate_before', ['oUser' => $this->oUserProfile]);
        
        if($this->oUserProfile->_Validate()){
            
            $this->Hook_Run('profile_settings_save_before', ['oUser' => $this->oUserProfile]);
            
            if($this->oUserProfile->Save()){
                
                $this->Hook_Run('profile_settings_save_after', ['oUser' => $this->oUserProfile]);
                
                $this->Message_AddNotice($this->Lang_Get('common.success.save'));
                $this->assign('sUrlRedirect', $this->oUserProfile->getProfileUrl().'settings');
            }
        }else{
            $this->Message_AddError($this->oUserProfile->_getValidateError());
            $this->assign('errors', $this->oUserProfile->_getValidateErrors());
        }        
    }
    
}
