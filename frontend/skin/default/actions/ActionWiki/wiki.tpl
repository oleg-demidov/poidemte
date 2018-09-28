{**
 * Панель тестов
 *
 *}
 
{extends 'layouts/layout.base.tpl'}

{block 'layout_options' append}
    {$layoutNav = [[
        hook       => 'panel',
        activeItem => $sMenuItemSelect,
        showSingle => true,
        items => [
            [ 'name' => 'wiki', 'url' => "", 'text' => 'l;l;']
        ]
    ]]}
{/block}

{block 'layout_page_title'}
    <h2 class="page-header">
        {$oWiki->getTitle()}
    </h2>
{/block}

{block 'layout_content'}
    {block 'panel_content'}{/block}
{/block}