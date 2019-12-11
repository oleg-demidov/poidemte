{**
 * Табы
 *
 * @param array      $items  
 * @param string     $effect    Эффект скрытия показа
 * 
 *}
 {extends "component@nav.layout"}
 
{block name="options" append}
    {component_define_params params=[ 
        'items',
        'effect' => 'fade'
    ]}
    
    {$classes = "tab-content {$classes}"}
    
{/block}


{block 'content'}{strip}
    <div {cattr list=$attr}>
        {foreach $items as $item}
            {$isActive = $item.active}
            {if $activeItem}
                {$isActive = ($activeItem == $item.name) }
            {/if}
                        
            {if $item.is_enabled|default:true}
                <div class="tab-pane {$effect} {if $isActive}show active{/if} {$item.classes} w-100" 
                     id="{$item.id}"  role="tabpanel"  aria-labelledby="{$item.id}">
                    {$item.content}
                </div>
            {/if}
        {/foreach}
    </div>
{/strip}{/block}
