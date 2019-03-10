<?php


class PluginWiki_HookMenu extends Hook{
    public function RegisterHook()
    {
        $this->AddHook('engine_init_complete', 'NavMain');        
    }

    /**
     * Добавляем в главное меню 
     */
    public function NavMain($aParams)
    {
        $aWiki = $this->PluginWiki_Wiki_GetWikiItemsAll();
        
        $oMenu = $this->Menu_Get('main');
        
        $aItems = [];
        foreach ($aWiki as $oWiki) {
            
            if(!$oWiki->getState()){
                continue;
            }
            
            if(!$oWiki->getMenuEnable()){
                continue;
            }
           
            $oMenu->appendChild(Engine::GetEntity("ModuleMenu_EntityItem", [
                'name' => $oWiki->getCode(),
                'title' => $oWiki->getMenuTitle(),
                'url' => 'wiki/'.$oWiki->getCode()
            ]));
            
        }
        
    }

}
