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
    <span  {cattr list=$attr}>{$text}</span>
{/block}