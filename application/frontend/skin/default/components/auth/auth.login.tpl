{**
 * Форма входа
 *
 * @param string $redirectUrl
 *}

{component 'form' 
    attr    = [
        'data-action'          => {router page='auth/ajax-login'},
        'data-form',
        'autocomplete'        => "off"
    ]

    method  = "post" 
    name    = "form_login"
    classes = "mt-3"
    validate = [
        entity      => "User_ValidateLogin",
        scenario    => 'login'
    ]

    action  = {router page='auth/login'}

    hook    = "form_login"

    items   = [
        [ 
            type        => 'text', 
            name        => "mail_login",
            placeholder => $aLang.auth.login.form.fields.login_or_email.placeholder,
            type        => "text"
        ],
        [ 
            type        => "password",
            name        => "password",
            placeholder => $aLang.auth.login.form.fields.password.placeholder
        ],
        [   
            type        => 'checkbox',
            classes     => "is-valid",
            name        => 'remember',
            label       => $aLang.auth.login.form.fields.remember.label,
            checked     => true  
        ],
        {component 'button' 
            classes     = "mt-3"
            mods        = "block primary "
            name        = 'submit_login' 
            type        = "submit" 
            bmods       = 'primary' 
            text        = $aLang.auth.login.form.fields.submit.text}
    ]
}
