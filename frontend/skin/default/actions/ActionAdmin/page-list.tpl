{**
 * Список тестов
 *
 *}
<h3>Список страниц документации "{$oWiki->getMenuTitle()}"</h3>

{block 'wiki_content'}
    
    <div class="ls-grid-row"> 
        <div class="ls-grid-col ls-grid-col-12"> 
            {component "button" text="Создать" url={router page="admin/plugin/wiki/{$oWiki->getCode()}/page_add"}}
        </div>
    </div>
    
    <table class="ls-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Категория</th>
                <th>Пунктов</th>
                <th class="ls-table-cell-actions">Действие</th>
            </tr>
        </thead>
        <tbody>
            {if !count($aPages)}
                <tr>
                    <td colspan="4">{component "blankslate" title="Пусто"}</td>
                </tr>
            {/if}

            {foreach $aPages as $oPage}
                
                <tr data-id="{$oPage->getId()}">
                    <td>{$oPage->getId()}</td>
                    <td>
                        {$oPage->getTitle()}
                    </td>
                    <td>
                        {($oPage->category->getCategory())?$oPage->category->getCategory()->getTitle():'-'}
                    </td>
                    <td><a href="{router page="admin/plugin/wiki/page/{$oPage->getCode()}/list"}">{$oPage->getCountPunkts()}</a></td>
                    
                    <td class="ls-table-cell-actions">
                        <a href="{router page="admin/plugin/wiki/{$oWiki->getCode()}/page_edit/{$oPage->getId()}"}" class="fa fa-edit" title="{$aLang.plugin.admin.edit}"></a>
                        <a href="{router page="admin/plugin/wiki/{$oWiki->getCode()}/remove_page/{$oPage->getId()}"}?security_ls_key={$LIVESTREET_SECURITY_KEY}" class="fa fa-trash-o js-confirm-remove" title="{$aLang.plugin.admin.delete}"></a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
     
    
{/block}

 