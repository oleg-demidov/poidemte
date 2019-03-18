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
    
    protected $oCategoryType;
    
    protected $aCategories = [];


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
        
        $this->oCategoryType = $this->Category_GetTypeByTargetType($this->sCurrentAction);
        
        if(!$this->oCategoryType){
            return Router::ActionError($this->Lang_Get('plugin.wiki.messages.no_wiki'));
        }
        
        
        $this->oWiki = $this->PluginWiki_Wiki_GetWikiByFilter([
            'url' => Router::GetActionEvent(),
            'type_id' => $this->oCategoryType->getId()
        ]);
        
        if($this->oWiki){
            $this->aCategories = $this->oWiki->getChildren(); 
        }
        
    }

    /**
     * Регистрация евентов
     */
    protected function RegisterEvent()
    {
        
        $this->AddEventPreg(
                '/^([a-z_0-9]{1,100})?$/i', 
                '/^([a-z_0-9]{1,100})?$/i', 
                '/^([a-z_0-9]{1,100})?$/i',
                '/^([a-z_0-9]{1,100})?$/i',
                '/^([a-z_0-9]{1,100})?$/i',
                '/^([a-z_0-9]{1,100})?$/i',
                ['EventWiki', 'wiki']
        );
           
    }
    
    public function EventWiki() {
        
        if(!$this->sCurrentEvent or !$this->oWiki){
            return $this->EventWikiUnknown();
        }
        
        $this->sMenuHeadItemSelect = $this->oWiki->getUrl();
        /*
         * Если параметров больше нуля ищем wikipage
         */
        if(count($this->GetParams()) > 0){
            return $this->EventWikipage();
        }
        
        $this->SetTemplateAction('wiki');        
        $this->Viewer_Assign('oWiki', $this->oWiki);
        
        
    }
    
    public function EventWikipage() {
        $sUrlFull = $this->oWiki->getUrl(). '/' .implode('/', $this->GetParams());
        
        $oCategory = $this->Category_GetCategoryByFilter([
            'url_full' => $sUrlFull,
            'type_id' => $this->oCategoryType->getId()
        ]);
        if(!$oCategory){
            return Router::ActionError($this->Lang_Get('plugin.wiki.messages.no_wiki'));
        }
        
        $aWikipages = [];
        $aTargetIds = $this->Category_GetTargetIdsByCategory($oCategory, 'wiki', 1, 1000);
        if(count($aTargetIds)){
            $aWikipages = $this->Topic_GetTopicsByArrayId($aTargetIds);
        }
        
        $aWikipages = $this->sortWikipages($aWikipages);
        
        $this->SetTemplateAction('wikipages');        
        $this->Viewer_Assign('oWiki', $this->oWiki);
        $this->Viewer_Assign('oCategory', $oCategory);
        $this->Viewer_Assign('aWikipages', $aWikipages);
    }
    /**
     * Эвент для обработки wiki/
     */
    public function EventWikiUnknown() {
        $aWiki = $this->PluginWiki_Wiki_GetWikiItemsByFilter([
            'type_id' => $this->oCategoryType->getId(),
            'pid' => null
        ]);
        
        $this->Viewer_Assign('aWiki', $aWiki);
        $this->SetTemplateAction('unknown');
    }
    
    /**
     * Выполняется при завершении работы экшена
     *
     */
    public function EventShutdown()
    {
        /**
         * Загружаем в шаблон необходимые переменные
         */
        $this->Viewer_Assign('sMenuHeadItemSelect', $this->sMenuHeadItemSelect);
        $this->Viewer_Assign('aCategories', $this->aCategories);
    }
    
    protected function sortWikipages($aWikipages) {
        $aWikipagesSort=[];
        $aWikipagesIds=[];
        
        foreach ($aWikipages as $oWikipage) {
            /*
             * Приводим к числу с плавающей точкой
             */
            $id = preg_replace('/(\d+)(\.)(\d+)(\.)(\d+)/i', '${1}${2}${3}${5}', $oWikipage->getTitle());
            $aWikipagesIds[$id] = $oWikipage->getId();
        }
        
        ksort($aWikipagesIds);
        
        foreach ($aWikipagesIds as $iId) {
            $aWikipagesSort[] = $aWikipages[$iId];
        }
        return $aWikipagesSort;
    }

}