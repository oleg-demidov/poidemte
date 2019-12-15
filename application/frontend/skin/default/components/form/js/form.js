
(function($) {
    "use strict";

    $.widget( "livestreet.bsForm", $.livestreet.lsComponent, {
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
                submit: null,
                validate: null
            },
            
            // Параметры запроса
            params: {},
            
        },

        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function() {
            this._super();

            if(this.element.data('action')){
                this.option('urls.submit', this.element.data('action'));
            }
            
            this.elements.fields.bsField({
                urls: {
                    validate: this.option('urls.validate')
                },
                params: {
                    entity      : this.option('params.entity'),
                    scenario    : this.option('params.scenario')
                }
            });
            
            this._on(this.element, {submit:"onSubmit"});
            
        },
        
        
        
        onSubmit: function(event){

            event.preventDefault();
            
            if(this.option('urls.submit') === null){
                return false;
            }

            this.elements.fields.bsField('clearMsg');
            
            let data = { data: this.element.serializeJSON()};
            
            this.loading();
            
            this._load(
                'submit', 
                data, 
                'afterSubmit', 
                {showProgress:false}
            );
                    
            return false;
        },
        
        afterSubmit:function(response){
            
            this.loaded();
            /*
             * Сброс каптчи
             */
            if($('.g-recaptcha', this.element).length){
                $('.g-recaptcha', this.element).bsRecaptcha("reset")
            }
            
            $.each(response.errors, function(name, error){
                let $field = $('[name="' + name + '"]', this.element);

                $field.bsField('setInvalidMessage', error.join('<br>'));
                $field.bsField('setInvalid');

            }.bind(this));
                        
            this._trigger('onAfterSubmit', null, {context:this, response:response});
        },       
        
        afterError: function(){
            this.loaded();
        },
        
        loading:function(){
            this.elements.submit.addClass('ls-loading text-hide px-5 py-3');
        },
        loaded:function(){
            this.elements.submit.removeClass('ls-loading text-hide px-5 py-3');
        }
    });
})(jQuery);