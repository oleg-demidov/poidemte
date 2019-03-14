{**
 * Список тестов
 *
 *}
<h3>
    <a href="{router page="admin/plugin/wiki/list"}">Список документаций</a> > 
    <a href="{router page="admin/plugin/wiki/{$oWiki->getCode()}/pages"}">{$oWiki->getMenuTitle()}</a> > 
    {$oPage->getTitle()}
</h3>

{block 'wiki_content'}
    
    <div class="ls-grid-row"> 
        <div class="ls-grid-col ls-grid-col-12"> 
            {component "button" text="Создать" url={router page="admin/plugin/wiki/page/{$oPage->getCode()}/punkt_add"}}
        </div>
    </div>
    
    <table class="ls-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th class="ls-table-cell-actions">Действие</th>
            </tr>
        </thead>
        <tbody>
            {if !count($aPunkts)}
                <tr>
                    <td colspan="4">{component "blankslate" title="Пусто"}</td>
                </tr>
            {/if}

            {foreach $aPunkts as $oPunkt}
                
                <tr data-id="{$oPunkt->getId()}">
                    <td>{$oPunkt->getId()}</td>
                    <td>
                        {$oPunkt->getName()}
                    </td>
                    <td class="ls-table-cell-actions">
                        <a href="{router page="admin/plugin/wiki/page/{$oPage->getCode()}/punkt_edit/{$oPunkt->getId()}"}" class="fa fa-edit" title="{$aLang.plugin.admin.edit}"></a>
                        <a href="{router page="admin/plugin/wiki/page/{$oPage->getCode()}/remove_punkt/{$oPunkt->getId()}"}?security_ls_key={$LIVESTREET_SECURITY_KEY}" class="fa fa-trash-o js-confirm-remove" title="{$aLang.plugin.admin.delete}"></a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
     
    
{/block}

 