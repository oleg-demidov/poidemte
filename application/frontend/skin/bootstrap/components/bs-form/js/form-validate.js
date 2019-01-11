
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
            this.elements.fields.bsFieldValidate();
        },
        
        validate: function(call){
            
            this.elements.fields = this.element.find(this.option('selectors.fields'));
            this.elements.fields.bsFieldValidate();
            
            if(!this.isValidFields()){
                this.showErrorsMessageNotice();
                call({success:false});
                return;
            }
            
            
            if(this.element.data('recaptcha') !== undefined && $.isFunction(call)){
                this.element.bsReCaptcha('execute', call);
            }else{
                setTimeout(function(){call({success:true})},1000);
            }
        },
        
        showErrors:function(errors){
            $.each(errors, function(name, error){
                let el = this.element.find('[name="'+name+'"]');
                if(el.bsFieldValidate !== "undefined") {
                    el.bsFieldValidate('setInvalid') && el.bsFieldValidate('setErrorMessage', error[0]);
                }
                if(!el.length){
                    ls.msg.notice( name, error );
                }
                if(el.attr('type') == "hidden"){
                    el.bsFieldValidate('setErrorMessageNotice', error[0]) &&
                    el.bsFieldValidate('showErrorMessageNotice');
                }
            }.bind(this));            
        },
        
        showErrorsMessageNotice:function(){
            $.each(this.elements.fields, function(i,field){
                $(field).bsFieldValidate('showErrorMessageNotice');
            }.bind(this));
        },
        
        isValidFields:function(){
            let valid = true;
            $.each(this.elements.fields, function(i,field){
                $(field).bsFieldValidate('validate');
                if($(field).bsFieldValidate('isValid') === false){
                    valid = false;
                }
            }.bind(this));
            return valid;
        }
    });
})(jQuery);