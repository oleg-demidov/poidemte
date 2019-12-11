{**
 * Форма регистрации
 *
 * @param string $redirectUrl
 *}
 
{$oUserProfile = Engine::GetEntity('User_User')}
{$oUserProfile->_setValidateScenario('registration')}
 
{component 'form' 
    attr    = [
        'data-url'            => {router page='auth/ajax-register'},
        'data-form-ajax',
        'novalidate',
        'data-redirect-url'   => $redirectUrl,
        'autocomplete'        => "off"
    ]
    method  = "post" 
    name    = "register_user"
    classes = "mt-3"
    entity  = $oUserProfile

    hook    = "form_login"

    items   = [
        [ 
            type        => 'text' ,
            name        => "mail",
            placeholder => $aLang.auth.registration.form.fields.email.placeholder,
            type        => "email",
            validate    => [ 
                entity  => $oUserProfile,
                remote  => true
            ]
        ],
        [   
            type        => 'text', 
            name        => "login",
            placeholder => $aLang.auth.registration.form.fields.login.placeholder,
            type        => "text",
            desc        => $aLang.auth.registration.form.fields.login.desc, 
            validate    => [ 
                entity  => $oUserProfile,
                remote  => true
            ]  
        ],
        [ 
            type        => "password",
            name        => "password",
            attr        => [autocomplete => "off"],
            placeholder => $aLang.auth.registration.form.fields.password.placeholder,
            validate    => [ 
                entity  => $oUserProfile
            ]
        ],
        {component 'button' 
            classes     = "mt-3"
            mods        = "block primary "
            name        = 'submit_login' 
            type        = "submit" 
            bmods       = 'primary' 
            text        = $aLang.auth.registration.form.fields.submit.text}
    ]
}
    
