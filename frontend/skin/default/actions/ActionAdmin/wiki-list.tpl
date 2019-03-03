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
    
    <div>
        <div class="ls-grid-row"> 
            <div class="ls-grid-col ls-grid-col-4"> 
                Название
            </div>
            <div class="ls-grid-col ls-grid-col-4"> 
                Страниц
            </div>
            <div class="ls-grid-col ls-grid-col-4"> 
                
            </div>
        </div>
        {foreach $aWiki as $oWiki}
            <div class="ls-grid-row"> 
                <div class="ls-grid-col ls-grid-col-4"> 
                    {$oWiki->getMenuTitle()}
                </div>
                <div class="ls-grid-col ls-grid-col-4"> 
                    Страниц
                </div>
                <div class="ls-grid-col ls-grid-col-4"> 
                    
                </div>
            </div>
        {/foreach}
    </div>
    
{/block}

 