{**
 * Юзербар
 *}
 


{if $oUserCurrent}
    {insert name='block' block='BlockMenuUser' params=[  ]}

{else}
    {if !in_array(Router::GetActionEvent(), ["login", "register"])}

        {$items = [
            [   
                icon        => [ icon => "sign-in-alt:s" , classes => "d-md-none d-inline"],
                text        => "<span class='d-none d-md-block'>{lang 'auth.login.title'}</span>",        
                attr        => [ "data-toggle"=>"tab", role=>"tab"], 
                url         => "#tab_login",
                role        => "tab"
            ],
            [ 
                icon        => [ icon => "user-plus:s", classes => "d-md-none d-inline"],
                text        => "<span class='d-none d-md-block'>{lang 'auth.registration.title'}</span>", 
                attr        => [ "data-toggle"=>"tab", role=>"tab"], 
                url         => "#tab_register" 
            ]
        ]}

        {component "nav" 
            classes = "justufy-content-center" 
            hook    = "userbar" 
            items   = $items}
    {/if}
{/if}
    
   
