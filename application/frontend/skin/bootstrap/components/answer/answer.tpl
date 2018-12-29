{**
 * Предложение
 *}
 
{component_define_params params=[ 'entity', 'deleted', 'redirect']}

<div class="response mt-2">
    <div class="row">
        <div class="col-3">{component "user" oUser=$entity->getUser()}</div>
        <div class="col-9 align-self-end text-muted">{$entity->getDateCreateFormat()}</div>
    </div>
    <div class="row m-3">
        <div class="col-12 pl-5">
            {component "text" text=$entity->getText() classes="text-secondary"}
            
            {if is_array($entity->getMedia()) and count($entity->getMedia())}
                {$items = []}
                {foreach $entity->getMedia() as $oMedia}
                    {$items[] = [
                        href    => $oMedia->getFileWebPath(),
                        src     => $oMedia->getFileWebPath('x200crop')
                    ]}
                {/foreach}
                <div class="row">
                    <div class="col-sm-6 col-md-3">
                        {$controls = (count($items)>1)}
                        {component 'bs-carousel' 
                            classes     = "slide w-100"  
                            indicators  = $controls 
                            controls    = $controls  
                            items       = $items}
                    </div>
                </div>
                    
                {if $deleted}
                    <form data-url="{router page='ajax/talk/message-delete'}" data-type="form-ajax">
                        <input type="hidden" name="id" value="{$entity->getId()}">
                        <input type="hidden" name="redirect" value="{$redirect}">
                        {component "bs-button" 
                            attributes = ['data-confirm-remove' => true]
                            bmods   = "link"  
                            classes = "text-danger" 
                            type    = "submit" 
                            text    = $aLang.common.remove}
                    </form>
                {/if}
                
            {/if}
        </div>
    </div>
</div>