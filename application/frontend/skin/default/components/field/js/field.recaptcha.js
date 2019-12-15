/**
 * ReCaptcha
 *
 * @module ls/recaptcha
 *
 * @license   GNU General Public License, version 2
 * @copyright 2013 OOO "ЛС-СОФТ" {@link http://livestreetcms.com}
 * @author    Denis Shakhov <denis.shakhov@gmail.com>
 */

(function ($) {
    "use strict";

    var notReadyItems = [];

    $.widget("livestreet.bsRecaptcha", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            captchaName: null,
            name: null,
            site_key: null,
            urls: {
                register:   aRouter.auth + "ajax-register",
                verify:     aRouter.ajax + "verify-recaptcha"
            },
            theme:'light',
            
            id: null
        },
        
        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function () {
            this._super();

            if(!recaptchaIsReady){
                $(document).on( 'recaptchaReady', this.render.bind(this));
            }else{
                this.render();
            }
                      
        },
        
        render: function(event)
        {
            this.options.id = grecaptcha.render(this.element.get(0), {
                sitekey     : this.option('site_key'),
                callback    : this.result.bind(this),
                theme       : this.option('theme')
            });
        },
        
        result:function(response){
            $('input', this.element.parent())
                    .val(response).bsField('clearMsg')
        },
        
        reset: function()
        {
            grecaptcha.reset(
                this.option('id')
            )
        }

    });
})(jQuery);

 
/*
 * ReCaptcha
 */
let recaptchaIsReady = false;
function recaptchaReady(){
    $(document).trigger('recaptchaReady');
    recaptchaIsReady = true;
}