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
        'desc'
    ]}
    
{/block}
  

{block name="content"}
    <div class="form-group">
        {if $prepend}
            <div class="input-group-prepend">
                <div class="input-group-text">
                    {$prepend}
                </div>
            </div>
        {/if}
        
        {if $label}
            <label for="{$attr.id}">{$label}</label>
        {/if}
        
        {block name="field_input"}{/block}
        
        {if $desc}
            <small id="{$attr.id}Help" class="form-text text-muted">{$desc}</small>
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

