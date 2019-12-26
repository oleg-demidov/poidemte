/**
 * Инициализации модулей
 *
 * @license   GNU General Public License, version 2
 * @copyright 2013 OOO "ЛС-СОФТ" {@link http://livestreetcms.com}
 * @author    Denis Shakhov <denis.shakhov@gmail.com>
 */

jQuery(document).ready(function($){
    
    /**
     * Иниц-ия модулей ядра
     */
    ls.init({
        production: false
    });

    /**
     * Notification
     */
    ls.notification.init();
    
    $('html').removeClass('no-js');
    
    ls.registry.set('component.tinimce.plugins', []);
    ls.registry.set('component.tinimce.toolbar', []);
    
    // Хук начала инициализации javascript-составляющих шаблона
    ls.hook.run('ls_template_init_start',[],window);
    
        
       
    /*
     *  Код для реализации dropdown-submenu
     */
    $('.dropdown-menu a.dropdown-toggle').on('mouseover click', function(e) {
        if (!$(this).next().hasClass('show')) {
            $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
        }
        var $subMenu = $(this).next(".dropdown-menu");
        $subMenu.toggleClass('show');


        $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
            $('.dropdown-submenu .show').removeClass("show");
        });
        return false;
    });
    
    /*
     * Бутстрап
     */
    $('[data-toggle="popover"]').popover();
    $('[data-toggle="tooltip"]').tooltip();
    
    /*
     * Modals
     */
        
     // Отправка формы в модальном окне
    $('[data-modal-submit]').on('click', function(e){
        $(this).closest('.modal-content').find('form').submit();
    });
    
        
    /*
     * Дополнительная обработка табов в модальных окнах
     */
    $('[data-toggle="tab"]').on('shown.bs.tab', function(event){
        let $tab = $(event.currentTarget);
        
        let $tabs = $('[href="' + $tab.attr('href') + '"]').filter(function(i, el){
            if(el === $tab.get(0)){
                return false
            }
            return true;
        });
        
        $tabs.tab('show');
        
        let $modal = $tabs.closest('.modal' );
        
        if($modal.length){
            $modal.modal('show');
            $tab.on('click', function(event){
                $modal.modal('show');
            })
        }
    });

   
    /**
     * Подтверждение удаления
     */
    $('.js-confirm-remove-default').livequery(function () {
        $(this).lsConfirm({
            message: ls.lang.get('common.remove_confirm'),
        });
    });
    
    $('[data-confirm-remove]').livequery(function () {
        $(this).lsConfirm({
            message: ls.lang.get('common.remove_confirm'),
            onconfirm: function(e){
                $(e.target).submit();
            }
        });
    });

    
    /*
     * Форма с ajax отправкой и валидацией
     */
    $('[data-form]').bsForm({
        urls:{ validate: aRouter.ajax + 'validate'}
    });
    
   
    /*
     * Button
     */
    $('.btn').bsButton();
    
    /*
     * ReCaptcha
     */
    $('.g-recaptcha').bsRecaptcha({
        site_key: ls.registry.get('recaptcha.site_key')
    });
    /*
     * Пагинация
     */
    $('[data-type="pagination"]').bsPagination();
   

    // Хук конца инициализации javascript-составляющих шаблона
    ls.hook.run('ls_template_init_end',[],window);
});

