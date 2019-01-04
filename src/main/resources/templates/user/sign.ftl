<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <title>Shop_Sign</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include '../include/baselink.ftl'>
</head>
<body class="admin-modals-page sb-l-o sb-r-c onload-check">
    <div id="main">
        <div class="login-panel panel" style="margin-left: 6px;">

            <#--用户登录框-->
            <div class="container">
                <header><h1>用户登录</h1></header>
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                        <form role="form" @submit.prevent="userSign" id="form-create-account">
                            <div class="form-group">
                                <label for="form-create-account-email">Email:</label>
                                <input type="text"  name="email" v-model="user.email" class="form-control" id="form-create-account-email" required>
                            </div>
                            <div class="form-group">
                                <label for="form-create-account-password">密码:</label>
                                <input type="password" name="password" v-model="user.password" class="form-control" id="form-create-account-password" required>
                            </div>
                            <div class="form-group clear fix">
                                <button type="submit" class="btn pull-right btn-default" id="account-submit">登录</button>
                            </div>
                        </form>

                        <hr>
                        <div class="center"><a href="#" @click="ResetPwd">忘记密码</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="/register">我要注册</a></div>
                    </div>
                </div>
            </div>

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
                }
            },
            created: function(){},
            watch:{
                "itemCondition.id": function () {
                    this.itemCondition.pageNum = 1;
                    this.query();
                }
            },
            mounted:function () {},
            computed:{},
            methods: {
                userSign: function () {
                    let url = contentPath + '/user/sign';
                    this.$http.post(url, this.user).then(function (response) {
                        if(response.data.retcode != 2000000){
                            alert(response.data.msg);
                        }else{
                            window.location.href="/index";
                        }
                    }, function (error) {
                        toastr.error(error.body.msg, '登录失败！');
                    });
                },
                ResetPwd: function(){
                    if(this.user.email.trim() == ''){
                        alert("请输入email再找回密码！")
                    }else{
                        let url = contentPath + '/user/findPwd/'+this.user.email;
                        this.$http.get(url).then(function (response) {
                            alert(response.data.msg);
                        }, function (error) {
                            toastr.error(error.body.msg, '登录失败！');
                        });
                    }
                }
            }
        });
    </script>

    </html>