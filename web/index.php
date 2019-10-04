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
error_reporting(E_ALL);
ini_set('display_errors', 1);


require_once(dirname(__DIR__) . '/bootstrap/start.php');

/**
 * Определяем дополнительные параметры роутинга
 */
$aRouterParams = array(
    'callback_after_parse_url' => array(
        function () {
//    
//            /*
//             * Обработка url типа site.ru/login
//             */
//            $aPages = array_keys( Config::Get('router.page') ); 
//            $aPages[] = '';
//                    
//            if(!in_array(Router::GetAction(), $aPages)){
//                Router::SetParams(array_merge([Router::GetActionEvent()],Router::GetParams()));
//                Router::SetActionEvent(Router::GetAction());
//                Router::SetAction(Router::getInstance()->Rewrite('profile'));
//                
//            }
            
        }
    )
);

$oRouter = Router::getInstance();
$oRouter->Exec(isset($aRouterParams) ? $aRouterParams : array());