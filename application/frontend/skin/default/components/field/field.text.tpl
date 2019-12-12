{**
 * Текстовое поле
 *}
 
{extends "component@field"}

{block name="options" append}
    
    {$attr.type = 'text'}
    
    {$component = "form-control"}

{/block}


{block name="field_input"}
    
    <input {cattr list=$attr}>
    
{/block}
    


