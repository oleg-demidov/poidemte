{**
 * Базовый шаблон топика
 * Используется также для отображения превью топика
 *
 * @param object  $topic
 * @param boolean $isList
 * @param boolean $isPreview
 *}

{$component = 'ls-topic'}
{component_define_params params=[ 'type', 'topic', 'isPreview', 'isList', 'mods', 'classes', 'attributes' ]}

{$user = $topic->getUser()}
{$type = ($topic->getType()) ? $topic->getType() : $type}

{block 'topic_body'}
    <p>
       {component 'text' text="<b>{$topic->getTitle()}.</b> {$topic->getText()}" attributes=[ id => "p{$topic->getTitle()}"]}
    </p>
{/block}

{* Управление *}
{if $topic->getIsAllowAction() && ! $isPreview}
    {block 'topic_header_actions'}
        {$items = [
            [ 'icon' => 'edit', 'url' => $topic->getUrlEdit(), 'text' => $aLang.common.edit, 'show' => $topic->getIsAllowEdit() ],
            [ 'icon' => 'trash', 'url' => "{$topic->getUrlDelete()}?security_ls_key={$LIVESTREET_SECURITY_KEY}", 'text' => $aLang.common.remove, 'show' => $topic->getIsAllowDelete(), 'classes' => 'js-confirm-remove-default' ]
        ]}
    {/block}

    {component 'actionbar' items=[[ 'buttons' => $items ]]}
{/if}
