{**
 * Панель тестов
 *
 *}
 
{extends 'layouts/layout.base.tpl'}

{block 'layout_options' append}
    {$items = []}
    {foreach $aWiki as $oWiki}
        {$items[] = [
            name => $oWiki->getUrl(),
            text => $oWiki->getTitle(),
            url => {router page="wiki/{$oWiki->getUrl()}"}
        ]}

    {/foreach}

    {$layoutNav = [[
        hook       => 'panel',
        activeItem => $sMenuItemSelect,
        showSingle => true,
        items => $items
    ]]}
{/block}

{block 'layout_page_title'}
    <h2 class="page-header">
        {$aLang.plugin.wiki.unknown.title}
    </h2>
{/block}