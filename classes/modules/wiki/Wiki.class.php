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
        $sText = '';        $this->Logger_Notice($sTag . print_r($aParams,true));
        if (isset($aParams['punkt'])) {
            if($oPunkt = $this->PluginWiki_Wiki_GetPunktByFilter(['name' => $aParams['punkt']])){
                $sText .= "<a href=\"{$oPunkt->getPage()->getUrl()}#p{$aParams['punkt']}\" class=\"wikipage-url-ajax\">{$oPunkt->getName()}</a> ";
            }
        }
        return $sText;
    }
    
}