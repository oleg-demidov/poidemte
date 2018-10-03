<?php
/**
 * Таблица БД
 */
$config['$root$']['db']['table']['category_wiki'] = '___db.table.prefix___category';
/**
 * Роутинг
 */
$config['$root$']['router']['page']['wiki'] = 'PluginWiki_ActionWiki';



$config['$root$']['block']['wiki_panel'] = array(
    'action' => array(
        'wiki'
    ),
    'blocks' => array(
        'right' => array(
            'wiki' => array('priority' => 100,'params' => array('plugin' => 'wiki'))
        )
    ),
    'clear'  => false,
);

return $config;