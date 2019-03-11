<?php


class PluginWiki_ActionAdmin extends PluginAdmin_ActionPlugin
{

  

    public function Init()
    {
        $this->SetDefaultEvent('list');        
    }

    /**
     * Регистрируем евенты
     *
     */
    protected function RegisterEvent()
    {
        /**
         * Для ajax регистрируем внешний обработчик
         */
        $this->RegisterEventExternal('Wiki', 'PluginWiki_ActionAdmin_EventWiki');        
        $this->AddEventPreg('/^list$/i', 'Wiki::EventList');
        $this->AddEventPreg( '/^(add|edit)$/i', '/^([0-9]{1,50})?$/i', 'Wiki::EventAddWiki');
        $this->AddEventPreg('/^remove_wiki$/i', '/^([0-9]{1,50})?$/i', 'Wiki::EventRemove');
        
        $this->RegisterEventExternal('Page', 'PluginWiki_ActionAdmin_EventPage');  
        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^pages$/i', 'Page::EventList');
        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^page_(add|edit)$/i', '/^([0-9]{1,50})?$/i', 'Page::EventAdd');
        
        
//        $this->RegisterEventExternal('Bilet', 'PluginTest_ActionAdmin_EventBilet');        
//        $this->AddEventPreg( '/^bilet$/i', '/^(add|edit)$/i', '/^([0-9]{1,50})?$/i',  'Bilet::EventAddEdit');
//        $this->AddEventPreg( '/^bilet$/i', '/^remove$/i', '/^([0-9]{1,50})?$/i',  'Bilet::EventRemove');
//        $this->AddEventPreg( '/^bilet$/i', '/^([0-9]{1,50})?$/i', '/^asks$/i',  'Bilet::EventAskList');
//        
//        $this->RegisterEventExternal('Ask', 'PluginTest_ActionAdmin_EventAsk');        
//        $this->AddEventPreg( '/^ask$/i', '/^(add|edit)$/i', '/^([0-9]{1,50})?$/i',  'Ask::EventAddEdit');
        
//        $this->RegisterEventExternal('Settings', 'PluginTest_ActionAdmin_EventSettings');        
//        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^settings$/i', '/^asks$/i',  'Settings::EventAsks');
        
//        $this->RegisterEventExternal('SettingsTest', 'PluginTest_ActionAdmin_EventSettingsTest');        
//        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^settings$/i', '/^(asks)?$/i',  'SettingsTest::EventAsks');
        
             
//        $this->AddEventPreg( '/^(add|edit)$/i', '/^([0-9]{1,50})?$/i', 'Test::EventAddTest');
//        $this->AddEventPreg('/^remove_test$/i', '/^([0-9]{1,50})?$/i', 'Test::EventRemove');
//        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^(asks)?$/i', '/^(page([0-9]{1,50}))?$/i', 'Test::EventAskList');
//        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^bilets$/i', 'Test::EventBiletList');
       
    }

}