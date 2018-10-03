{**
 * Базовая форма создания топика
 *
 * @param object $topic
 * @param object $type
 * @param array  $blogs
 * @param array  $blogId
 *}

{component_define_params params=[ 'topic', 'type', 'skipBlogs', 'blogs', 'classes' ]}

<form action="" method="POST" enctype="multipart/form-data" id="topic-add-form" class="{$classes} js-form-validate" data-content-action="{( $topic ) ? 'edit' : 'add'}">
    {hook run="form_add_topic_begin" topic=$topic}
    {block 'add_topic_form_begin'}{/block}

    {* Заголовок топика *}
    {component 'field' template='text'
        name        = 'topic[topic_title]'
        value       = {(( $topic ) ? $topic->getTitle() : '')}
        entityField = 'topic_title'
        entity      = 'ModuleTopic_EntityTopic'
        label       = $aLang.topic.add.fields.title.label}

    {insert name='block' block='fieldCategory' params=[
        'target'      => $topic,
        'entity'      => 'ModuleTopic_EntityTopic'
    ]}

    {block 'add_topic_form_text_before'}{/block}


    {* Текст топика *}
    {if $type->getParam('allow_text')}
        {component 'editor'
            name            = 'topic[topic_text_source]'
            value           = (( $topic ) ? $topic->getTextSource() : '')
            label           = $aLang.topic.add.fields.text.label
            entityField     = 'topic_text_source'
            entity          = 'ModuleTopic_EntityTopic'
            inputClasses    = 'js-editor-default'
            mediaTargetType = 'topic'
            mediaTargetId   = ( $topic ) ? $topic->getId() : ''}
    {/if}

    {block 'add_topic_form_text_after'}{/block}


    {* Показывает дополнительные поля *}
    {insert name='block' block='propertyUpdate' params=[
        'target'      => $topic,
        'entity'      => 'ModuleTopic_EntityTopic',
        'target_type' => "topic_{$type->getCode()}"
    ]}



   


    {block 'add_topic_form_end'}{/block}
    {hook run="form_add_topic_end" topic=$topic}


    {* Скрытые поля *}
    {component 'field' template='hidden' name='topic_type' value=$type->getCode()}

    {if $topic}
        {component 'field' template='hidden' name='topic[id]' value=$topic->getId()}
    {/if}


    {**
     * Кнопки
     *}

    {* Опубликовать / Сохранить изменения *}
    {component 'button'
        id      = {( $topic ) ? 'submit-edit-topic-publish' : 'submit-add-topic-publish' }
        mods    = 'primary'
        classes = 'ls-fl-r'
        text    = $aLang.topic.add.button[ ( !$topic or ( $topic && $topic->getPublish() == 0 ) ) ? 'publish' : 'update' ]}

    {* Превью *}
    {component 'button' type='button' classes='js-topic-preview-text-button' text=$aLang.common.preview_text}

    {* Сохранить в черновиках / Перенести в черновики *}
    {if ! $topic}
        {component 'button' type='button' classes='js-topic-draft-button' text=$aLang.topic.add.button.save_as_draft}
    {else}
        {component 'button' type='button' classes='js-topic-draft-button' text=$aLang.topic.add.button[ ( $topic->getPublish() != 0 ) ? 'mark_as_draft' : 'update' ]}
    {/if}
</form>


{* Блок с превью текста *}
{component 'topic' template='preview'}