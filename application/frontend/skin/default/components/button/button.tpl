{**
 * Кнопка
 *
 *}
 
{extends "component@button.layout"}

{block 'options' append}
    {* Название компонента *}
    {$component = $com|default:"btn"}
    
{/block}

{block 'content'}{strip}
    {if $tag != "input"}
        <{$tag} {cattr list=$attr} {if $disabled}aria-disabled="true"{/if} >
           
            {* Иконка *}
            {if $icon}
                {if is_array($icon)}
                    {component "icon" params=$icon}
                {else}
                    {component "icon" icon=$icon style='s' classes="{if $text}mr-1{/if}"}
                {/if}                    
            {/if}
            
            {* Текст кнопки *}
            <span btn-text>{$text}</span>
            
            {* Значок после текста *}
            {if $badge}
                {if is_array($badge)}
                    {component "badge" params=$badge}
                {else}
                    {component "badge" text=$badge}
                {/if}                    
            {/if}
        </{$tag}>
    
    {else}
        <input class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}"
             {cattr list=$attr} type="{$type|default:"button"}" value="{$text}">
    {/if}
    
{/strip}{/block}