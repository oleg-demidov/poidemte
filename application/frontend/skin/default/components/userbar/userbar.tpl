{**
 * Юзербар
 *}
 


{if $oUserCurrent}
    {insert name='block' block='menuUser' params=[  ]}

{else}
    {if !in_array(Router::GetActionEvent(), ["login", "register"])}
        
        {*<ul class="nav-main  nav justufy-content-center" data-toggle="modal" data-target="#modalAuth"> 

            <li class="nav-item  ">
                <a class="nav-link  " href="#tab_login" data-toggle="tab"  role="tab" >                        
                    <i class="icon fas fa-sign-in-alt icon-main  d-md-none d-inline"></i>
                    <span class="d-none d-md-block">Войти</span>                
                </a>
            </li>        
            <li class="nav-item  ">
                <a class="nav-link  " href="#tab_register" data-toggle="tab"   role="tab">                        
                    <i class="icon fas fa-user-plus icon-main  d-md-none d-inline"></i>
                    <span class="d-none d-md-block">Регистрация</span>                
                </a>
            </li>
        </ul>*}

        {$items = [
            [   
                icon        => [ icon => "sign-in-alt:s" , classes => "d-md-none d-inline"],
                text        => "<span class='d-none d-md-block'>{$aLang.auth.login.title}</span>",        
                attr        => [ "data-toggle"=>"tab", role=>"tab"], 
                url         => "#tab_login",
                role        => "tab"
            ],
            [ 
                icon        => [ icon => "user-plus:s", classes => "d-md-none d-inline"],
                text        => "<span class='d-none d-md-block'>{$aLang.auth.registration.title}</span>", 
                attr        => [ "data-toggle"=>"tab", role=>"tab"], 
                url         => "#tab_register" 
            ]
        ]}
        
        {component "nav" 
            classes = "justufy-content-center" 
            hook    = "userbar" 
            items   = $items}
    {/if}
{/if}
    
   
