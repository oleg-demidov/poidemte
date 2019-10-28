{**
 * Иконка
 *
 * @param string $style
 *}
{extends "component@icon.layout"}

{block name="options" append}
    {$component = 'fa'}
    {component_define_params params=[ 'style' ]}
{/block}


{block name="content"}
    <i class="{$component}{$style|default:"r"} fa-{$icon} {cmods name=$component mods=$mods delimiter='-'} {$classes}" {cattr list=$attributes}></i>
{/block}

