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
        'data-redirect-url'   => $redirectUrl,
        'autocomplete'        => "off"
    ]
    method  = "post" 
    name    = "register_user"
    classes = "mt-3"
    validate = [
        entity      => "User_User",
        scenario    => 'register',
        remote      => true
    ]

    hook    = "form_register"

    items   = [
        [ 
            name        => "mail",
            placeholder => $aLang.auth.registration.form.fields.email.placeholder,
            type        => "email"
        ],
        [   
            type        => 'text', 
            name        => "login",
            placeholder => $aLang.auth.registration.form.fields.login.placeholder,
            desc        => $aLang.auth.registration.form.fields.login.desc  
        ],
        [ 
            type        => "password",
            name        => "password",
            placeholder => $aLang.auth.registration.form.fields.password.placeholder
        ],
        [ 
            type        => "password",
            name        => "password_repeat",
            placeholder => $aLang.auth.registration.form.fields.password.placeholder
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
    
