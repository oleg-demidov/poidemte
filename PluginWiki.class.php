<?php
/**
 * 
 * @author Oleg Demidov
 *
 */

/**
 * Запрещаем напрямую через браузер обращение к этому файлу.
 */
if (!class_exists('Plugin')) {
    die('Hacking attempt!');
}

class PluginWiki extends Plugin
{

    protected $aInherits = array(
        
    );

    public function Init()
    {
       
        
    }

    public function Activate()
    {
        $this->Category_CreateTargetType('wiki', 'Документация', array(), true);
        
        $oType = Engine::GetEntity('ModuleTopic_EntityTopicType');
        $oType->_setDataSafe(['name' =>"Викистраница", 'name_many' =>'Викистраницы', 'code' => 'wikipage' ]);
        $oType->setParams(['allow_text' => 1, "css_icon" =>'']);
        $oType->setAllowRemove(1);
        $oType->setState( ModuleTopic::TOPIC_TYPE_STATE_ACTIVE );
        $oType->setDateCreate(date("Y-m-d H:i:s"));
        $this->Topic_AddTopicType($oType);
        
        
        return true;
    }

    public function Deactivate()
    {
        
        return true;
    }
    
    public function Remove()
    {
        
        $this->Category_RemoveTargetType('wiki');
        return true;
    }
}