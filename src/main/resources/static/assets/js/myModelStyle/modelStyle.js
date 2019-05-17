
jQuery(document).ready(function() {
    "use strict";
    if (location.href.search(contentPath+"/login")<=0 &&
        location.href.search(contentPath+"/user/resetPasswordPage")<=0 &&
        location.href.search(contentPath+"/link")<=0){

        /*var url = contentPath+"/api/view/sys/menu/tree";
        if(window.menuApp != undefined) {
            url = url + "?app=" + window.menuApp;
        }
        console.log("url:", url);
        $.ajax({
            type: "POST",
            url: url,
            async: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type", "application/json;charset=UTF-8");
            },
            dataType: "json",
            data: '{}',
            success: function (data) {
                var str = '<li class="sidebar-label pt20">首页</li><li class="active"><a href='+contentPath+'"/"><span class="glyphicon glyphicon-home"></span> <span class="sidebar-title">控制台</span></a></li>'

                if(data.data!=null){
                    $.each(data.data.subMenus, function(index, menu){
                        str = str + buildMenus(menu, '');
                    });
                }

                $('#menuBar').html(str);

                function buildMenus(menu) {
                    var menuHtml = '';
                    if(menu.type == 0){ // 标签
                        menuHtml = menuHtml + '<li class="sidebar-label pt15">'+menu.name+'</li>';
                        if(menu.subMenus != undefined && menu.subMenus.length > 0){
                            $.each(menu.subMenus, function(index, item){
                                menuHtml = menuHtml + buildMenus(item);
                            });
                        }
                        return menuHtml;
                    }
                    if(menu.type == 2){ // 分组
                        menuHtml = menuHtml
                            + '<li>'
                            +   '<a class="accordion-toggle" href="#">'
                            +       '<span class="glyphicon glyphicon-tower"></span>'
                            +       '<span class="sidebar-title">'+menu.name+'</span><span class="caret"></span>'
                            +   '</a>'
                            +   '<ul class="nav sub-nav" style="">';

                        if(menu.subMenus != undefined && menu.subMenus.length > 0){
                            $.each(menu.subMenus, function(index, item){
                                menuHtml = menuHtml + buildMenus(item);
                            });
                        }
                        menuHtml = menuHtml
                            +   '</ul>'
                            + '</li>';
                        return menuHtml;
                    }
                    if(menu.type == 1){ //普通菜单
                        return '<li>'
                            + '<a href="'+contentPath+menu.path+'">'
                            +    '<span class="glyphicon glyphicon-calendar"></span> '
                            +    '<span class="sidebar-title">'+menu.name+'</span> '
                            + '</a>'
                            +'</li>';
                    }
                    // 如果不是上述三种之一, 直接返回原str
                    return '';
                }
            },
            error:function (data) {
            }
        });*/

        setActiveClassForMenu();

        /*$.post(contentPath+"/api/view/sys/user/principal", null, function(data){
            var currentUser = data.data.trueName+"("+data.data.nickName+")";
            if (data.data.nickName == null){
                currentUser = data.data.trueName;
            }
            $('#vueheader').find('> ul.nav.navbar-nav.navbar-right > li > a > b').text(currentUser);
        },"json");
*/
        Core.init();

        $('.admin-panels').adminpanel({
            grid: '.admin-grid',
            draggable: true,
            preserveGrid: true,
            mobile: true,
            onStart: function() {
                // Do something before AdminPanels runs
            },
            onFinish: function() {
                $('.admin-panels').addClass('animated fadeIn').removeClass('fade-onload');
            },
            onSave: function() {
                $(window).trigger('resize');
            }
        });
    }

});
function setActiveClassForMenu() {
    var pathname = location.pathname;
    if(pathname.length>0){
        var lastChar = pathname.charAt(pathname.length-1);
        if(lastChar === '/'){
            pathname = pathname.substring(0, pathname.length-1);
        }
    }

    var result = setActive(pathname);
    if(result==false){
        var referrer = document.referrer.replace(location.protocol+'//'+location.host,'');
        setActive(referrer);
    }
    function setActive(pathname){
        var $menu = $("[href='"+pathname+"'");
        if($menu.length>=1){
            $menu.parent('li').addClass('active')
                .parent('ul').prev('.accordion-toggle').addClass('menu-open');
            return true;
        }
        return false;
    }
}