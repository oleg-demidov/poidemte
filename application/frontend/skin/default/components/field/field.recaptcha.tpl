{**
 * Recaptcha
 *
 * @param string  $readonly          Список классов основного блока (через пробел)
 * 
 *}
{extends "component@field"}

{block name="options" append}
    {$attr.type = "hidden"}

    {$classes = "form-control"}
{/block}

{block name="field_input"}
    <div id="g-recaptcha-{$attr.id}" data-field-id="{$attr.id}" class="g-recaptcha" data-sitekey="{Config::Get('module.validate.recaptcha.site_key')}"></div>
    <input  style="display:none;" {cattr list=$attr} >
{/block}
    


