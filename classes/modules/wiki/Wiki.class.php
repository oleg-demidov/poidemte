<?php

class PluginWiki_ModuleWiki extends ModuleORM
{
    
    
    public function Init() {
        parent::Init(); 
    }
    
    /**
     * Обработка тега wiki в тексте
     * <pre>
     * <wiki punkt="2.2.2" />
     * </pre>
     *
     * @param string $sTag Тег на ктором сработал колбэк
     * @param array $aParams Список параметров тега
     * @return string
     */
    public function CallbackParserTagWiki($sTag, $aParams)
    {
        $sText = '';
        if (isset($aParams['punkt'])) {
            if($oTopic = $this->PluginWiki_Wiki_GetTopicByFilter(['topic_title' => $aParams['punkt']])){
                $oTopic->setType('wikipage');
                $sText .= "<a href=\"{$oTopic->getUrl()}#p{$aParams['punkt']}\" class=\"wikipage-url-ajax\">{$oTopic->getTopicTitle()}</a> ";
            }
        }
        return $sText;
    }
    
}