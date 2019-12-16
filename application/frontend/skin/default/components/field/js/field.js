
(function($) {
    "use strict";

    $.widget( "livestreet.bsField", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            // Классы
            classes: {
                invalidFeedback:".invalid-feedback",
                validFeedback:".valid-feedback"
            }
        },
        
        validateRemote : false,

        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function() {
            this._super();
            
            if(this.element.data('validateRemote') !== undefined){
                this.option('validateRemote', this.element.data('validateRemote'));
            }
            
            this.feedbackElements();
            
            if(this.option('validateRemote')){
                this._on(this.element, {change:"validate"});
            }
            
        },
        
        feedbackElements:function(){
            this.elements.invalidFeedback = this.element.parent().find(this.option('classes.invalidFeedback'));
            this.elements.validFeedback = this.element.parent().find(this.option('classes.validFeedback'));
        },
         
        setValid:function(){
            this.element.removeClass('is-invalid').addClass('is-valid');
        },
        
        setInvalid:function(){
            this.element.removeClass('is-valid').addClass('is-invalid');
        },
        
        isValid:function(){
            return this.element.hasClass('is-valid');
        },
        
        validate: function(event){
            
            let data = { data: this.element.closest('form').serializeJSON()};
            
            if(event.type === "change"){
                data.field = event.currentTarget.name;
            }
            
            this._load('validate', data, function(response)
            {
                if(response.errors[data.field] === undefined){
                    this.setValid();
                }else{
                    this.setInvalidMessage( response.errors[data.field].join('<br>'));
                    this.setInvalid();
                }
               
            }.bind(this), {showProgress:false});

        },
        
        clearMsg: function(){
            this.element.removeClass('is-valid is-invalid');            
        },
        
        setInvalidMessage:function(mess){
            this.elements.invalidFeedback.html(mess);
        },
        
        setValidMessage:function(mess){
            this.elements.validFeedback.html(mess);
        }        
        
    });
})(jQuery);