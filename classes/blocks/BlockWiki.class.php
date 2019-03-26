<?php

/**
 * Description of PluginTest_BlockPanel
 *
 * @author oleg
 */
class PluginWiki_BlockWiki extends Block {
    
    public function Exec() {
        if(!Router::GetActionEvent()){
            return false;
        }
    }
}
