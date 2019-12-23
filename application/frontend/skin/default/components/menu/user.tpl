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
    {$dropitems = [
        [
            icon    => "user:r",
            text    => {lang 'user.userbar.nav.profile'}, 
            url     => $oUserCurrent->getProfileUrl() 
        ]
    ]} 

    {if $oUserCurrent->getIsAdmin()}
        {$dropitems[] = [ text => $aLang.admin.title, url => {router page="admin"}]}  
    {/if}

    {$dropitems[] = [
        icon    => "tools:s",
        text    => {lang 'user.userbar.nav.settings'}, 
        url     => {router page="profile/{$oUserCurrent->getLogin()}/settings"} 
    ]}
    
    {$dropitems[] = [
        icon    => "sign-out-alt:s",
        text    => {lang 'auth.logout'}, 
        url     => "{router page='auth'}logout/?security_ls_key={$LIVESTREET_SECURITY_KEY}" 
    ]}

    {component 'button.group' 
        classes     = ""
        items       = [
            {component 'dropdown' 
                right   = true
                url     = $oUserCurrent->getUserWebPath()
                text    = {component 'user.inline' oUser=$oUserCurrent}
                classes = "text-nowrap"
                items   = $dropitems}
        ]
    }
{/block}