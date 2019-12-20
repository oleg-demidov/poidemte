{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    {lang 'auth.registration.confirm.title'}
{/block}

{block 'layout_content'}
    {lang 'auth.registration.confirm.text'}<br /><br />

    <a href="{router page='/'}">{lang 'common.site_go_main'}</a>
{/block}