{**
 * Форма
 *}
 
{extends "component@form.layout"}

{block 'options' append}
        
    {$attr['action']    = $action}
    {$attr['method']    = $method}
    {$attr['name']      = $name}
    {$attr['enctype']   = $enctype|default:"multipart/form-data"}
    
{/block}

{block "content" append}
    <form class="{$classes}" {cattr list=$attr}>
        {foreach $items as $item}
            {$item}
        {/foreach}
        
        {$content}
    </form>
{/block}
