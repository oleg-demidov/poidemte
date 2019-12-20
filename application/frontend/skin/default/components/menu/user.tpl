{**
 * Меню пользователя
 *
 * 
 *}
 
{extends "component@nav.layout"}

{block name="options" append}
    {component_define_params params=[ 
        'activeItem', 
        'items'    
    ]} 
{/block}

{block name="content" append}
    {$dropitems = []} 

    {if $oUserCurrent->getIsAdmin()}
        {$dropitems[] = [ text => $aLang.admin.title, url => {router page="admin"}]}  
    {/if}

    {$dropitems[] = {component "button" com="dropdown-item"
        name    = 'feedback'
        text    = {lang 'user.userbar.nav.feedback'}
        attributes = ['data-toggle' => 'modal', 'data-target' => '#modalFeedback']
        url     = '#'
    }}

    {component 'nav' 
        bmods="fill"
        classes=""
        items = [
            {component 'dropdown' 
                url     = $oUserCurrent->getUserWebPath()
                text    = {component 'user.inline' oUser=$oUserCurrent}
                classes = "text-nowrap"
                items   = $dropitems},

            [ 
                icon   => [ icon => "sign-out-alt", display => "s", classes => "d-md-none d-inline"],
                'text' => "<span class='d-none d-md-block'>{lang 'auth.logout'}</span>",  
                'url' => "{router page='auth'}logout/?security_ls_key={$LIVESTREET_SECURITY_KEY}" 
            ]
        ]
    }
{/block}

