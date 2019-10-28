{**
 * Уведомления
 *
 * @param string  $dismissible          Закрываемое
 *}

{extends "component@alert.layout"}

{block 'options' append}
    {* Название компонента *}
    {$component = "alert"}

    {component_define_params params=[ 
        'dismissible'
    ]}
{/block}


{block 'content'}
    <div class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" {cattr list=$attr} role="alert">
        {if $title}
            <h4 class="alert-heading">{$title}</h4>
        {/if}

        {$text}
        {if $dismissible}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        {/if}
    </div>
{/block}