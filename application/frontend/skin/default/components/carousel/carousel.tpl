{**
 * Карусель
 *
 * @param bool    $indicators       Индикаторы
 * @param bool    $controls         Кнопки Previous Next
 * @param int     $interval         Прормежуток по времени
 *}
 
{extends "component@carousel.layout"}

{block 'options' append}
    {component_define_params params=[ 
        'indicators', 
        'controls', 
        'interval' 
    ]}
    {* Название компонента *}
    {$component = "carousel"}
    
    {if $interval}
        {$attr['data-interval'] = $interval}
    {else}
        {$attr['data-interval'] = "false"}
    {/if}
    
    
    {if count($items)<2}
        {$indicators = false}
        {$controls = false}
    {/if}
    
    {$id = "carousel{math equation='rand()'}"}
{/block}

{block 'content'}
    <div id="{$id}" class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" {cattr list=$attr} data-ride="carousel">
        {if $indicators}
            <ol class="carousel-indicators">
                {foreach $items as $key => $item name="carousel_indicators"}
                    <li data-target="#{$id}" data-slide-to="{$smarty.foreach.carousel_indicators.index}"
                        {if {$smarty.foreach.carousel_indicators.first}}
                            class="active"
                        {/if}></li>
                {/foreach}
            </ol>
        {/if}
        
        <div class="carousel-inner">
            {foreach $items as $item name="carousel_items"}
                <div class="carousel-item {if {$smarty.foreach.carousel_items.first}}active{/if}">
                    <a href="{$item.href}" data-lightbox><img class="d-block w-100" src="{$item.src}" alt="{$item.alt}"></a>
                </div>
            {/foreach}
        </div>
        {if $controls}
            <a class="carousel-control-prev" href="#{$id}" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#{$id}" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        {/if}

        
    </div>
{/block}