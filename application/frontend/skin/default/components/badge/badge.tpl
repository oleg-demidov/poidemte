{**
 * Значки
 *
 *}

{extends "component@badge.layout"}

{block 'options' append}
    {* Название компонента *}
    {$component = "badge"}

{/block}


{block 'content'}
    <span class="{$component} {cmods name=$component mods=$mods delimiter="-"} {$classes}" {cattr list=$attr}>{$text}</span>
{/block}