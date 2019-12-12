<?php

/**
 * Description of EventViladate
 *
 * @author oleg
 */
class ActionAjax_EventValidate extends Event{
    
    public function EventValidate() {
        
        if(!$sEntity = $this->getRequest('entity')){
            return $this->EventErrorDebug();
        }
        
        $aField = null;
        if($this->getRequest('field')){
            $aField = [$this->getRequest('field')];
        }  
        
        $oEntity = Engine::GetEntity($sEntity);
        
        $oEntity->_setValidateScenario($this->getRequest('scenario', ''));
        
        $oEntity->_setData($this->getRequest('data')); 
        
        if (!$oEntity->_Validate($aField)) {
            /**
             * Получаем ошибки
             */
            $this->assign('bStateError', 1);
            $this->assign('errors', $oEntity->_getValidateErrors());
            return;
        }
        
        $this->assign('bStateError', 0);
        
    }
}
