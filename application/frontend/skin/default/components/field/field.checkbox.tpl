{**
 * Флажок
 *
 * @param boll  $checked            Выбран
 * 
 *}
 
{extends "component@field.layout"}



{block name="options" append}
    {component_define_params params=[ 
        'checked'
    ]}
    
    {$classes = "custom-control-input"}
    
    {$attr.type = 'checkbox'}
    
    {if $checked}
        {$attr.checked = true}
    {/if}
    
    {if $disabled}
        {$attr.disabled = true}
    {/if}
    
{/block}

{block name="content"}
    <div class="custom-control custom-{$attr.type} {cmods name='custom-control' mods=$mods delimiter="-"}">
        <input {cattr list=$attr}>
        <label class="custom-control-label" for="{$attr.id}">{$label}</label>
    </div>
    
    <div class="invalid-feedback">
        {$validate.msgError|default:$msg}       
    </div>
    <div class="valid-feedback">
        {$validate.msgSuccess}
    </div>
{/block}


    


