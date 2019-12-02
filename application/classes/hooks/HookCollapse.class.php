<?php
/*-------------------------------------------------------
*
*   LiveStreet Engine Social Networking
*   Copyright © 2008 Mzhelskiy Maxim
*
*--------------------------------------------------------
*
*   Official site: www.livestreet.ru
*   Contact e-mail: rus.engine@gmail.com
*
*   GNU General Public License, version 2:
*   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
*
---------------------------------------------------------
*/

/**
 * Регистрация основных хуков
 *
 * @package hooks
 * @since 1.0
 */
class HookCollapse extends Hook {
	/**
	 * Регистрируем хуки
	 */
	public function RegisterHook() {
            $this->AddHook('template_test_col','Collap', null, 10);
            
            $this->AddHook('template_test_col','Collap2', null, 1);
	}
	/**
	 * Обработка хука старте экшенов. Выполняется один раз в отличии от хука "init_action"
	 */
	public function Collap($aParams) {           // print_r($aParams);
                        
            $aParams['params']['button'] = 'ccccc';
            
            return $aParams['params'];
        }
        /**
	 * Обработка хука старте экшенов. Выполняется один раз в отличии от хука "init_action"
	 */
	public function Collap2($aParams) {
                        
            $aParams['params']['button'] = '22222';
            
            return $aParams['params'];
        }

	
}