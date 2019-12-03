{**
 * Группировка полей
 * @param array  $prependItems      Впереди
 * @param array  $items             Основное
 * @param array  $appendItems       Сзади
 *}

{extends "component@component.layout"}
 
{block name="options" append}
    {component_define_params params=[ 
        'prependItems',
        'items',
        'appendItems'
    ]}
    
    {$classes = "{$classes} input-group"}

{/block}

{block 'content'}
    <div {cattr list=$attr}>
        <div class="input-group-prepend">
            {foreach $prependItems as $itemPrepend}
                {$itemPrepend}
            {/foreach}
        </div>
        
        {foreach $items as $item}
            {$item}
        {/foreach}
            
        <div class="input-group-append">
            {foreach $appendItems as $appendItem}
                {$appendItem}
            {/foreach}
        </div>
    </div>
{/block}

