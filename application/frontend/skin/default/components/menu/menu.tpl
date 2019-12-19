{**
 * Меню
 *
 * @param string  $mods
 * @param string  $classes
 * @param array   $attributes
 *}
 
{extends "component@component.layout"}

{block name="options" append}
    {component_define_params params=[ 
        'activeItem', 
        'items' 
    ]} {$params|print_r}
{/block}


{block name="content" append}44
{*    {component "menu.{$template}" params=$params activeItem=$activeItem mods=$mods classes=$classes}*}
{/block}


