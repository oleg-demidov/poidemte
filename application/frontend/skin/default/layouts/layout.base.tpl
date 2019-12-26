{**
* Основной лэйаут, который наследуют все остальные лэйауты
*
* @param boolean $layoutShowSidebar        Показывать  сайдбар или нет, сайдбар не будет выводится если он не содержит блоков
* @param string  $layoutNavContent         Название навигации
* @param string  $layoutNavContentPath     Кастомный путь до навигации контента
* @param string  $layoutShowSystemMessages Показывать системные уведомления или нет
*}

{extends 'component@layout.layout'}



{block 'layout_options' append}
    {$layoutShowSidebar = $layoutShowSidebar|default:true}
    {$layoutShowSidebarRight = $layoutShowSidebarRight|default:true}
    {$layoutShowSystemMessages = $layoutShowSystemMessages|default:true}
    {$themeColor = {Config::Get('view.bs_theme.color')}}
    {$themeBg = {Config::Get('view.bs_theme.bg')}}
    {$breakpoint = Config::Get('view.grid.breakpoint')}
    {$collapse = Config::Get('view.grid.collapse')}
{/block}


{block 'layout_head' append}
    {* Получаем блоки для вывода в сайдбаре *}
    {if $layoutShowSidebar}
        {show_blocks group='left' assign=sidebarLeftBlocks}
        {show_blocks group='right' assign=sidebarRightBlocks}
        
        {$layoutShowSidebar = !!$sidebarLeftBlocks or !!$sidebarRightBlocks}
    {/if}
   
{/block}

{block 'layout_body'}

    {hook run='layout_body_begin'}

    {**
    * Основная навигация
    *}
    {block 'nav_main'}
        
        {capture name="brand"}
            <a href="{router page='/'}" >
                {asset name='logo' type='img'}
            </a>
        {/capture}

        {component 'navbar' 
            classes = "bg-light pr-2 pl-0 py-0 ls-shadow-sm" 
            mods    = "expand-{$collapse} light" 
            before  = $smarty.capture.brand
            
            items   = [
                {insert name='block' block='BlockMenu' params=[ 'name' => "main", "activeItem" => $sMenuHeadItemSelect, "mods" => "main" ]}
            ]

            after   = {component 'userbar'}
        }
    {/block}
    
        
    <div class="row p-2 no-gutters {hook run='layout_container_class' action=$sAction}">

        

        <div class="col-xl-1 "></div>

        <div class="col-12 col-xl-10">
            {*
                Полоса над основным контентом
            *}
            <div class="w-100">
                
                {block name="layout_page_header"} 
                    {*
                        Хлебные крошки
                    *}
                    {if $aBreadcrumbs}
                        {component "breadcrumb" 
                            hook    = 'breadcrumbs'
                            classes = "bg-light"
                            items   = $aBreadcrumbs}
                    {/if}
                {/block}
                {*
                    Блоки вверху страницы
                *}
                {show_blocks group='up'}
            </div>

            <div class="row no-gutters">
                {**
                * Сайдбар
                * Показываем сайдбар слева
                *}
                {if !!$sidebarLeftBlocks}
                    <div class="col-12 col-{$breakpoint}-3 layout-sidebar pr-{$breakpoint}-0">
                        <div class="mx-2">
                            {$sidebarLeftBlocks|trim}
                        </div>
                    </div>
                {/if}

                <div class="{if $layoutShowSidebar}col-12 col-{$breakpoint}-9 p-2{else}col-xl-12{/if} ">
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
                                                mods    = 'pills' 
                                                params  = $layoutNavItem 
                                                assign  ="_layoutNavItemContent"}
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
                                    {$_layoutNavContent}
                                {/if}
                            {/if}


                            {* Системные сообщения *}
                            {if $layoutShowSystemMessages}
                                {if $aMsgError}
                                    {foreach $aMsgError as $sMsgError}
                                        {component 'alert' 
                                            text        = $sMsgError.msg 
                                            title       = $sMsgError.title 
                                            mods        = 'danger' 
                                            dismissible = true}
                                    {/foreach}
                                {/if}

                                {if $aMsgNotice}
                                    {foreach $aMsgNotice as $sMsgNotice}
                                        {component 'alert' 
                                            text        = $sMsgNotice.msg 
                                            title       = $sMsgNotice.title 
                                            mods        = 'primary' 
                                            dismissible = true}
                                    {/foreach}
                                {/if}
                            {/if}
                        {/block}
                        
                        {hook run='layout_content_begin' action=$sAction}

                        {block 'layout_content'}{/block}

                        {hook run='layout_content_end' action=$sAction}
                    </div>
                </div>
                    
                {**
                 * Сайдбар
                 * Показываем сайдбар справа
                 *}
                {if !!$sidebarRightBlocks}
                    <div class="col-12 col-{$breakpoint}-3 layout-sidebar pr-{$breakpoint}-0">
                        <div class="mx-2">
                            {$sidebarRightBlocks|trim}
                        </div>
                    </div>
                {/if}

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
                    
                    {if !$oUserCurrent}
                        {$items = [
                            [   
                                text        => {lang 'auth.login.title'},        
                                attr        => [ "data-toggle"=>"tab", role=>"tab"], 
                                url         => "#tab_login",
                                role        => "tab"
                            ],
                            [ 
                                text        => {lang 'auth.registration.title'}, 
                                attr        => [ "data-toggle"=>"tab", role=>"tab"], 
                                url         => "#tab_register" 
                            ]
                        ]}
                    {/if}


                    {component "nav" 
                        hook    = "footer_nav"
                        classes = "footer-nav"
                        items   = $items}
                </div>
            {/block}
        {hook run='layout_footer_end'}
    </footer>
        
    {block "layout_modals"}
        {* Подключение модальных окон *}
        {if $oUserCurrent}
            
        {else}
            {component "auth.modal"}
        {/if}
        
    {/block}
    
    {hook run='layout_body_end'}    

{/block}

