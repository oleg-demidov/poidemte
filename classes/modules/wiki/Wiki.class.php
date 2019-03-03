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
            if($oPunkt = $this->PluginWiki_Wiki_GetPunktByFilter(['id' => $aParams['punkt']])){
                $oPunkt->setType('wikipage');
                $sText .= "<a href=\"{$oPunkt->getUrl()}#p{$aParams['punkt']}\" class=\"wikipage-url-ajax\">{$oPunkt->getTopicTitle()}</a> ";
            }
        }
        return $sText;
    }
    
}