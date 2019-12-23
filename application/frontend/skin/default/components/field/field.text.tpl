{**
 * Текстовое поле
 *}
 
{extends "component@field"}

{block name="options" append}
    
    {$attr.type = 'text'}
    
    {$component = "form-control"}
    
    {if $value}
        {$attr.value = $value}
    {/if} 

{/block}


{block name="field_input"}
    
    <input {cattr list=$attr}>
    
{/block}
    


