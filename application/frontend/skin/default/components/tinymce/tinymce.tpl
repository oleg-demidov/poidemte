
{extends "component@field.textarea"}

{block name="options" append}
    
    {component_define_params params=[ 'set' ]}
    
    {$attr =  [ 'data-editor' => "tinymce", 'data-editor-set' => $set|default:'default' ]}
    
{/block}
