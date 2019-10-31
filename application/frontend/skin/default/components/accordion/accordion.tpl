{**
 * Аккордион
 *}
 
{extends "component@accordion.layout"}

{block 'options' append}
    {$id = "accordion{math equation='rand()'}"}
{/block}

{block "content" append}
    <div id="{$id}" class="accordion {$classes}" {cattr list=$attr}>
        {foreach $items as $item}
            {$collapseActive  = ($activeItem and $item.name == $activeItem) or $item.active}
            
            {$collapseId = "collapse{math equation='rand()'}"}
            <div class="card {cmods name="card" mods=$item.mods delimiter="-"} {$item.classes}" {cattr list=$item.attr}>
                <div class="card-header">
                    {component "button"
                        mods = "link"
                        text = $item.text
                        attr = [
                            'data-toggle'   => "collapse",
                            'data-target'   => "#{$collapseId}",
                            'aria-expanded' => "true",
                            'aria-controls' => $collapseId
                        ]
                    }
                </div>

                <div id="{$collapseId}" class="collapse {if $collapseActive}show{/if}" aria-labelledby="headingOne" data-parent="#{$id}">
                    <div class="card-body">
                        {$item.content}
                    </div>
                </div>
            </div> 
            
        {/foreach}
    </div>

{/block}
