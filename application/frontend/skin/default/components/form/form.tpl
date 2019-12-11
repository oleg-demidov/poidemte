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
    
{/block}

{block "content" append}
    <form  {cattr list=$attr}>
        {foreach $items as $item}
            {if is_array($item)}
                {component "field" template=$item.type params=$item}
            {else}
                {$item}
            {/if}
        {/foreach}
        
        {$content}
    </form>
{/block}
