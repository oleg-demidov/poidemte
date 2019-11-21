{**
 * Коллапс
 *}
 
{extends "component@collapse.layout"}

{block 'options' append}
    
    {$attr.id = $id|default:"collapse{math equation='rand()'}"}
    
{/block}

{block "content" append}
    {if $text}
        <a class="link" data-toggle="collapse" href="#{$attr.id}" role="button" aria-expanded="false" aria-controls="{$attr.id}">
            {$text}
        </a>
    {/if}
    
    {if $toggle}
        {$toggle}
    {/if}

    
    <div {cattr list=$attr}>
        {$content}
    </div>

{/block}
