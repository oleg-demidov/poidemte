{**
 * blankslate
 *
 * @param string $title
 * @param string $text
 * @param boolean $visible
 *}

{extends "component@jumbotron"}
 
{block name="options" append}
    {component_define_params params=[ 
        'visible'   => true
    ]}
    
    {$classes = "{if !$visible}d-none{/if} {$classes} text-center"}
{/block}
