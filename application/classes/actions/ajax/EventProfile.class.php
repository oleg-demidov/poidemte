<?php

/**
 * Description of 
 *
 * @author oleg
 */
class ActionAjax_EventProfile extends Event {
      

    public function EventSearchUsers() {
        
        if(getRequest('query') == ''){
            $this->assign('count', 0);
            $this->assign('html', '');
            return;
        }
        
        $aFilter = [
            "#where" => [
                '(t.login LIKE ? OR t.mail LIKE ? OR t.about LIKE ? OR t.name LIKE ?)' => [
                    '%'.getRequest('query').'%',
                    '%'.getRequest('query').'%',
                    '%'.getRequest('query').'%',
                    '%'.getRequest('query').'%'
                ]
            ],
            'active' => 1,
            'activate' => 1,
            '#limit' => Config::Get('module.user.search_ajax.limit')
        ];
        
        $aUsers = $this->User_GetUserItemsByFilter($aFilter);
        
        
        $oViewer = $this->Viewer_GetLocalViewer();
        $oViewer->Assign('items', $aUsers, true);
        $sHtml = $oViewer->Fetch('component@user.list');
        
        
        $this->assign('count', count($aUsers));
        $this->assign('html', $sHtml);
    }
}
