{**
 * Форма запроса повторной активации аккаунта
 *}
{**
 * Форма восстановления пароля
 *}
    
{component 'form' 
    attr    = [
        'data-action'          => {router page='auth/ajax-reactivation'},
        'data-form',
        'autocomplete'        => "off"
    ]

    method  = "post" 
    name    = "form_login"
    classes = "mt-3"
    validate = [
        entity      => "User_ValidateReactivation",
        scenario    => 'reactivation'
    ]

    action  = {router page='auth/reactivation'}

    hook    = "form_reactivation"

    items   = [
        [ 
            type        => 'email', 
            name        => "mail",
            placeholder => $aLang.auth.reactivation.form.fields.mail.label
        ],
        [
            type        => "recaptcha",
            name        => "recaptcha"
        ],
        
        {component 'button' 
            classes     = "mt-3"
            mods        = "block primary "
            name        = 'submit_reactivation' 
            type        = "submit" 
            bmods       = 'primary' 
            text        = $aLang.auth.reactivation.form.fields.submit.text}
    ]
}