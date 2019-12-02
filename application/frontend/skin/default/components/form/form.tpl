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

{block "content" append}{if $attr.action}eee{/if}
    <form  {cattr list=$attr}>
        {foreach $items as $item}
            {$item}
        {/foreach}
        
        {$content}
    </form>
{/block}
