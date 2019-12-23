<?php

/**
 * Description of ActionProfile_EventSettings
 *
 * @author oleg
 */
class ActionProfile_EventSettingsAjax extends Event {
       
    public function Init() {
        $this->setResponseType(Action::RESPONSE_TYPE_JSON);
        
        if(array_key_exists('id', $this->getRequest('data', []))){
            $this->oUserProfile = $this->User_GetUserById($this->getRequest('data')['id']); 
        }
        
        if(!$this->oUserProfile){
            return $this->EventErrorDebug();
        }
                
    }
    
    public function EventSecurityAjax() {
        
        $this->Message_AddNotice('успешно');
        $this->assign('data', $_REQUEST);
    }
    
    public function EventProfileAjax() {
        
        $validator = Engine::GetEntity("User_ValidateProfileSettings");
        $validator->_setValidateScenario('settings');
                
        $validator->_setDataSafe($this->getRequest('data'));
        
        $this->Hook_Run(
            'profile_settings_validate_after', 
            [
                'oUser' => $this->oUserProfile, 
                'validator' => $validator
            ]
        );
        
        if ($validator->_Validate()) 
        {
            $this->Hook_Run('profile_settings_validate_after', ['oUser' => $this->oUserProfile]);
            
            $this->oUserProfile->_setData($validator->_getData());
            
            if($this->oUserProfile->Save()){
                
                $this->Hook_Run('profile_settings_save_after', ['oUser' => $this->oUserProfile]);
                
                $this->Message_AddNotice($this->Lang_Get('common.success.save'));
                $this->assign('sUrlRedirect', $this->oUserProfile->getProfileUrl().'settings');
            }
           
        } else {
            /**
             * Получаем ошибки
             */
            $this->assign('errors', $validator->_getValidateErrors());
            return;
        }
        
    }
    
}
