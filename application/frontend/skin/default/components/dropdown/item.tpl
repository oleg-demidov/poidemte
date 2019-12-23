{**
 * Элемент выпадающего списка
 *
 *}
 
{extends "component@dropdown.item-layout"}
 
{block 'content' append}
    <a class="dropdown-item {$classes}" {cattr list=$attr} href="{$url}">
        {* Иконка *}
        {if $icon}
            {if is_array($icon)}
                {component "icon" params=$icon}
            {else}
                {component "icon" icon=$icon style='s' classes="{if $text}mr-1{/if}"}
            {/if}                    
        {/if}
            
        {$text}
        
        {* Значок после текста *}
        {if $badge}
            {if is_array($badge)}
                {component "badge" params=$badge}
            {else}
                {component "badge" text=$badge mods="primary"}
            {/if}                    
        {/if} 
    </a>
{/block}
