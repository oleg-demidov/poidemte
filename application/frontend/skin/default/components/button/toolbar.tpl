{**
 * Панель инструментов
 *
 * @param array   $groups          Массив параметров кнопок
 *}

{extends "component@component.layout"}

{block 'options' append}
    {component_define_params params=[ 
        'groups'
    ]}
    
    {$role = $role|default:"toolbar"}
    
{/block}

{block 'content'}
    {strip}
    <div class="btn-toolbar {$classes}" {cattr list=$attributes} >
        {foreach $groups as $item}
            {strip}
            {if is_array($item)}
                {component 'button.group' params=$item}
            {else}
                {$item}
            {/if} 
            {/strip}
        {/foreach}
    </div>   
    {/strip}
{/block}