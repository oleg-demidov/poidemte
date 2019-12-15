
(function($) {
    "use strict";

    $.widget( "livestreet.bsFormValidate", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            // Классы
            selectors: {
                fields: 'input, select, textarea',
                submit: '[type="submit"]'
            },

            // Ссылка
            urls: {
                validate: null
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
           
            this.elements.fields.bsField();

            this._on(this.element, {submit:"validate"});
            this._on(this.elements.fields, {change:"validate"});
        },
       
        
        validate: function(event){
            
            let data = { data: this.element.serializeJSON()};
            
            if(event.type === "change"){
                data.field = event.currentTarget.name;
            }
            
            this._load('validate', data, function(response){
                if(response.errors === undefined){
                    return;
                }
                this.elements.fields.bsField()
            }.bind(this), {showProgress:false});
            
            event.stopImmediatePropagation();
            event.preventDefault();
        }
    });
})(jQuery);