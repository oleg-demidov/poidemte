{**
 * Select
 *
 * @param array  $selected          Имена выбраных элементов
 * @param array  $items             Опции селекта
 * 
 *}
 
{extends "component@field"}



{block name="options" append}
    
    {component_define_params params=[ 
        'items', 
        'selected',
        'multiple',
        'size'
    ]}
    
    
    {$component = "custom-select"}
    
    
    {if $size}
        {$attr.size = $size}
    {/if}
    
    {if $selected and !is_array($selected)}
        {$selected = [$selected]}
    {/if}

    {if $multiple}
        {$attr.multiple = true}
    {/if}
    
{/block}

{block name="field_input"}
    
    <select {cattr list=$attr}>
        {foreach $items as $item}
            {$bSelectItem = (in_array($item.value, $selected) or $item.selected)}
            <option value="{$item.value}"{if $bSelectItem}selected{/if}>{$item.text}</option>
        {/foreach}
    </select>
    
{/block}
    


