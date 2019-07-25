<?php
/*
 * LiveStreet CMS
 * Copyright © 2013 OOO "ЛС-СОФТ"
 *
 * ------------------------------------------------------
 *
 * Official site: www.livestreetcms.com
 * Contact e-mail: office@livestreetcms.com
 *
 * GNU General Public License, version 2:
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 * ------------------------------------------------------
 *
 * @link http://www.livestreetcms.com
 * @copyright 2013 OOO "ЛС-СОФТ"
 * @author Maxim Mzhelskiy <rus.engine@gmail.com>
 *
 */


/************************************************************
 * Здесь выполняется основная подготовка движка к запуску
 * Внимание! Инициализация ядра здесь не происходит.
 * При необходимости нужно вручную выполнить Engine::getInstance()->Init();
 * Подключение автозагрузчика классов происходит только при инициализации ядра.
 */

/**
 * Запоминаем путь до приложения
 */
define('LS_ROOT_DIR', dirname(__DIR__));
/*
 * Подключается весь движок и загружются конфиги
 */
require dirname(__DIR__). '/vendor/autoload.php'; 


/**
 * Определяем окружение
 * В зависимости от окружения будет дополнительно подгружаться необходимый конфиг.
 * Например, для окружения "production" будет загружен конфиг /application/config/config.production.php
 * По дефолту работает окружение "local"
 */
$sEnv = Engine::DetectEnvironment(array(
    'production' => array('your-machine-name'),
));

/**
 * Определяем дополнительные параметры роутинга
 */
$aRouterParams = array(
    'callback_after_parse_url' => array(
        function () {
    
            /*
             * Обработка url типа fend.ru/login
             */
            $aPages = array_keys( Config::Get('router.page') ); 
            $aPages[] = '';
                    
            if(!in_array(Router::GetAction(), $aPages)){
                Router::SetParams(array_merge([Router::GetActionEvent()],Router::GetParams()));
                Router::SetActionEvent(Router::GetAction());
                Router::SetAction(Router::getInstance()->Rewrite('profile'));
                
            }
            
        }
    )
);