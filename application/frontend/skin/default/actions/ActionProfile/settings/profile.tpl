{**
 * Тестовая страница
 *}
{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <h2>
        {lang 'user.settings.profile.title'}
    </h2>
{/block}

{block 'layout_content'}
    
    {component 'form' 
        attr    = [
            'data-action'          => {router page='profile/ajax-settings/profile'},
            'data-form',
            'autocomplete'        => "off",
            'novalidate'
        ]

        method  = "post" 
        name    = "form_settings"
        classes = "mt-3"
        validate = [
            entity      => "User_ValidateProfileSettings",
            scenario    => 'settings'
        ]

        action  = {router page="profile/{$oUserProfile->getLogin()}/settings/profile"} 

        hook    = "form_settings"

        items   = [
            [ 
                name        => "name",
                label       => $aLang.user.settings.profile.form.name.label,
                placeholder => $aLang.user.settings.profile.form.name.placeholder,
                type        => "text",
                value       => $oUserProfile->getName()
            ],
            [ 
                name        => "login",
                label       => $aLang.auth.registration.form.fields.login.placeholder,
                type        => "text",
                value       => $oUserProfile->getLogin()
            ],
            [   
                type        => 'textarea',
                name        => "about",
                label       => $aLang.user.settings.profile.form.about.label,
                placeholder => $aLang.user.settings.profile.form.about.placeholder,
                value       => $oUserProfile->getAbout() 
            ],
            {component 'button' 
                classes     = "mt-3"
                mods        = "primary"
                name        = 'submit_settings' 
                type        = "submit" 
                bmods       = 'primary' 
                text        = $aLang.common.save}
        ]
    }
    
    
{/block}
