<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <title>Shop_ReSet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include '../include/baselink.ftl'>
</head>
<body class="admin-modals-page sb-l-o sb-r-c onload-check">
    <div id="main">
        <div class="login-panel panel" style="margin-left: 6px;">

            <#--密码修改-->
            <div class="container">
                <header><h2>为{{user.email}}重设密码:</h2></header>
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                        <form role="form" id="form-create-account" @submit.prevent="setPwd">
                            <hr>
                            <div class="form-group">
                                <label for="form-create-account-password">新密码:</label>
                                <input type="password" class="form-control" id="form-create-account-password" name="password" v-model="user.password" required>
                            </div>
                            <div class="form-group">
                                <label for="form-create-account-confirm-password">确认密码:</label>
                                <input type="password" class="form-control" id="form-create-account-confirm-password" name="confirmPassword" v-model="user.confirmPassword" required>
                            </div>
                            <div class="form-group clearfix">
                                <button type="submit" class="btn pull-right btn-default" id="account-submit">重置</button>
                            </div>
                        </form>
                        <hr>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->

        </div>
    </div>
    <#include '../include/footer_js.ftl'/>
    </body>
    <#--Vue-->
    <script>
        var app = new Vue({
            el: '#main',
            data: {
                user:{
                    email:'',
                    password:'',
                    confirmPassword:''
                }
            },
            created: function(){
                function getQueryString(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null)
                        return unescape(r[2]);
                    return null;
                }
                this.user.email = getQueryString("email");
            },
            watch:{},
            mounted:function () {},
            computed:{},
            methods: {
                setPwd: function () {
                    if (this.user.password != this.user.confirmPassword){
                        alert("两次密码不相同，请重新输入！");
                        return;
                    }
                    let url = contentPath + '/user/updatePwd';
                    this.$http.post(url, this.user).then(function (response) {
                        alert("密码修改成功，请登录！")
                        window.location.href = "/sign";
                    }, function (error) {
                        toastr.error(error.body.msg, '用户注册失败！');
                    });
                }
            }
        });
    </script>
    </html>