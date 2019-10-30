{**
 * Выпадаеющее меню
 *
 * 
 *}
 
{extends "component@dropdown.layout"}
 
{block name="options" append}
    
    {$component="dropdown"}
    
    {$classes= "dropdown-toggle"}
    
    {$attr['data-toggle'] = "dropdown"}
{/block}

{block 'content' append}
    <div class="dropdown-menu">
        {foreach $items as $item}
            {if $item == '-'}
                <div class="dropdown-divider"></div>
            {/if}

            {component "dropdown.item" params=$item}

        {/foreach}
    </div>
{/block}
