{**
* Основной лэйаут, который наследуют все остальные лэйауты
*
* @param boolean $layoutShowSidebar        Показывать сайдбар или нет, сайдбар не будет выводится если он не содержит блоков
* @param string  $layoutNavContent         Название навигации
* @param string  $layoutNavContentPath     Кастомный путь до навигации контента
* @param string  $layoutShowSystemMessages Показывать системные уведомления или нет
*}

{extends 'component@layout.layout'}



{block 'layout_options' append}
    {$layoutShowSidebar = $layoutShowSidebar|default:true}
    {$layoutShowSystemMessages = $layoutShowSystemMessages|default:true}
    {$themeColor = {Config::Get('view.bs_theme.color')}}
    {$themeBg = {Config::Get('view.bs_theme.bg')}}
    {$breakpoint = Config::Get('view.grid.breakpoint')}
    {$collapse = Config::Get('view.grid.collapse')}
{/block}


{block 'layout_head' append}
    {* Получаем блоки для вывода в сайдбаре *}
    {if $layoutShowSidebar}
        {show_blocks group='left' assign=layoutSidebarBlocks}

        {$layoutSidebarBlocks = trim( $layoutSidebarBlocks )}
        {$layoutShowSidebar = !!$layoutSidebarBlocks}
    {/if}


{/block}

{block 'layout_body'}

    {hook run='layout_body_begin'}

    {**
    * Основная навигация
    *}
    {block 'nav_main'}
        
        {capture name="brand"}
            <img src="{$LS->Asset_GetWebPath('logo')}">
        {/capture}

        {component 'navbar' 
            classes = "bg-light pr-2 pl-0 py-0 ls-shadow-sm" 
            bmods = "expand-{Config::Get('view.grid.collapse')} light" 
            brand = [
                text => $smarty.capture.brand,
                url  => {router page='/'},
                classes => 'p-0',
                attributes => [
                    style => "margin-bottom: -2px;"
                ],
                com     => 'link'
            ]
            
            items = [
                {insert name='block' block='menu' params=[ 'name' => "main", "activeItem" => $sMenuHeadItemSelect, "mods" => "main" ]}
            ]
            after={component 'userbar'}
        }
    {/block}
    
    {block name="after_nav_main"}
        {*<div class="row mt-1 ">
            <div class="col-xl-1 "></div>
            <div class="col-xl-7 col-12 col-lg-8 ">
                <div class="w-100 ml-3">
                    Хлебные крошки
                </div>
            </div>
            <div class="col-xl-3 d-flex justify-content-md-between col-12 col-lg-4">
                <div class="w-100 d-flex justify-content-md-between ">
                    {component 'search' template='navbar'}
                </div>
            </div>
            <div class="col-xl-1"></div>
        </div>*}
    {/block}
    
        <div class="row pt-4 no-gutters {hook run='layout_container_class' action=$sAction}">
            <div class="col-xl-1 "></div>
            
            {**
            * Сайдбар
            * Показываем сайдбар
            *}
            {if $layoutShowSidebar}
                <div class="col-12 col-{$breakpoint}-3 col-xl-2 layout-sidebar pr-{$breakpoint}-0">
                    <div class="mx-2">
                        {$layoutSidebarBlocks}
                    </div>
                </div>
            {/if}
            
            <div class="{if $layoutShowSidebar}col-12 col-{$breakpoint}-9 col-xl-8 mt-2 px-2 mt-{$breakpoint}-0
                 {else}col-12 col-xl-10{/if} ">
                <div class="px-2">
                    {hook run='layout_content_header_begin' action=$sAction}

                    {block 'layout_page_title' hide}
                        <h2 class="page-header">
                            {$smarty.block.child}
                        </h2>
                    {/block}

                    {block 'layout_content_header'}
                        {* Навигация *}
                        {if $layoutNav}
                            {$_layoutNavContent = ""}

                            {if is_array($layoutNav)}
                                {foreach $layoutNav as $layoutNavItem}
                                    {if is_array($layoutNavItem)}
                                        {component 'nav' 
                                            itemsClasses="m-1" 
                                            bmods='pills' 
                                            params=$layoutNavItem 
                                            assign=_layoutNavItemContent}
                                        {$_layoutNavContent = "$_layoutNavContent $_layoutNavItemContent"}
                                    {else}
                                        {$_layoutNavContent = "$_layoutNavContent $layoutNavItem"}
                                    {/if}
                                {/foreach}
                            {else}
                                {$_layoutNavContent = $layoutNav}
                            {/if}

                            {* Проверяем наличие вывода на случай если меню с одним пунктом автоматом скрывается *}
                            {if $_layoutNavContent|strip:''}
                                <div class="ls-nav-group">
                                    {$_layoutNavContent}
                                </div>
                            {/if}
                        {/if}
                        

                        {* Системные сообщения *}
                        {if $layoutShowSystemMessages}
                            {if $aMsgError}
                                {foreach $aMsgError as $sMsgError}
                                    {component 'alert' text=$sMsgError.msg title=$sMsgError.title bmods='danger' dismissible=true}
                                {/foreach}
                            {/if}

                            {if $aMsgNotice}
                                {foreach $aMsgNotice as $sMsgNotice}
                                    {component 'alert' text=$sMsgNotice.msg title=$sMsgNotice.title bmods='primary' dismissible=true}
                                {/foreach}
                            {/if}
                        {/if}
                    {/block}

                    {hook run='layout_content_begin' action=$sAction}

                    {block 'layout_content'}{/block}

                    {hook run='layout_content_end' action=$sAction}
                </div>
            </div>
            

            <div class="col-xl-1"></div>
        </div>
                
        {block 'layout_content_after'}{/block}
        
        {* Подвал *}
        <footer class="w-100 footer">
            {hook run='layout_footer_begin'}
                {block 'layout_footer'}
                    <div class="d-flex justify-content-center px-3">
                        {capture name="img_logo"}
                            <div class="mt-1" >
                                <img class="mt-2" width="24" height="27" src="{$LS->Asset_GetWebPath('logo')}">
                            </div>
                        {/capture}
                        
                        {$items = [
                            $smarty.capture.img_logo,
                            [
                                text    => $aLang.footer.nav.about.text,
                                classes => "p-3"
                            ],
                            [
                                text    => $aLang.footer.nav.contacts.text,
                                classes => "p-3"
                            ]
                        ]}

                        {if !$oUserCurrent}
                            {$items[] = [   
                                icon        => [ icon => "sign-in-alt", display => "s", classes => "d-md-none d-inline"],
                                text        => "<span class='d-none d-md-block'>{$aLang.auth.login.title}</span>",        
                                attributes  => [ "data-toggle"=>"modal-tab", "data-target"=>"#nav-tab-authlogin"], 
                                url         => "{router page='auth/login'}",
                                classes => "p-3",
                                liAttributes => [ "data-toggle"=>"modal", "data-target"=>"#modalAuth"]
                            ]}
                            {$items[] =[ 
                                icon        => [ icon => "user-plus", display => "s", classes => "d-md-none d-inline"],
                                text        => "<span class='d-none d-md-block'>{$aLang.auth.registration.title}</span>", 
                                attributes  => [ "data-toggle"=>"modal-tab", "data-target"=>"#nav-tab-authregister"], 
                                url         => "{router page='auth/register'}" ,
                                classes     => "p-3",
                                liAttributes => [ "data-toggle"=>"modal", "data-target"=>"#modalAuth"]
                            ]}
                        {/if}


                        {component "nav" 
                            classes = "footer-nav"
                            items = $items}
                    </div>
                {/block}
            {hook run='copyright'}
            {hook run='layout_footer_end'}
        </footer>
        
    {block "layout_modals"}
        {* Подключение модальных окон *}
        {if $oUserCurrent}
            
        {else}
            {component 'auth' template='modal'}
        {/if}
        {if $oUserAdmin}
            {component 'modal' 
                header  = {lang 'user.userbar.nav.feedback'} 
                id      = "modalFeedback"
                closed  = true
                content = {lang 'feedback.text' email=$oUserAdmin->getMail()}}
        {/if}

        
    {/block}
    
    {hook run='layout_body_end'}    

{/block}

