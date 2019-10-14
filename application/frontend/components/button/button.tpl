{**
 * Кнопка
 *
 *}
 
{extends "component@button.abstract"}

{block 'options' append}
    {component_define_params params=[ 
        'text', 
        'disabled'
    ]}
    {* Название компонента *}
    {$component = $com|default:"btn"}
    {$tag = $tag|default:"button"}
{/block}

{block 'content'}{strip}
    {if $url}
        <a class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" 
           {if $popover}{component "popover" params=$popover} {/if} 
           {cattr list=$attr} {if $disabled}aria-disabled="true"{/if} href="{$url}" role="button">
            {if $icon}
                {if is_array($icon)}
                    {component "icon" params=$icon}
                {else}
                    {component "icon" icon=$icon display='s' classes="{if $text}mr-1{/if}"}
                {/if}                    
            {/if}
            {$text}
        </a>
    {else}
        {if $tag != "input"}
            <{$tag} type="{$type|default:"button"}" class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" 
                {if $popover}
                    {if is_array($popover)}
                        {component "popover" params=$popover}
                    {else}
                        {component "popover" content=$popover}
                    {/if}
                {/if} 
                {cattr list=$attr}>
                {if $icon}
                    {if is_array($icon)}
                        {component "icon" params=$icon}
                    {else}
                        {component "icon" icon=$icon display='s' classes="{if $text}mr-1{/if}"}
                    {/if}                    
                {/if}
                <span btn-text>{$text}</span>
                {if $badge}
                    {if is_array($badge)}
                        {component "badge" params=$badge}
                    {else}
                        {component "badge" text=$badge bmods=$bmods}
                    {/if}                    
                {/if}
            </{$tag}>
        {else}
            <input class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" 
                   {if $popover}{component "popover" params=$popover}{/if}
                {cattr list=$attr} type="{$type|default:"button"}" value="{$value}">
        {/if}
    {/if}    
{/strip}{/block}