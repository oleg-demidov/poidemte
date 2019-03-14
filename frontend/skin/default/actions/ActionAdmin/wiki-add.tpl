<h3>Добавить/редактировать документацию</h3>

{component 'admin:p-form' isEdit=$oWiki 
    isEdit=$oWiki 
    action=Router::GetPathWebCurrent() 
    submit=[ name => 'wiki_submit' ] 
    form=[
        [ field => 'text',     name => 'wiki[code]',  label => 'Код' ],
        [ field => 'text',     name => 'wiki[menu_title]',  label => 'Название пункта меню' ],
        [ field => 'checkbox',     name => 'wiki[menu_enable]',  label => 'Активировать пункт меню' ],
        [ field => 'checkbox',     name => 'wiki[state]',  label => 'Активировать документацию' ]
]}
