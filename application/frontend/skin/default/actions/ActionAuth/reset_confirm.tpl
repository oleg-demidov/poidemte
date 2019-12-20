{**
 * Восстановление пароля.
 * Пароль отправлен на емэйл пользователя.
 *}

{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
	{lang 'auth.reset.title'}
{/block}

{block 'layout_content'}
	{lang 'auth.reset.notices.success_send_password'}
{/block}