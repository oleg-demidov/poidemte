{**
 * Модальное окно
 *
 * 
 *}
 
{extends "component@modal.layout"}

{block 'options'}
    
    {component_define_params params=[ 
        'effect' => "fade",  
        'footer', 
        'id'        
    ]}
    
    {$component="modal"}
    
    {$classes = "{$classes} {$effect}"}
{/block}

{block 'content'}
    <div  {cattr list=$attr}>
        <div class="modal-dialog {cmods name=$component mods=$bmods delimiter="-"} " role="document">
            <div class="modal-content">
                {if $header}
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{$header}</h5>
                        {if $closed}
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        {/if}                        
                    </div>
                {/if}

                {if $content}
                    <div class="modal-body {$classesBody}">
                        {$content}
                    </div>
                {/if}

                {if $showFooter or $footer}

                    {if $footer}
                        <div class="modal-footer">
                            {$footer}
                        </div>
                    {else}
                        <div class="modal-footer">
                            {$primaryButton.attributes['data-type'] = "btn-modal" }
                            {component "button" 
                                params=$primaryButton 
                                text={$primaryButton.text|default:"Ok"}}
                            {if $closed}
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$closeText|default:$aLang.common.close}</button>
                            {/if} 
                        </div>
                    {/if}  
                {/if}      
            </div>
        </div>
    </div>
{/block}

