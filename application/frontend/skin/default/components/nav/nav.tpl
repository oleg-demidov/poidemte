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


{block 'content'}
    <ul class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" {cattr list=$attributes}>
        {foreach $items as $item}
            {if !is_array($item)}
                {$item}
            {else}

                {component "nav.item" 
                    active  = ($activeItem and $item.name == $activeItem)
                    disabled = $item.disabled
                    url     = $item.url|default:$itemsParams.url
                    name    = $item.name|default:$itemsParams.name
                    icon    = $item.icon|default:$itemsParams.icon
                    badge   = $item.badge|default:$itemsParams.badge
                    enable  = $item.enable|default:$itemsParams.enable
                    text    = $item.text|default:$itemsParams.text
                }
                
            {/if}            
        {/foreach}
    </ul>
{/strip}{/block}

