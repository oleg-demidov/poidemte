{**
 * Табы
 *
 * @param array     $items
 * @param string    $activeItem
 * 
 *}
 
  
{extends "component@component.layout"}
 
{block name="options" append}
    {component_define_params params=[ 
        'items', 
        'activeItem'
    ]}
    
{/block}

{block 'content'}{strip}
    {component 'tabs.list' params=$params}
    {component 'tabs.panes' params=$params}    
{/strip}{/block}

