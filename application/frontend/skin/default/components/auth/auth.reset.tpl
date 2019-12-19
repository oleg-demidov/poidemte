{**
 * Форма восстановления пароля
 *}
    
{component 'form' 
    attr    = [
        'data-action'          => {router page='auth/ajax-password-reset'},
        'data-form',
        'autocomplete'        => "off"
    ]

    method  = "post" 
    name    = "form_login"
    classes = "mt-3"
    validate = [
        entity      => "User_ValidatePasswordReset",
        scenario    => 'reset'
    ]

    action  = {router page='auth/password-reset'}

    hook    = "form_reset_password"

    items   = [
        [ 
            type        => 'email', 
            name        => "mail",
            placeholder => $aLang.auth.reset.form.fields.mail.label
        ],
        [
            type        => "recaptcha",
            name        => "recaptcha"
        ],
        
        {component 'button' 
            classes     = "mt-3"
            mods        = "block primary "
            name        = 'submit_reset' 
            type        = "submit" 
            bmods       = 'primary' 
            text        = $aLang.auth.reset.form.fields.submit.text}
    ]
}