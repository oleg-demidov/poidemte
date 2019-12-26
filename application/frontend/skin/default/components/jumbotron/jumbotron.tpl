{**
 * jumbotron
 *
 * @param string   $title           Заголовок
 * @param string  $html             HTML
 * 
 *}

{extends "component@jumbotron"}
 
{block 'options' append}
    
    {component_define_params params=[ 
        'title',  
        'html' 
    ]}
    
    {$component="jumbotron"}
{/block}

{block 'content'}
    <div  {cattr list=$attr}>
        {if $title}
            <h1 class="display-4">{$title}</h1>
        {/if}

        {if $content}
            <p class="lead">{$content}</p>
        {/if}
        
        {$html}        
    </div>
{/block}

