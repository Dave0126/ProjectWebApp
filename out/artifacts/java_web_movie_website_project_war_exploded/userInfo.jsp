<%@ page import="domain.User" %><%--
  Created by IntelliJ IDEA.
  User: Guohao
  Date: 2022/04/10
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Movie DataBase</title>

    <link rel="icon" type="image/x-icon" href="img/logo.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link href="css/cropper.min.css" rel="stylesheet">
    <link href="css/sitelogo.css" rel="stylesheet">


</head>

<style>
    .avatar-btns button {
        height: 35px;
    }
</style>

<body class="bg-white">
<script src="js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.bundle.min.js"></script>--%>
<script src="js/bootstrap.min.js"></script>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user == null) {
        request.getRequestDispatcher("loginAndRegister.jsp").forward(request, response);
    }
%>
<div class="container-fluid p-0" style="">
    <jsp:include page="userHeader.jsp"/>

    <script src="js/cropper.js"></script>
    <script src="js/sitelogo.js"></script>

    <div class="container">
        <div class="row">
            <h5 class="text-secondary">Account Info.</h5>
            </br>
            <div class="col-md-12">
                <div class="row">
                    <div class="col">
                        <label for="">Username </label>
                        <input type="text" class="form-control" placeholder="<%=user.getUsername()%>" disabled>

                    </div>
                    <div class="col">
                        <label for="">E-mail address</label>
                        <input type="email" class="form-control" placeholder="<%=user.getEmail()%>" disabled>

                    </div>
                </div>
            </div>
        </div>

        <!-- 修改密码 -->
        <div class="row mt-4">
            <h5 class="text-secondary">Change Password</h5>
            </br>
            <div class="col-md-12">
                <div class="row">

                    <div class="col">
                        <label for="new-password">new Password </label>
                        <input type="password" id="new-password" class="form-control" placeholder="Please enter the new Password">

                    </div>
                    <div class="col">
                        <label for="confirm-password">Confirm your Password</label>
                        <input type="password" id="confirm-password" class="form-control" placeholder="Please enter your Password again">

                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12 text-center">
                        <input type="submit" class="btn btn-info" value="SUBMIT" style="width: 200px;"
                               onclick="alterPassword()">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="user_pic" style="margin: 10px;">
    <img src="">
</div>

<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form class="avatar-form">
                <div class="modal-header">
                    <h4 class="modal-title float-left" id="avatar-modal-label">Upload images</h4>
                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="avatar-body">
                        <div class="avatar-upload">
                            <input class="avatar-src" name="avatar_src" type="hidden">
                            <input class="avatar-data" name="avatar_data" type="hidden">
                            <label for="avatarInput" style="line-height: 35px;">Upload images</label>
                            <button class="btn btn-danger" type="button" style="height: 35px;"
                                    onclick="$('input[id=avatarInput]').click();">Choose a image...
                            </button>
                            <span id="avatar-name"></span>
                            <input class="avatar-input invisible" id="avatarInput" name="avatar_file" type="file">
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="avatar-wrapper"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="avatar-preview preview-lg" id="imageHead"></div>
                                <!--<div class="avatar-preview preview-md"></div>
                                    <div class="avatar-preview preview-sm"></div>-->
                            </div>
                        </div>
                        <div class="row avatar-btns">
                            <div class="col-md-5">
                                <div class="btn-group">
                                    <button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90"
                                            type="button" title="Rotate -90 degrees"> Turn left
                                    </button>
                                </div>
                                <div class="btn-group">
                                    <button class="btn  btn-danger fa fa-repeat" data-method="rotate"
                                            data-option="90" type="button" title="Rotate 90 degrees"> Turn right
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-4" style="text-align: right;">
                                <button class="btn btn-danger fa fa-arrows" data-method="setDragMode"
                                        data-option="move" type="button" title="Move">
                                        <span class="docs-tooltip" data-toggle="tooltip" title=""
                                              data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
                                        </span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom"
                                        data-option="0.1" title="Zoom in">
                                        <span class="docs-tooltip" data-toggle="tooltip" title=""
                                              data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
                                            <!--<span class="fa fa-search-plus"></span>-->
                                        </span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom"
                                        data-option="-0.1" title="Zoom out">
                                        <span class="docs-tooltip" data-toggle="tooltip" title=""
                                              data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
                                            <!--<span class="fa fa-search-minus"></span>-->
                                        </span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-refresh" data-method="reset"
                                        title="Reset">
                                        <span class="docs-tooltip" data-toggle="tooltip" title=""
                                              data-original-title="$().cropper(&quot;reset&quot;)"
                                              aria-describedby="tooltip866214">
                                        </span>
                                </button>
                                <div class="col-md-3">
                                    <button class="btn btn-danger btn-block avatar-save fa fa-save" type="button"
                                            data-dismiss="modal"> Save
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>

<script src="js/html2canvas.min.js"></script>
<script type="text/javascript">
    //做个下简易的验证  大小 格式
    $('#avatarInput').on('change', function(e) {
        var filemaxsize = 1024 * 5; //5M
        var target = $(e.target);
        var Size = target[0].files[0].size / 1024;
        if (Size > filemaxsize) {
            alert('The image is too large, please re-select!'); // 图片过大，请重新选择!
            $(".avatar-wrapper").childre().remove;
            return false;
        }
        if (!this.files[0].type.match(/image.*/)) {
            alert('Please choose the correct picture!') // 请选择正确的图片!
        } else {
            var filename = document.querySelector("#avatar-name");
            var texts = document.querySelector("#avatarInput").value;
            var teststr = texts; // 这里的路径写错了
            testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
            filename.innerHTML = testend;
        }

    });

    $(".avatar-save").on("click", function() {
        var img_lg = document.getElementById('imageHead');
        // 截图小的显示框内的内容
        html2canvas(img_lg, {
            allowTaint: true,
            taintTest: false,
            onrendered: function(canvas) {
                canvas.id = "mycanvas";
                //生成base64图片数据
                var dataUrl = canvas.toDataURL("image/jpeg;image/jpg");
                var newImg = document.createElement("img");
                newImg.src = dataUrl;
                imagesAjax(dataUrl)
            }
        });
    });

    function imagesAjax(src) {
        var data = {};
        data.img = src;
        data.jid = $('#jid').val();
        $.ajax({
            url: "upload-logo.php",
            data: data,
            type: "POST",
            dataType: 'json',
            success: function(re) {
                if (re.status == '1') {
                    $('.user_pic img').attr('src', src);
                }
            }
        });
    }
</script>

</body>

</html>
