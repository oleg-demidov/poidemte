{**
 * Пользователь вверху профиля
 *}

{extends "component@component.layout"}

{block name="options" append}
    {component_params params=[ 
        'user', 
        'url', 
        'textWrap' 
    ]}
{/block}

{block name="content" append}
    <u>{$user->getLogin()}</u><br>
    <h2>{$user->getName()}</h2>
{/block}