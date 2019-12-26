{**
 * Хлебные крошки
 *}
 
{extends "component@breadcrumb.layout"}
 
{block name="options" append}
    {* Название компонента *}
    {$component = "breadcrumb"}
{/block}

{block 'content'}
    <ol {cattr list=$attr}>
        {foreach $items as $item name="breadcrumb_for"}
            {if $smarty.foreach.breadcrumb_for.last}
                <li class="breadcrumb-item active" aria-current="page">{$item.text}</li>
            {else}
                <li class="breadcrumb-item"><a href="{$item.url}">{$item.text}</a></li>
            {/if}
        {/foreach}
    </ol>
{/block}