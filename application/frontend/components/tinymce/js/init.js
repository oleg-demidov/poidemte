jQuery(document).ready(function($){
    ls.hook.add('ls_template_init_start', function(){ 
        ls.registry.set('component.tinimce.plugins', []);
        ls.registry.set('component.tinimce.toolbar', []);
    }, 10);
    
    ls.hook.add('ls_template_init_end', function(){ 
        let plugins = [
            'autoresize',
            'code',
            'codesample',
            'emoticons',
            'hr',
            'image',
            'imagetools',
            'insertdatetime',
            'link',
            'lists',
            'media',
            'paste',
            'preview',
            'print',
            'spellchecker',
            'table',
            'textcolor',
            'wordcount'
        ];
        
        let toolbar = [
            'styleselect', 
            '|', 
            'bold', 
            'italic', 
            'strikethrough', 
            'underline',
            'blockquote',
            'table',
            '|',
            'bullist',
            'numlist',
            '|',
            'link',
            'media',
            'removeformat',
            'pagebreak',
            'code',
            'fullscreen'
        ];
        
        plugins = plugins.concat(ls.registry.get('component.tinimce.plugins'));
        
        toolbar = toolbar.concat(ls.registry.get('component.tinimce.toolbar'));
        
        let options = {
            menubar: false,
            selector: '[data-editor="tinymce"]',
            plugins: plugins.join(' ') ,
//                plugins: "autoresize autosave bbcode charmap code codesample colorpicker contextmenu directionality emoticons fullpage fullscreen 
//                help hr image imagetools importcss insertdatetime legacyoutput link lists media nonbreaking noneditable pagebreak paste preview print save 
//                searchreplace spellchecker tabfocus table template textcolor textpattern toc visualblocks visualchars wordcount",
            language: LANGUAGE,
            toolbar: toolbar.join(' ') 
        };
        
        
        tinymce.init(options);
    
    }, 5000);
});