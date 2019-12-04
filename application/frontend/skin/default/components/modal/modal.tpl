{**
 * Модальное окно
 *
 * 
 *}
 
{extends "component@modal.layout"}

{block 'options' append}
    
    {component_define_params params=[ 
        'effect'    => "fade",  
        'closed'    => false
    ]}
        {$id}
    {$attr = [ 
        id  => $id,
        role    => 'dialog'
    ]}{$attr|print_r}
    
    {$classes = "modal {$classes} {$effect}"}
{/block}

{block 'content'}
    <div  {cattr list=$attr}>
        <div class="modal-dialog {cmods name='modal-dialog' mods=$mods delimiter="-"} " role="document">
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
                    <div class="modal-body">
                        {$content}
                    </div>
                {/if}

                {if $footer}
                    <div class="modal-footer">
                        {$footer}
                    </div>
                {/if}
                            
            </div>
        </div>
    </div>
{/block}

