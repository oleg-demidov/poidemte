<?php

class PluginWiki_ActionWiki extends ActionPlugin
{
    /**
     * Текущий пользователь
     *
     * @var ModuleUser_EntityUser|null
     */
    protected $oUserCurrent = null;
    
    protected $oWiki = null;
    
    protected $sMenuHeadItemSelect = null;
    
    /**
     * Инициализация
     *
     * @return string
     */
    public function Init()
    {
        
        $this->oUserCurrent = $this->User_GetUserCurrent();
        
        if(!$this->oUserCurrent and Router::GetParam(0) !== 'index'){
            return Router::Action(Router::GetAction(), Router::GetActionEvent(), ['index']);
        }
        
        $oCategoryType = $this->Category_GetTypeByTargetType($this->sCurrentAction);
        
        if(!$oCategoryType){
            return Router::ActionError($this->Lang_Get('plugin.wiki.messages.no_wiki'));
        }
        
        $this->oWiki = $this->PluginWiki_Wiki_GetWikiByFilter([
            'url' => Router::GetActionEvent(),
            'type_id' => $oCategoryType->getId()
        ]);
        
    }

    /**
     * Регистрация евентов
     */
    protected function RegisterEvent()
    {
        
        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^([a-z_0-9]{1,50})?$/i', ['EventWiki', 'wiki']);
           
    }

    public function EventWiki() {
        $this->SetTemplateAction('wiki');
        
        $this->Viewer_Assign('oWiki', $this->oWiki);
        
    }

}