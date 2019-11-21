{**
 * Основной шаблон компонента от него наследуются все шаблоны компонентов
 
 * @param string  $mods = "success" Список модификторов основного блока (через пробел)
 * @param string  $popover          Всплывающий контент на элементе
 * @param string  $classes          Список классов основного блока (через пробел)
 * @param array   $attr             Список атрибутов основного блока
 * @param string  $role             Вспомогательный атрибут role
 * @param string  $tag              Тег основного элемента
 *}

{component_define_params params=[ 
    'attr',  
    'classes',
    'mods',
    'role',
    'popover',
    'tag'
]}

{block 'options'}{/block}

{if $component} 
    {$classes = "{$component} {$classes}"}
{/if}

{if $mods}
    {$classes = "{$classes} {cmods name=$component mods=$mods delimiter='-'}"}
{/if}

{$attr["class"] = $classes}
{$attr["role"] = $role}

{*   для отображения всплывающего элемента*}
{if $popover}

    {if is_array($popover)}
        {foreach $popover as $popover_key => $popover_param}
            {$attr["data-{$popover_key}"] = $popover_param}
        {/foreach}

    {else}
        {$attr["data-toggle"] = "popover"}
        {$attr["data-content"] = $popover}
        {$attr["data-placement"] = "top"}
        {$attr["data-trigger"] = "hover"}
    {/if}
{/if} 

{if $role}
    {$attr['role'] = $role}
{/if}

{strip}
    {block name="before_content"}{/block}

    {block name="content"}{/block}

    {block name="after_content"}{/block}
{/strip}