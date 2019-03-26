<?php


class PluginWiki_ActionAdmin extends PluginAdmin_ActionPlugin
{

  

    public function Init()
    {
        $this->SetDefaultEvent('list');      
        $this->Component_Remove('admin:editor');
        $this->Component_Add('wiki:editor');
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
        $this->AddEventPreg('/^[a-z_0-9]{1,50}$/i', '/^remove_page$/i', '/^([0-9]{1,50})?$/i', 'Page::EventRemove');
        
        $this->RegisterEventExternal('Punkt', 'PluginWiki_ActionAdmin_EventPunkt');  
        $this->AddEventPreg('/^page$/i', '/^[a-z_0-9]{1,50}$/i', '/^(list)?$/i', 'Punkt::EventList');
        $this->AddEventPreg('/^page$/i', '/^[a-z_0-9]{1,50}$/i', '/^punkt_(add|edit)$/i', '/^([0-9]{1,50})?$/i', 'Punkt::EventAdd');
        $this->AddEventPreg('/^page$/i', '/^[a-z_0-9]{1,50}$/i', '/^remove_punkt$/i', '/^([0-9]{1,50})?$/i', 'Punkt::EventRemove');
        

       
    }

}