{**
 * Группа кнопок
 *}
 
{extends "component@button.layout-group"}

{block 'options' append}
   
    {$attr['role'] = "group"}
    
    {$component = "btn-group"}
    
{/block}

{block "content"}{strip}
   
    <div class="{if $mods|strpos:"vertical"=== false}{$component}{/if} {cmods name=$component mods=$mods delimiter="-"} {$classes}" 
          {cattr list=$attr}>
        {foreach $items as $item}
            {if is_array($item)}
                {component "button" params=$item}
            {else}
                {$item}
            {/if}
        {/foreach}
    </div>
        
{/block}{/strip}
