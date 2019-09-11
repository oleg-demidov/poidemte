{**
 * Сменить пароль
 *}
{extends 'layouts/layout.base.tpl'}

{block 'layout_content'}
    {capture name="form"}
        <form class=""  data-type="form-ajax" data-url='{router "{$oUserProfile->getLogin()}/settings/security-ajax"}'>
            

            <div class="d-flex justify-content-center">
                {component 'button' 
                    classes = ""
                    name='submit_settings' 
                    type="submit" 
                    bmods='primary' 
                    text=$aLang.common.save}
            </div>
        </form>
    {/capture}
    
    {component 'card' bg="light" content=[
        
        [   
            type => 'body',
            content => $smarty.capture.form
        ]
    ]}
    
{/block}