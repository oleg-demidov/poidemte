{**
 * Элемент Навигации
 *
 * 
 *}
 
{extends "component@nav.item-layout"}
 
{block 'options' append}
        
    {if $active}
        {$classes = "{$classes} active"}
    {/if}
    
    {if $disabled}
         {$classes = "{$classes} disabled"}
    {/if}

{/block}

{block 'content'}{strip}
    {if $enable|default:true}
        <li class="nav-item  {$classes}">
            <a class="nav-link  {$classes}" href="{$url}"  {cattr list=$attr}>

                {* Иконка *}
                {if $icon}
                    {if is_array($icon)}
                        {component "icon" params=$icon}
                    {else}
                        {component "icon" icon=$icon style='s' classes="{if $text}mr-1{/if}"}
                    {/if}                    
                {/if}

                {* Текст  *}
                {$text}

                {* Значок после текста *}
                {if $badge}
                    {if is_array($badge)}
                        {component "badge" params=$badge}
                    {else}
                        {component "badge" text=$badge}
                    {/if}                    
                {/if}
            </a>
        </li>
    {/if}

    
{/strip}{/block}

