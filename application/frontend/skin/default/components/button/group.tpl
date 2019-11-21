{**
 * Группа кнопок
 *}
 
{extends "component@button.layout-group"}

{block 'options' append}
   
    {$attr['role'] = "group"}
    
    {$component = "btn-group"}
    
    {if $mods|strpos:"vertical" !== false}
        {$component = null}
        {$classes = "{$classes} btn-group-vertical"}
    {/if}
    
{/block}

{block "content"}{strip}
   
    <div {cattr list=$attr}>
        {foreach $items as $item}
            {if is_array($item)}
                {component "button" params=$item}
            {else}
                {$item}
            {/if}
        {/foreach}
    </div>
        
{/block}{/strip}
