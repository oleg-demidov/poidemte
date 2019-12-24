<?php


/**
 * Обработка Профиля, т.е. УРЛа вида /profile/
 *
 * @package actions
 * @since 1.0
 */
class ActionProfile extends Action
{

    protected $sMenuHeadItemSelect = 'index';
    
    protected $oUserProfile;
   

    /**
     * Инициализация
     *
     */
    public function Init()
    {
        $this->SetDefaultEvent('index');
        $this->oUserProfile = $this->User_GetUserByLogin($this->sCurrentEvent);  
    }

    /**
     * Регистрация евентов
     *
     */
    protected function RegisterEvent()
    {
        
        $this->RegisterEventExternal('Settigns', 'ActionProfile_EventSettings');
        $this->AddEventPreg('/^.+$/i', '/^settings$/i', '/^(profile)?$/i', ['Settigns::EventProfile' , 'settings']);
        $this->AddEventPreg('/^.+$/i', '/^settings$/i', '/^notices$/i', ['Settigns::EventNotices' , 'notices']);
        $this->AddEventPreg('/^.+$/i', '/^settings$/i', '/^security$/i', ['Settigns::EventSecurity' , 'security']);
        
        $this->RegisterEventExternal('SettignsAjax', 'ActionProfile_EventSettingsAjax');
        $this->AddEventPreg('/^ajax-settings$/i', '/^security$/i', 'SettignsAjax::EventSecurityAjax' );
        $this->AddEventPreg('/^ajax-settings$/i', '/^profile$/i', 'SettignsAjax::EventProfileAjax' );
        
        $this->RegisterEventExternal('Profile', 'ActionProfile_EventProfile');
        $this->AddEventPreg('/^.+$/i',  ['Profile::EventIndex' , 'profile']);
        
       
    }


    /**********************************************************************************
     ************************ РЕАЛИЗАЦИЯ ЭКШЕНА ***************************************
     **********************************************************************************
     */
    

    /**
     * Выполняется при завершении каждого эвента
     */
    public function EventShutdown()
    {
        $this->assign('oUserProfile', $this->oUserProfile);
        
    }


}