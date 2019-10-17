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



{block "options" append}
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
    {$attributes["aria-describedby"] = "{$attributes.id}Help"}
    {if $value}
        {$attributes.value = $value}
    {/if}
    
    
    
{/block}
  

{block name="content"}
    
    
    {if $custom}
        {$classes = "{$classes} custom-{$type}"}
        {$component = {$componentGroup|default:"custom-control"}}
    {else}
        {$component = {$componentGroup|default:"form-group"}}
    {/if}

    {if $prepend}
        {$component = "input-group"}
    {/if}


    <div class="{$component} {cmods name=$component mods=$bmodsGroup delimiter="-"} {$classesGroup}" 
        {if $popover}{component "popover" params=$popover} {/if} {cattr list=$attributesGroup}>

        {if $prepend}
            <div class="input-group-prepend">
                <div class="input-group-text">
                    {$prepend}
                </div>
            </div>
        {/if}

        {if $label}
            <label for="{$attributes.id} {$classesLabel}">{$label}</label>
        {/if}

        {block name="field_input"}{/block}

        {if $desc}
            <small id="{$attributes.id}Help" class="form-text text-muted {$classesDesc}">{$desc}</small>
        {/if}

        {if !$prepend}
            <div class="invalid-feedback">
                {$validate.msgError|default:$msg}       
            </div>
            <div class="valid-feedback">
                {$validate.msgSuccess}
            </div>
        {/if}
    </div>
    
{/block}

