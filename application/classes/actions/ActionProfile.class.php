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
        if(!$this->CheckUserProfile()){
            $this->Message_AddError($this->Lang_Get('common.error.system.code.404'), '404');
            Router::LocationAction('error/404');
        }
        $this->SetDefaultEvent('index');
        
        
        $this->Viewer_SetHtmlCanonical($this->oUserProfile->getProfileUrl());
        
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
        $this->AddEventPreg('/^.+$/i', '/^settings$/i', '/^security-ajax$/i', 'Settigns::EventSecurityAjax' );
        $this->AddEventPreg('/^.+$/i', '/^settings$/i', '/^profile-ajax$/i', 'Settigns::EventProfileAjax' );
        
        $this->RegisterEventExternal('Profile', 'ActionProfile_EventProfile');
        $this->AddEventPreg('/^.+$/i', '/^(all)?$/i', '/^(page(\d))?$/i', ['Profile::EventIndex' , 'profile']);
        
       
    }


    /**********************************************************************************
     ************************ РЕАЛИЗАЦИЯ ЭКШЕНА ***************************************
     **********************************************************************************
     */
    
    /**
     * Проверка корректности профиля
     */
    protected function CheckUserProfile()
    {
        /**
         * Проверяем есть ли такой юзер
         */
        if (!($this->oUserProfile = $this->User_GetUserByLogin(Router::GetActionEvent()))) {
            return false;
        }        
        
        return $this->oUserProfile->getActivate() and $this->oUserProfile->getActive();
    }
    
     /**
     * Проверка корректности профиля
     */
    protected function CheckUserProfileAccess()
    {
        if (!($oUserCurrent = $this->User_GetUserCurrent())) {
            return false;
        }

        if($oUserCurrent->getId() != $this->oUserProfile->getId() and !$oUserCurrent->isAdministrator()){
            return false;
        }
        
        if($oUserCurrent->getId() != $this->oUserProfile->getId()){
            $this->Message_AddNotice($this->Lang_Get('profile.notices.notice_alien_profile'),$this->Lang_Get('common.attention'));
        }
        return true;
    }

   
    

    /**
     * Выполняется при завершении каждого эвента
     */
    public function EventShutdown()
    {
        $this->assign('sMenuHeadItemSelect', $this->sMenuHeadItemSelect);
        $this->assign('iCountProposals', $this->iCountProposals);
        $this->assign('iCountResponses', $this->iCountResponses);
        $this->assign('iCountAnswers', $this->iCountAnswers);
        $this->assign('oUserProfile', $this->oUserProfile);
        
        if( in_array('admin', array_keys(Engine::getInstance()->GetPlugins()) )){
            $this->Viewer_SetSeoTags([
                'login'         => $this->oUserProfile->getLogin(),
                'name'          => $this->oUserProfile->getName(),
                'rating'        => round($this->oUserProfile->getRating(), 1). " ". $this->Lang_Get('rating.of')." 5" ,
                'count_vote'    => $this->oUserProfile->getCountRated(),
                'about'         => $this->oUserProfile->getAbout()
            ]);
        }
    }


}