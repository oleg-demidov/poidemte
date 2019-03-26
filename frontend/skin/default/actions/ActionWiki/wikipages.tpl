{**
 * Панель тестов
 *
 *}
 
{extends 'layouts/layout.base.tpl'}

{block 'layout_options' append}
    {*$layoutNav = [[
        hook       => 'panel',
        activeItem => $sMenuItemSelect,
        showSingle => true,
        items => [
            [ 'name' => 'wiki', 'url' => "", 'text' => 'dsfsdf']
        ]
    ]]*}
{/block}

{block 'layout_page_title'}
    <h2 class="page-header">
        {$oWiki->getTitle()}
    </h2>
    <h3>
        {$oCategory->getTitle()}
    </h3>
{/block}

{block 'layout_content'}
    <article class="ls-topic topic js-topic">
        {foreach $aWikipages as $oWikipage}
            {component 'topic.type' topic=$oWikipage}
        {/foreach}
    </article>
{/block}