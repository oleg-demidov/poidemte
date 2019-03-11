

{component 'admin:p-form'
    isEdit=$oPage 
    action=Router::GetPathWebCurrent() 
    submit=[ name => 'page_submit' ] 
    form=[
        [ field => 'hidden',     name => 'page[wiki_id]',  value => $oWiki->getId() ],
        [ field => 'text',     name => 'page[code]',  label => 'Код' ],
        [ field => 'text',     name => 'page[title]',  label => 'Заоловок' ],
        [ field => 'textarea',     name => 'page[description]',  label => 'Meta Description' ],
        [ field => 'textarea',     name => 'page[keywords]',  label => 'Meta Keywords' ]
]}
