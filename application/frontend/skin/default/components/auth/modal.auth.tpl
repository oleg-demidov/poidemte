{**
 * Модальное окно с формами входа, регистрации и напоминанием пароля
 *}

{if ! Config::Get('general.reg.invite')}
    {component 'auth' template='registration' assign=auth_tab_reg}
{else}
    {component 'auth' template='invite' assign=auth_tab_reg}
{/if}

{capture name="modal_content"}
    
    {component "nav" 
        mods    = "tabs"
        items   = [
            [   
                active  => true, 
                text    => {lang 'auth.login.title'},
                name    => 'login',
                url     => '#tab_login',
                attr    => ['data-toggle' => "tab", role => "tab"]
            ],
            [   
                active  => true, 
                text    => {lang 'auth.registration.title'},
                name    => 'register',
                url     => '#tab_register',
                attr    => ['data-toggle' => "tab", role => "tab"]
            ],
            [   
                active  => true, 
                text    => {lang 'auth.reset.title'},
                name    => 'reset',
                url     => '#tab_reset',
                attr    => ['data-toggle' => "tab", role => "tab"]
            ]            
        ]
    }
    
    {component "nav.panes" 
        items = [
            [ content => {component 'auth' template='login'}, 'id' => 'tab_login' ],
            [ content => $auth_tab_reg,   'id' => 'tab_register' ],
            [ content => {component 'auth' template='reset'},   'id' => 'tab_reset' ]
        ]}

{/capture}


{component 'modal'
    header      = {lang 'auth.authorization'}
    closed      = true
    id          = 'modalAuth'
    content     = $smarty.capture.modal_content}