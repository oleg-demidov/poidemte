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
    {$attr['data-validate-remote'] = "false"}
    
    {if $validate.remote}
        {$attr['data-validate-remote'] = "true"}
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
                {if !$item.validate}
                    {$item.validate = $validate}
                {/if}

                {component "field" template=$item.type params=$item }
            {else}
                {$item}
            {/if}
        {/foreach}
        
        {$content}
    </form>
{/block}
