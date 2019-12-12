{**
 * Файл
 *
 * @param boll  $disabled           Отключено
 * @param boll  $inline             На одной строке
 * @param boll  $radio              Выбор
 * @param boll  $checked            Выбран
 * 
 *}
 
{extends "component@field.layout"}

{block name="options" append}
    
    {$classes = "custom-file-input"}
        
    {if $disabled}
        {$attr.disabled = true}
    {/if}
    
    {$attr.type = "file"}
    
{/block}

{block name="content"}
    <div class="form-group custom-file">
        <input {cattr list=$attr}>
        
        <label class="custom-file-label" for="customFile">{$label}</label>
       
    </div>
{/block}




