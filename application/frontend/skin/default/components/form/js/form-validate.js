
(function($) {
    "use strict";

    $.widget( "livestreet.bsFormValidate", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            // Классы
            selectors: {
                fields: 'input, .form-control, textarea',
                recaptcha: ".g-recaptcha",
                submit: '[type="submit"]'
            },

            // Ссылка
            urls: {
                load: null
            },
            
            // Параметры запроса
            params: {}
            
        },

        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function() {
            this._super();
            
            this.elements.fields.bsFieldValidate({
                urls:{ load: this.option('urls.load')}
            });

            this._on(this.element, {submit:"validate"});
            this._on(this.elements.fields, {change:"validate"});
        },
       
        
        validate: function(event){
            
            console.log(event)
            let data = { data: this.element.serializeJSON()};
            
            if(event.type === "change"){
                data.field = event.currentTarget.name;
            }
            
            this._load('load', data);
            
            event.stopImmediatePropagation();
            event.preventDefault();
        }
    });
})(jQuery);