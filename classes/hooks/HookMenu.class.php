<?php


class PluginWiki_HookMenu extends Hook{
    public function RegisterHook()
    {
        
       //$this->AddHook('template_nav_main', 'NavMain');
        
        
    }

    /**
     * Добавляем в главное меню 
     */
    public function NavMain($aParams)
    {
        $aCategories = $this->Category_GetCategoriesTreeByTargetType('wiki');
        
        $aItems = [];
        foreach ($aCategories as $aCategory) {
            $oCategory = $aCategory['entity'];
            $aItems[] = [
                'text' => $oCategory->getTitle(),
                'name' => 'wiki_'.$oCategory->getCode(),
                'url'  => Router::GetPath('wiki/'.$oCategory->getUrlFull())
            ];
        }
        
        $aResult = array_merge( $aItems, $aParams['items']);
        return    $aResult;

    }

}
