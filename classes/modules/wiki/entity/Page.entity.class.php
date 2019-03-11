<?php

class PluginWiki_ModuleWiki_EntityPage extends ModuleCategory_EntityCategory
{
    
    protected $aRelations = array(
        'wiki' => array( self::RELATION_TYPE_BELONGS_TO, 'PluginWiki_ModuleWiki_EntityWiki', 'wiki_id' ),
        'punkts' => array( self::RELATION_TYPE_HAS_MANY, 'PluginWiki_ModuleWiki_EntityPunkt', 'page_id' )
    );
    protected $aBehaviors = array(
        /**
         * Дополнительные поля
         */
        'category' => [
            'class' => 'ModuleCategory_BehaviorEntity',
            'target_type' => 'wiki'
        ]
    );
    
    public function getCountPunkts() {
        return count($this->getPunkts());
    }
   
}