{**
 * Поле формы основной шаблон
 *
 * @param string  $prepend          Группировка Перед полем
 * @param string  $desc             Подсказка к полю
 *}
 
{extends "component@field.layout"}

{block "options" append}
    {component_define_params params=[ 
        'prepend',
        'desc',
        'group' => true
    ]}
    
{/block}
  

{block name="content"}
    
    {if $group}
        <div class="form-group">
    {/if}
                
        {if $label}
            <label for="{$attr.id}">{$label}</label>
        {/if}
        
        {block name="field_input"}{/block}
        
        {if $desc}
            <small id="{$attr.id}Help" class="form-text text-muted">{$desc}</small>
        {/if}

        <div class="invalid-feedback">
            {$validate.msgError|default:$msg}       
        </div>
        <div class="valid-feedback">
            {$validate.msgSuccess}
        </div>
      
    {if $group}
        </div>
    {/if}
        
{/block}

