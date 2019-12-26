{**
 * Основная навигация
 *
 * @param array   $items       Элементы
 * @param array   $itemsCollapse       Элементы сворачиваемые
 * 
 *}
 
{extends "component@component.layout"}
 
{block name="options" append}
    {$component = "navbar"}

    {component_define_params params=[ 'brand', 'url', 'items', 'before', 'after', 'classesBrand' ]}

    {$id = "navbar{math equation='rand()'}"}
{/block}

{block name="content" append}

    <nav {cattr list=$attr}>
        
        {$before}

        <div class="collapse navbar-collapse" id="{$id}">
            {foreach $items as $item}
                {$item}
            {/foreach}   
        </div>

        {$after}

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#{$id}" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

    </nav>
{/block}


