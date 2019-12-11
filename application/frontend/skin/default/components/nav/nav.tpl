{**
 * Навигация
 *
 * @param string    $justify        Горизонтальное выравнивание
 * @param bool      $vertical       
 * 
 *}
 
{extends "component@nav.layout"}
 
{block name="options" append}
    
    {$component = "nav"}
    
{/block}


{block 'content'}{strip}
    <ul {cattr list=$attr}>
        {foreach $items as $item}
            {if !is_array($item)}
                {$item}
            {else}

                {component "nav.item" 
                    params  = $item
                    active  = ($activeItem and $item.name == $activeItem)
                }
                
            {/if}            
        {/foreach}
    </ul>
{/strip}{/block}

