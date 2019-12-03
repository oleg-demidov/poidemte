{**
 * Диапазон
 *
 * @param int  $min          Минимальное значение
 * @param int  $max          Максимальное значение
 * 
 *}
 
{extends "component@field"}

{block name="options"}
    
    {component_define_params params=[ 
        'min', 
        'max'
    ]}

    {$classes = "custom-range"}

    {if $min}
        {$attr.min = $min}
    {/if}

    {if $max}
        {$attr.max = $max}
    {/if}
    
    {$attr.type = 'range'}
{/block}

{block name="field_input" append}
    <input {cattr list=$validateRules} {cattr list=$attr}>
{/block}
    


