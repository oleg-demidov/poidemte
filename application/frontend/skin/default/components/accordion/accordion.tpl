{**
 * Аккордион
 *}
 
{extends "component@accordion.layout"}

{block 'options' append}
    {$attr.id = "accordion{math equation='rand()'}"}
    
    {$classes = "{$classes} accordion"}
{/block}

{block "content" append}
    <div  {cattr list=$attr}>
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

                <div id="{$collapseId}" class="collapse {if $collapseActive}show{/if}" aria-labelledby="headingOne" data-parent="#{$attr.id}">
                    <div class="card-body">
                        {$item.content}
                    </div>
                </div>
            </div> 
            
        {/foreach}
    </div>

{/block}
