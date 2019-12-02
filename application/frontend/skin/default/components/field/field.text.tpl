{**
 * Текст
 *}
 
{extends "component@field.layout"}

{block name="options" append}
    
    {$attr.type = 'text'}
    
    {$attr.class = "form-control {cmods name='form-control' mods=$mods delimiter='-'} {$classes} "}

{/block}


{block name="content" append}
    {if $label}
        <label for="{$attr.id}">{$label}</label>
    {/if}
    
    <input {cattr list=$validateRules} {cattr list=$attr}>
    <div class="invalid-feedback">
        {$validate.msgError|default:$msg}       
    </div>
    <div class="valid-feedback">
        {$validate.msgSuccess}
    </div>
{/block}
    


