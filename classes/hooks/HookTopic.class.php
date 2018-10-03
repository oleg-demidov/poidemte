<?php


class PluginWiki_HookTopic extends Hook{
    public function RegisterHook()
    {
        
       $this->AddHook('topic_add_after', 'AddTopic');
        
        
    }

    /**
     * Добавляем в главное меню 
     */
    public function AddTopic($aParams)
    {
        if($aParams['oTopic']->getType() !== 'wikipage'){
            return false;
        }

        $aCategoryIds = getRequest('categories');
        if(!is_array($aCategoryIds) or !count($aCategoryIds)){
            return false;
        }
        
        return $this->Category_CreateRelation($aCategoryIds, $aParams['oTopic']->getId(), 'wiki');

    }

}
