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
        $this->Viewer_Assign('sActiveItemSettings', 'profile');
        $this->SetTemplateAction('settings/profile');
    }
    
    public function EventNotices() {
        
        $this->Viewer_Assign('sActiveItemSettings', 'notices');
        $this->SetTemplateAction('settings/notices');
    }
    public function EventSecurity() {
       
        $this->Viewer_Assign('sActiveItemSettings', 'security');
        $this->SetTemplateAction('settings/security');
    }
    
    public function EventSecurityAjax() {
        $this->Viewer_SetResponseAjax('json');
        
        $this->Message_AddNotice('успешнddо');
        $this->Viewer_AssignAjax('data', $_REQUEST);
    }
    
    public function EventProfileAjax() {
        $this->Viewer_SetResponseAjax('json');
        
        $iPhoto = (isset(getRequest('photo')[0])?getRequest('photo')[0]:0);
        
        if(is_array(getRequest('sizes')) and isset(getRequest('sizes')[$iPhoto])){
            $aSize = getRequest('sizes')[$iPhoto];
        }
        if(is_array(getRequest('canvasWidth')) and isset(getRequest('canvasWidth')[$iPhoto])){
            $iCanvasWidth = getRequest('canvasWidth')[$iPhoto];
        }
        
        
        $this->oUserProfile->setName(getRequest('name'));
        $this->oUserProfile->setAbout(getRequest('about'));
        $this->oUserProfile->setSite(getRequest('site'));
        $this->oUserProfile->setPhone(getRequest('phone'));
        $this->oUserProfile->setAddress(getRequest('address'));
        $this->oUserProfile->setLogin(getRequest('login'));
        
        if($this->oUserProfile->_Validate()){
            
            if($this->oUserProfile->Save()){
                $this->Message_AddNotice($this->Lang_Get('common.success.save'));
                $this->Viewer_AssignAjax('sUrlRedirect', $this->oUserProfile->getProfileUrl().'/settings');
            }
        }else{
            $this->Message_AddError($this->oUserProfile->_getValidateError());
            $this->Viewer_AssignAjax('errors', $this->oUserProfile->_getValidateErrors());
        }        
    }
    
}
