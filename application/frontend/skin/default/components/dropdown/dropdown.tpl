{**
 * Выпадаеющее меню
 *
 * 
 *}
 
{extends "component@dropdown.layout"}
 
{block name="options" append}
        
    {$classes= "{$classes} dropdown-toggle"}
    
    {$attr['data-toggle'] = "dropdown"}
{/block}

{block 'content' append}
    {component "button" 
        text = $text
        attr = $attr
        classes = $classes
        mods = $mods}
    
    <div class="dropdown-menu">
        {foreach $items as $item}
            {if $item == '-'}
                <div class="dropdown-divider"></div>
            {/if}

            {component "dropdown.item" params=$item}

        {/foreach}
    </div>
{/block}
