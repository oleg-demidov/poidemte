<?php

class PluginWiki_ModuleWiki_EntityWiki extends EntityORM
{
    
    protected $aRelations = array(
        'pages' => array( self::RELATION_TYPE_HAS_MANY, 'PluginWiki_ModuleWiki_EntityPage', 'wiki_id' )
    );
    
    public function getCountPages() {
        return count($this->getPages());
    }
    
}