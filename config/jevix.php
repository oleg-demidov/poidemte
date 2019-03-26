<?php

return array(
    'default' => array(
        'cfgAllowTags'          => array(
            // вызов метода с параметрами
            array(
                array('wiki'),
            ),
        ),
        // Коротие теги типа
        'cfgSetTagShort'        => array(
            array(
                array('wiki')
            ),
        ),
        // Разрешённые параметры тегов
        'cfgAllowTagParams'     => array(
            array(
                'wiki',
                array('punkt' => '#text')
            )
        ),
        'cfgSetTagCallbackFull' => array(
            array(
                'wiki',
                array('_this_', 'PluginWiki_Wiki_CallbackParserTagWiki'),
            )
        )
    ),
);