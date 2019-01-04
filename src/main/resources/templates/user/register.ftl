<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <title>Shop_Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include '../include/baselink.ftl'>
</head>
<body class="admin-modals-page sb-l-o sb-r-c onload-check">
    <div id="main">
        <div class="login-panel panel" style="margin-left: 6px;">

            <#--用户注册-->
            <div class="container">
                <header><h1>注册账号</h1></header>
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                        <form role="form" id="form-create-account" @submit.prevent="userRegister">
                            <hr>
                            <div class="form-group">
                                <label for="form-create-account-full-name">用户名:</label>
                                <input type="text" class="form-control" id="form-create-account-full-name" name="name" v-model="user.name" required>
                            </div>
                            <div class="form-group">
                                <label for="form-create-account-email">邮箱:</label>
                                <input type="text" class="form-control" id="form-create-account-email"  name="email" v-model="user.email" required>
                            </div>
                            <div class="form-group">
                                <label for="form-create-account-email">手机号:</label>
                                <input type="text" class="form-control" id="form-create-account-email" name="phone" v-model="user.phone" required>
                            </div>
                            <div class="form-group">
                                <label for="form-create-account-password">密码:</label>
                                <input type="password" class="form-control" id="form-create-account-password" name="password" v-model="user.password" required>
                            </div>
                            <div class="form-group">
                                <label for="form-create-account-confirm-password">确认密码:</label>
                                <input type="password" class="form-control" id="form-create-account-confirm-password" name="confirmPassword" v-model="user.confirmPassword" required>
                            </div>
                            <div class="form-group clearfix">
                                <button type="submit" class="btn pull-right btn-default" id="account-submit">注册账号</button>
                            </div>
                        </form>
                        <div><a href="/sign">返回登录</a></div>
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
                    name:'',
                    email:'',
                    phone:'',
                    password:'',
                    confirmPassword:''
                }
            },
            created: function(){},
            watch:{},
            mounted:function () {},
            computed:{},
            methods: {
                userRegister: function () {
                    if (this.user.password != this.user.confirmPassword){
                        alert("两次密码不相同，请重新输入！");
                        $("#form-create-account-password").focus();
                        return;
                    }
                    let url = contentPath + '/user/register';
                    this.$http.post(url, this.user).then(function (response) {
                        if(response.data.retcode == 5000000){
                            alert(response.data.msg)
                        }else{
                            alert("注册成功");
                        }
                    }, function (error) {
                        toastr.error(error.body.msg, '用户注册失败！');
                    });
                }
            }
        });
    </script>
    </html>