{**
 * Тестовая страница
 *}
{extends 'layouts/layout.base.tpl'}

{block 'layout_page_title'}
    <h2>
        {$aLang.user.settings.profile.title}
    </h2>
{/block}

{block 'layout_content'}
    {capture name="form"}
        <form  data-form-validate data-form-ajax data-url="{$oUserProfile->getProfileUrl()}/settings/profile-ajax" novalidate>
            {$oUserProfile->_setValidateScenario('profile_settings')}
            
            {* Фото*}
            
            {hook run="profile_settings_start" oUser=$oUserProfile}

                
            {* Имя Фамилия *}
            {component 'form' 
                template    = 'text' 
                name        = "name"
                label       = $aLang.user.settings.profile.form.name.label
                placeholder = $aLang.user.settings.profile.form.name.placeholder
                type        = "text"
                value       = $oUserProfile->getName()
                validate       = [ 
                    entity  => $oUserProfile
                ]
                }
                
            {* Логин *}
            {component 'form' 
                template    = 'text' 
                name        = "login"
                label       = $aLang.auth.registration.form.fields.login.placeholder
                placeholder = $aLang.auth.registration.form.fields.login.placeholder
                type        = "text"
                desc        = $aLang.auth.registration.form.fields.login.desc  
                value       = $oUserProfile->getLogin()
                validate       = [ 
                    entity  => $oUserProfile,
                    remote  => true,
                    only_change => true
                ]}
                

            {* Телефон *}
            {component 'form' 
                template    = 'text' 
                name        = "phone"
                label       = $aLang.user.settings.profile.form.phone.label
                placeholder = $aLang.user.settings.profile.form.phone.placeholder
                type        = "text"
                value       = $oUserProfile->getPhone()
                validate       = [ 
                    entity  => $oUserProfile
                ]
                }

            {* Сайт *}
            {*{component 'form' 
                template    = 'text' 
                name        = "site"
                label       = $aLang.user.settings.profile.form.site.label
                placeholder = $aLang.user.settings.profile.form.site.placeholder
                type        = "text"
                value       = $oUserProfile->getSite()
                validate       = [ 
                    entity  => $oUserProfile
                ]
                }*}

            {* Адресс *}
            {component 'form' 
                template    = 'text' 
                name        = "address"
                label       = $aLang.user.settings.profile.form.address.label
                placeholder = $aLang.user.settings.profile.form.address.placeholder
                type        = "text"
                value       = $oUserProfile->getAddress()
                validate    = [ 
                    entity  => $oUserProfile
                ]
                }                               
            
            {* О себе *}
            {component 'form' 
                template    = 'textarea' 
                name        = "about"
                label       = $aLang.user.settings.profile.form.about.label
                placeholder = $aLang.user.settings.profile.form.about.placeholder
                value       = $oUserProfile->getAbout()
                validate       = [ 
                    entity  => $oUserProfile
                ]
                }
           
                
            {hook run="profile_settings_end" oUser=$oUserProfile}

            <div class="d-flex justify-content-center">
                {component 'button' 
                    classes = ""
                    name='submit_settings' 
                    type="submit" 
                    bmods='primary' 
                    text=$aLang.common.save}
            </div>
        </form>
    {/capture}
    
    {component 'card' bg="light" content=[
        
        [   
            type => 'body',
            content => $smarty.capture.form
        ]
    ]}
    
{/block}
