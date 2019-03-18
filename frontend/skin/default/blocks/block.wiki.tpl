{**
 * Панель тестов
 *
 *}
{capture "content"}
    {$items = []}
    {foreach $aCategories as $category}
        {$items[] = [
            name    => $category->getUrl(),
            url     => {router page="wiki/{$category->getUrlFull()}"},
            text    => $category->getTitle()
        ]}
        
    {/foreach}
    {if $oCategory}
        {$activeItem = $oCategory->getUrl()}
    {/if}
    {component 'nav' items=$items mods="pills stacked" activeItem=$activeItem}
{/capture}
 
{component 'block'
    content = $smarty.capture.content
    title = $aLang.plugin.wiki.block_wiki.title
}