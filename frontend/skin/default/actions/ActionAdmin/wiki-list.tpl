{**
 * Список тестов
 *
 *}
<h3>Список документаций</h3>

{block 'wiki_content'}
    
    <div class="ls-grid-row"> 
        <div class="ls-grid-col ls-grid-col-12"> 
            {component "button" text="Создать" url={router page="admin/plugin/wiki/add"}}
        </div>
    </div>
    
    <table class="ls-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Страниц</th>
                <th class="ls-table-cell-actions">Действие</th>
            </tr>
        </thead>
        <tbody>
            {foreach $aWiki as $oWiki}
                
                <tr data-id="{$oWiki->getId()}">
                    <td>{$oWiki->getId()}</td>
                    <td>
                        {$oWiki->getMenuTitle()}
                    </td>
                    <td>{$oWiki->getCountAns()}</td>
                    
                    <td class="ls-table-cell-actions">
                        <a href="{router page="admin/plugin/wiki/edit/{$oWiki->getId()}"}?security_ls_key={$LIVESTREET_SECURITY_KEY}" class="fa fa-edit" title="{$aLang.plugin.admin.edit}"></a>
                        <a href="{router page="admin/plugin/wiki/remove/{$oWiki->getId()}"}?security_ls_key={$LIVESTREET_SECURITY_KEY}" class="fa fa-trash-o js-confirm-remove" title="{$aLang.plugin.admin.delete}"></a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
     
    
{/block}

 