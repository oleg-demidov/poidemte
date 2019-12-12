{**
 * Форма
 *}
 
{extends "component@form.layout"}

{block 'options' append}
        
    {$attr['action']    = $action}
    {$attr['method']    = $method}
    {$attr['name']      = $name}
    {$attr['enctype']   = $enctype|default:"multipart/form-data"}
    {$attr['class']     = $classes}
    
    {if $validate.remote}
        {$attr['data-form-validate'] = true}
        {$attr['novalidate'] = true}
    {/if}
    
    {if $validate.entity}
        {$attr['data-param-entity'] = $validate.entity}
        {$attr['data-param-scenario'] = $validate.scenario}
    {/if}

    
{/block}

{block "content" append}
    <form  {cattr list=$attr}>
        {foreach $items as $item}
            {if is_array($item)}
                {component "field" template=$item.type params=$item validate=$validate}
            {else}
                {$item}
            {/if}
        {/foreach}
        
        {$content}
    </form>
{/block}
