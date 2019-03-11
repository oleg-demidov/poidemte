<?php

class PluginWiki_ActionAdmin_EventPage extends Event
{
    protected $oUserCurrent = null;
    
    protected $oWiki = null;

    public function Init()
    { 
        $this->oUserCurrent = $this->User_GetUserCurrent();
        
        if(!$this->oWiki = $this->PluginWiki_Wiki_GetWikiByCode( $this->sCurrentEvent )){
            $this->Message_AddError('Нет такой документации');
            Router::LocationAction("admin/plugin/wiki/list");
        }
    }

   
    public function EventList()
    {
        $this->SetTemplateAction('page-list');
        
        $aPages = $this->PluginWiki_Wiki_GetPageItemsByWikiId( $this->oWiki->getId() );
        
        $this->Viewer_Assign('aPages', $aPages);  
        $this->Viewer_Assign('oWiki', $this->oWiki);  
    }
    
    public function EventAdd() {
        
        $this->SetTemplateAction('page-add');
        
//        $oWiki = $this->PluginWiki_Wiki_GetWikiById( $this->GetParam(0) );
//        
//        if(isPost()){ 
//            if(!$oWiki){
//                $oWiki = Engine::GetEntity('PluginWiki_Wiki_Wiki' );
//            }
//            
//            $oWiki->_setData(getRequest('wiki'));
//            
//            if(!isset($_POST['wiki']['state'])){
//                $oWiki->setState(0);
//            }
//            if(!isset($_POST['wiki']['menu_enable'])){
//                $oWiki->setMenuEnable(0);
//            }
//            
//                       
//            if($oWiki->_Validate()){ 
//                if($oWiki->Save()){
//                    
//                    $this->Message_AddNoticeSingle($this->Lang_Get('common.success.save'),'',true);
//                    Router::LocationAction("admin/plugin/wiki/list");
//                    
//                }else{
//                    $this->Message_AddErrorSingle($this->Lang_Get('common.error.system.base'));
//                }
//            }else{
//                foreach($oWiki->_getValidateErrors() as $aError){
//                    $this->Message_AddError($aError[0], $this->Lang_Get('common.error.error'));
//                }
//            }  
//                      
//        }
//        
//        if($oWiki){
//            $_REQUEST['wiki'] = $oWiki->_getData();
//        }
        $this->Viewer_Assign('oWiki', $this->oWiki);  
    }
    
    public function EventRemove() {
        $this->SetTemplate(false);
        
        $oWiki = $this->PluginWiki_Wiki_GetWikiById( $this->GetParam(0) );
        
        if($oWiki){
            $this->Security_ValidateSendForm();
            /**
             * Удаляем
             */
            if ($oWiki->Delete()) {
                $this->Message_AddNotice('Удаление прошло успешно', null, true);
            } else {
                $this->Message_AddError('Возникла ошибка при удалении', null, true);
            }

            
        }
        
        Router::LocationAction("admin/plugin/wiki/list");
        
         
    }
    
    public function EventAskList() {
        $this->SetTemplateAction('test-asks-list');
        
        $iPage = $this->GetParamEventMatch(1, 2);
        if(!$iPage){
            $iPage = 1;
        }
        
        $oTest = $this->PluginTest_Test_GetTestByCode($this->sCurrentEvent);        
        if(!$oTest){
            return Router::ActionError($this->Lang_Get('plugin.test.admin.bilet.notices.no_test_find'));
        }
                
        $aBilets = $oTest->getBilets(['#index-from' => 'id']);
        
        $aAsks = $oTest->getAsks([
            '#with' => '#category',
            '#page' => [$iPage, Config::Get('plugin.test.ask.list.per_page')]
        ]);
        
        $aPaging = $this->Viewer_MakePaging($aAsks['count'], $iPage, Config::Get('plugin.test.ask.list.per_page'),
            Config::Get('pagination.pages.count'), Router::GetPath('admin/plugin/test/'.$this->sCurrentEvent.'/asks'));
        
        $this->Viewer_Assign('aBilets', $aBilets);
        $this->Viewer_Assign('aAsks', $aAsks['collection']);
        $this->Viewer_Assign('aPaging', $aPaging);
        $this->Viewer_Assign('oTest', $oTest);
        $this->Viewer_Assign('activeNavItem', 'asks');
    }
    
    public function EventBiletList() {
        $this->SetTemplateAction('test-bilets-list');
        
        $oTest = $this->PluginTest_Test_GetTestByCode( $this->sCurrentEvent );
        if(!$oTest){
            return Router::ActionError($this->Lang_Get('plugin.test.admin.bilet.notices.no_test_find'));
        }
        
        
        $this->Viewer_Assign('oTest', $oTest);
        $this->Viewer_Assign('aBilets', $oTest->getBilets());
        $this->Viewer_Assign('activeNavItem', 'bilets');
        
    }
    
//    public function EventSettings() {
//        $this->SetTemplateAction('test-settings');
//                
//        $oTest = $this->PluginTest_Test_GetTestByCode( $this->sCurrentEvent );
//        if(!$oTest){
//            return Router::ActionError($this->Lang_Get('plugin.test.admin.bilet.notices.no_test_find'));
//        }
//        
//        
//        if(isPost()){
//        
//            $oTest->setState(getRequest('state'));
//            
//            if($oTest->Save()){
//                $this->Message_AddNotice('Cохранено успешно');
//            }
//            
//            $aFile = $_FILES['image'];
//            
//            
//            if($aFile or getRequest('remove')){  
//                $this->Media_RemoveTarget('test_img_default', $oTest->getId(), true);
//            }
//            
//            if($aFile){  
//                            
//                if($oMedia = $this->Media_Upload($aFile, 'user', $this->oUserCurrent->getId()) and is_object($oMedia)){
//                    $this->Media_AttachMedia([$oMedia->getId()], 'test_img_default', $oTest->getId());
//                    $this->Message_AddNotice('Картинка сохранена успешно');
//                }
//
//            }
//        }
//        
//        $_REQUEST = [
//            'state' => $oTest->getState()
//        ];      
//        
//        
//        $aMedias = $this->Media_GetMediaByTarget('test_img_default', $oTest->getId());
//        
//               
//        $this->Viewer_Assign('oTest', $oTest);
//        $this->Viewer_Assign('aMedias', $aMedias);
////        $this->Viewer_Assign('aBilets', $oTest->getBilets());
//        $this->Viewer_Assign('activeNavItem', 'settings');
//    }
}