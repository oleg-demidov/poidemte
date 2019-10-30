{**
 * Карточка
 *
 * @param mixed   $body            Тело карточки
 * @param array   $img             Картинка вместо верхней части [src, alt]
 *}

{extends "component@card.layout"}

{block 'options' append}
    {component_define_params params=[ 
        'img',
        'body'
    ]}
    
    {$tag = $tag|default:"div"}
    
    {* Название компонента *}
    {$component = "card"}
{/block}

{block "content" append}
    <{$tag} class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" {cattr list=$attr}>
        <img class="card-img-top" src="{$img.src}" alt="{$img.alt}">

        {if $header}
            <div class="card-header">
                {$header}
            </div>
        {/if}

        {if $body}
            <div class="card-body">
                {$body}
            </div>
        {/if}

        {$content}

        {if $footer}
            <div class="card-footer">
                {$footer}
            </div>
        {/if}
    </{$tag}>
{/block}