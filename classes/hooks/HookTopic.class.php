<?php


class PluginWiki_HookTopic extends Hook{
    public function RegisterHook()
    {
        
        $this->AddHook('topic_add_after', 'AddTopic');
        $this->AddHook('topic_edit_before', 'EditTopic');
        
    }

    /**
     * Добавляем в главное меню 
     */
    public function AddTopic($aParams)
    {
        if($aParams['oTopic']->getType() !== 'wikipage'){
            return false;
        }
        
        $this->EditTopic($aParams);

        $aCategoryIds = getRequest('categories');
        if(!is_array($aCategoryIds) or !count($aCategoryIds)){
            return false;
        }
        
        return $this->Category_CreateRelation($aCategoryIds, $aParams['oTopic']->getId(), 'wiki');

    }

    public function EditTopic($aParams) {
        $this->Text_LoadJevixConfig('wiki',  true);
        $aParams['oTopic']->setText($this->Text_Parser($aParams['oTopic']->getTextSource()));
    }
}
