/**
 * Подгрузка
 *
 * @module ls/dropdown
 *
 * @license   GNU General Public License, version 2
 * @copyright 2013 OOO "ЛС-СОФТ" {@link http://livestreetcms.com}
 * @author    Denis Shakhov <denis.shakhov@gmail.com>
 */

$.widget( "livestreet.bsAjaxButton", $.livestreet.lsComponent, {
    /**
     * Дефолтные опции
     */
    options: {
        urls: {
            load: null
        },
        selectors: {
            
        },
        params:{
          
        },
        classes: {
           
        }
    },

    /**
     * Конструктор
     *
     * @constructor
     * @private
     */
    _create: function() {
        
        this._super(); 
        
        if(this.element.bsButton('instance') === undefined){
            this.element.bsButton();
        }
        
        if(this.element.data('url')){
            this.option('urls.load', this.element.data('url'));
        }

        if(this.element.data('confirm')){
            this.element.lsConfirm({
                message:    this.element.data('confirmMessage'),
                onconfirm:  this.load.bind(this)
            });
        }else{
            this._on(this.element, {click:'load'});
        }        
        
        
    },
    
    load: function(event){
        this.element.bsButton('loading');
        this._load('load', {}, 'afterLoad', {
            onComplete: function(){
                this.element.bsButton('loaded');
            }.bind(this)
        });
        event.preventDefault();
    },
    
    afterLoad: function(response){ 
        if(response.remove){
            let item = this.element.closest(this.element.data('itemSelector'));
            if(item.find('modal').length){
                item.find('modal').modal('hide');
            }
            item.hide(200, function(e){$(this).remove()});
        }

        if(this.element.data('counterSelector')){
            $(this.element.data('counterSelector')).text(response.countAll)
        }
    }
});