{**
 * Форма
 *
 
 * @param string  $bmods="success"  Список модификторов основного блока (через пробел)
 * @param string  $bg="light"       Модификтор фона
 * @param string  $classes          Список классов основного блока (через пробел)
 * @param array   $attributes       Список атрибутов основного блока
 * 
 *}
 
 {extends "component@field.abstract"}

{$component = "form-control"}
{component_define_params params=[ 'bmods', 'bg',  'classes', 'popover', 'attributes', 
    'classesGroup', 'attributesGroup', 'classesLabel', 'classesDesc', 'custom', 'size', 'prepend']}

{if $custom}
    {$component = "custom-control"}
{/if}
    
{if $size}
    {$classes ="{$classes} form-control-{$size}"}
    {$classesLabel="{$classesLabel} form-control-{$size}"}
{/if}

{if ! $attributes.triggers}
    {$attributes.triggers = "change keyup"}
{/if}

{block name="field_options"}{/block}


{$attributes["aria-describedby"] = "{$attributes.id}Help"}
{if $value}
    {$attributes.value = $value}
{/if}

  

{capture name="content"}
    {block name="field_content"}
        {if $label}
            <label for="{$attributes.id} {$classesLabel}">{$label}</label>
        {/if}
        {block name="field_input"}{/block}
        {if $desc}
            <small id="{$attributes.id}Help" class="form-text text-muted {$classesDesc}">{$desc}</small>
        {/if}
    {/block}
    
    {if !$prepend}
        <div class="invalid-feedback">
            {$validate.msgError|default:$msg}       
        </div>
        <div class="valid-feedback">
            {$validate.msgSuccess}
        </div>
    {/if}
    
{/capture}

{block name="out_content"}
    {component "form.group" 
        prepend=$prepend
        popover=$popover
        custom=$custom 
        classes=$classesGroup 
        bmods=$bmodsGroup 
        type=$type 
        attributes = $attributesGroup
        componentGroup=$componentGroup 
        content=$smarty.capture.content}
{/block}
