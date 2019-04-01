
(function($) {
    "use strict";

    $.widget( "livestreet.bsButton", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            selectors:{
                badge:".badge"
            },
            html:null
        },
        
        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function() {
            this._super();
            this.option('html', this.element.html());
        },
        
        setCount:function(count){
            let badge = this.element.find(this.option('selectors.badge'))
            if(badge.length){
                if(count < 1){
                    badge.addClass('d-none');
                }else{
                    badge.removeClass('d-none');
                }
                badge.html(count);
            }
        },
        
        loading:function(){
            this.element.html(this.element.data('loadingText'));
        },
        loaded:function(){
            this.element.html(this.option('html'));
        }
    });
})(jQuery);