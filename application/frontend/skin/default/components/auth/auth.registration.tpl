{**
 * Форма регистрации
 *
 * @param string $redirectUrl
 *}
 
{$oUserProfile = Engine::GetEntity('User_User')}
{$oUserProfile->_setValidateScenario('registration')}

{$items = [
    [ 
        name        => "mail",
        placeholder => $aLang.auth.registration.form.fields.email.placeholder,
        type        => "email"
    ],
    [   
        type        => 'text', 
        name        => "login",
        placeholder => $aLang.auth.registration.form.fields.login.placeholder
    ],
    [ 
        type        => "password",
        name        => "password",
        placeholder => $aLang.auth.registration.form.fields.password.placeholder
    ],
    [ 
        type        => "password",
        name        => "password_confirm",
        placeholder => $aLang.auth.registration.form.fields.password_confirm.placeholder
    ]   
    
]}

{if Config::Get('module.user.captcha_use_registration')}
    {$items[] = [ 
        type        => "recaptcha",
        name        => "recaptcha"
    ]}
{/if}

{$items[] = {component 'button' 
    classes     = "mt-3"
    mods        = "block primary "
    name        = 'submit_login' 
    type        = "submit" 
    bmods       = 'primary' 
    text        = $aLang.auth.registration.form.fields.submit.text}
}
 
{component 'form' 
    attr    = [
        'data-action'            => {router page='auth/ajax-register'},
        'data-form',
        'data-param-redirect-url'   => $redirectUrl,
        'autocomplete'        => "off"
    ]
    method  = "post" 
    name    = "register_user"
    classes = "mt-3"
    validate = [
        entity      => "User_User",
        scenario    => 'registration',
        remote      => true
    ]

    hook    = "form_register"

    items   = $items
}
    
