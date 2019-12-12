{**
 * Текстовая область
 *
 *}
 
{extends "component@field"}

{block name="options" append}
    {component_define_params params=[  
        'rows'
    ]}
    
    {$classes = "form-control"}
    
    {$attr.rows = $rows|default:3}
{/block}

{block name="field_input"}

    <textarea {cattr list=$attr}>{$value}</textarea>
        
{/block}
    


