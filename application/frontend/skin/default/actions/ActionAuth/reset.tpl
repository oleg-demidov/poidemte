{**
 * Форма восстановления пароля
 *}

{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    {lang 'auth.reset.title'}
{/block}

{block 'layout_content'}
    {component 'auth' template='reset'}
{/block}