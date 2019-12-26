{**
 * Базовый шаблон профиля пользователя
 *}
{extends './layout.base.tpl'}

{block 'layout_content'}
    {component "user.header" user=$oUserProfile}
    
    {show_blocks group='profile'}

    {hook run='profile_content_before'}
    
    {block name="profile_content"}

    {/block}
    
    {hook run='profile_content_after'}
{/block}