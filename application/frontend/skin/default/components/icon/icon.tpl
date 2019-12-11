{**
 * Иконка
 *
 * @param string $style
 *}
{extends "component@icon.layout"}

{block name="options" append}
    {$component = 'fa'}
    {component_define_params params=[ 'style' ]}
    
    {assign var=explodeIcon value=":"|explode:$icon}
    {$icon = $explodeIcon[0]}
    {if $explodeIcon[1]}
        {$style = $explodeIcon[1]}
    {/if}

{/block}


{block name="content"}
    <i class="{$component} fa{$style|default:"r"} fa-{$icon} {cmods name=$component mods=$mods delimiter='-'} {$classes}" {cattr list=$attributes}></i>
{/block}

