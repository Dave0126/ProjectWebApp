<%--
  Created by IntelliJ IDEA.
  User: Guohao
  Date: 2022/04/10
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Login</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/sign-up-login.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/inputEffect.css"/>
    <link rel="stylesheet" href="css/tooltips.css"/>
    <link rel="stylesheet" href="css/spop.min.css"/>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/snow.js"></script>
    <script src="js/jquery.pure.tooltips.js"></script>
    <script src="js/spop.min.js"></script>
    <script>
        (function () {
            // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
            if (!String.prototype.trim) {
                (function () {
                    // Make sure we trim BOM and NBSP
                    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                    String.prototype.trim = function () {
                        return this.replace(rtrim, '');
                    };
                })();
            }

            [].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
                // in case the input is already filled..
                if (inputEl.value.trim() !== '') {
                    classie.add(inputEl.parentNode, 'input--filled');
                }

                // events:
                inputEl.addEventListener('focus', onInputFocus);
                inputEl.addEventListener('blur', onInputBlur);
            });

            function onInputFocus(ev) {
                classie.add(ev.target.parentNode, 'input--filled');
            }

            function onInputBlur(ev) {
                if (ev.target.value.trim() === '') {
                    classie.remove(ev.target.parentNode, 'input--filled');
                }
            }
        })();

        $(function () {
            $('#login #login-password').focus(function () {
                $('.login-owl').addClass('password');
            }).blur(function () {
                $('.login-owl').removeClass('password');
            });
            $('#login #register-password').focus(function () {
                $('.register-owl').addClass('password');
            }).blur(function () {
                $('.register-owl').removeClass('password');
            });
            $('#login #register-repassword').focus(function () {
                $('.register-owl').addClass('password');
            }).blur(function () {
                $('.register-owl').removeClass('password');
            });
            $('#login #forget-password').focus(function () {
                $('.forget-owl').addClass('password');
            }).blur(function () {
                $('.forget-owl').removeClass('password');
            });
        });

        function goto_register() {
            $("#register-username").val("");
            $("#register-password").val("");
            $("#register-repassword").val("");
            $("#register-code").val("");
            $("#tab-2").prop("checked", true);
        }

        function goto_login() {
            $("#login-username").val("");
            $("#login-password").val("");
            $("#tab-1").prop("checked", true);
        }

        function goto_forget() {
            $("#forget-username").val("");
            $("#forget-password").val("");
            $("#forget-code").val("");
            $("#tab-3").prop("checked", true);
        }

        function login() { //??????
            var username = $("#login-username").val(),
                password = $("#login-password").val(),
                validatecode = null,
                flag = true;
            //?????????????????????????????????
            if (username == "") {
                $.pt({
                    target: $("#login-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Username can not be empty!"
                });
                flag = false;
            }
            if (password == "") {
                $.pt({
                    target: $("#login-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Password can not be empty!"
                });
                flag = false;
            }
            //??????????????????15???????????????????????????
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#login-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Username must be less than 15 numbers or letters!"
                });
                flag = false;
            }

            if (!flag) {
                return false;
            } else { //??????
                //?????????????????????????????????
                return true;
            }
        }

        //??????
        function register() {
            var username = $("#register-username").val(),
                password = $("#register-password").val(),
                repassword = $("#register-repassword").val(),
                code = $("#register-code").val(),
                flag = true,
                validatecode = null;
            //?????????????????????????????????
            if (username == "") {
                $.pt({
                    target: $("#register-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Username can not be empty!"
                });
                flag = false;
            }
            if (password == "") {
                $.pt({
                    target: $("#register-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Password can not be empty!"
                });
                flag = false;
            } else {
                if (password != repassword) {
                    $.pt({
                        target: $("#register-repassword"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "Password is wrong!"
                    });
                    flag = false;
                }
            }
            //??????????????????15???????????????????????????
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#register-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Username must be less than 15 numbers or letters! "
                });
                flag = false;
            }
            //?????????????????????????????????
            //???????????????????????????????????????????????????
            $.ajax({
                url:"register.do",
                data:"username="+ username +"&password="+password+"&email="+code,
                type:"POST",
                async: false,
                success:function (data) {
                    if(data === "ok"){
                        spop({
                            template: '<h4 class="spop-title">Registered successfully</h4>Coming back to login in 3 seconds',
                            position: 'top-center',
                            style: 'success',
                            autoclose: 3000,
                            onOpen: function () {
                                var second = 2;
                                var showPop = setInterval(function () {
                                    if (second == 0) {
                                        clearInterval(showPop);
                                    }
                                    $('.spop-body').html('<h4 class="spop-title">Registered successfully</h4>Coming back to login in ' + second +
                                        'seconds');
                                    second--;
                                }, 1000);
                            },
                            onClose: function () {
                                goto_login();
                                flag = true;
                            }
                        });
                    }else{
                        alert("Registration failed, username already exists!!");
                        flag = false;
                    }
                }
            });

            if (flag) {
                return false;
            }
        }

        //????????????
        function forget() {
            var username = $("#forget-username").val(),
                password = $("#forget-password").val(),
                code = $("#forget-code").val(),
                flag = false,
                validatecode = null;
            //?????????????????????????????????
            if (username == "") {
                $.pt({
                    target: $("#forget-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Username can not be empty"
                });
                flag = true;
            }
            if (password == "") {
                $.pt({
                    target: $("#forget-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Password can not be blank"
                });
                flag = true;
            }
            //??????????????????15???????????????????????????
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#forget-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "Username must be less than 15 letters or numbers"
                });
                flag = true;
            }
            //???????????????????????????
            //???????????????


            if (flag) {
                return false;
            } else { //????????????
                spop({
                    template: '<h4 class="spop-title">Password reset successful</h4>Coming back to login in 3 seconds',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 3000,
                    onOpen: function () {
                        var second = 2;
                        var showPop = setInterval(function () {
                            if (second == 0) {
                                clearInterval(showPop);
                            }
                            $('.spop-body').html('<h4 class="spop-title">Password reset successful</h4>Coming back to login in ' + second +
                                'seconds');
                            second--;
                        }, 1000);
                    },
                    onClose: function () {
                        goto_login();
                    }
                });
                return false;
            }
        }
    </script>
    <style type="text/css">
        html {
            width: 100%;
            height: 100%;
        }

        body {

            background-repeat: no-repeat;

            background-position: center center #2D0F0F;

            background-color: #00BDDC;

            background-image: url(images/snow.jpg);

            background-size: 100% 100%;

        }

        .snow-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 100001;
        }
    </style>
</head>

<body>
<%
    String s = (String) request.getServletContext().getAttribute("msg");
    if(s != null){

%>
<script>
    $(document).ready(function () {
        alert("This account is logged in elsewhere, please log in again");
    })
</script>
<%
        request.getServletContext().removeAttribute("msg");
    }
%>
<!-- ???????????? -->
<div class="snow-container"></div>
<!-- ???????????? -->
<div id="login">
    <input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked/>
    <input id="tab-2" type="radio" name="tab" class="sign-up hidden"/>
    <input id="tab-3" type="radio" name="tab" class="sign-out hidden"/>
    <div class="wrapper">
        <!-- ???????????? -->
        <div class="login sign-in-htm">
            <form id="form1" class="container offset1 loginform" action="${pageContext.request.contextPath}/login.do"
                  method="post" onsubmit="return login()">
                <!-- ??????????????? -->
                <div id="owl-login" class="login-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="login-username"
                                       autocomplete="off" placeholder="Please enter Username" tabindex="1" maxlength="15"
                                       name="username"/>
								<label class="input__label input__label--hideo" for="login-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="login-password"
                                       placeholder="Please enter Password" tabindex="2" maxlength="15" name="password"/>
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                    <%
                        String message = (String) request.getAttribute("register_meesage");
                        if (message != null) {
                    %>
                    <span style="color: red; font-size: 1em;"><%=message %></span>
                    <%
                        }
                    %>
                </div>
                <div class="form-actions">
                    <a tabindex="4" class="btn pull-left btn-link text-muted" onClick="goto_forget()">Forgot password ?</a>
                    <a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">Registry</a>
                    <input class="btn btn-primary" type="submit" tabindex="3" value="Login"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- ?????????????????? -->
        <div class="login sign-out-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- ??????????????? -->
                <div id="owl-login" class="forget-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-username"
                                       autocomplete="off" placeholder="Please enter your Username"/>
								<label class="input__label input__label--hideo" for="forget-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="email" id="forget-code"
                                       autocomplete="off" placeholder="Please enter your E-mail address" name="email"/>
								<label class="input__label input__label--hideo" for="forget-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="forget-password"
                                       placeholder="Reset your Password"/>
								<label class="input__label input__label--hideo" for="forget-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onClick="goto_login()">Back to login</a>
                    <input class="btn btn-primary" type="submit" onClick="forget()" value="RESET Password"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- ???????????? -->
        <div class="login sign-up-htm">
            <form id="form2"
                  method="post" class="container offset1 loginform" onsubmit="return register()">
                <!-- ??????????????? -->
                <div id="owl-login" class="register-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-username"
                                       autocomplete="off" placeholder="Please enter your Username" maxlength="15" name="username"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-password"
                                       placeholder="Please enter your Password" maxlength="15" name="password"/>
								<label class="input__label input__label--hideo" for="register-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-repassword"
                                       placeholder="Confirm your Password" maxlength="15" name="confirmPassword"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="email" id="register-code"
                                       autocomplete="off" placeholder="Please enter your E-mail address" name="email"/>
								<label class="input__label input__label--hideo" for="register-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onClick="goto_login()">Back to log in</a>
                    <input class="btn btn-primary" type="submit" value="Registry"
                           style="color:white;"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>