<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>registerform</title>

            <!-- Site favicon -->
            <link rel="apple-touch-icon" sizes="180x180" href="vendors/images/apple-touch-icon.png">
            <link rel="icon" type="image/png" sizes="32x32" href="vendors/images/favicon-32x32.png">
            <link rel="icon" type="image/png" sizes="16x16" href="vendors/images/favicon-16x16.png">

            <!-- Mobile Specific Metas -->
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">

            <!-- CSS -->
            <link rel="stylesheet" type="text/css" href="vendors/styles/core.css">
            <link rel="stylesheet" type="text/css" href="vendors/styles/icon-font.min.css">
            <link rel="stylesheet" type="text/css" href="src/plugins/jquery-steps/jquery.steps.css">
            <link rel="stylesheet" type="text/css" href="src/plugins/jquery-asColorPicker/dist/css/asColorPicker.css">
            <link rel="stylesheet" type="text/css" href="vendors/styles/style.css">

            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
            <script>
                window.dataLayer = window.dataLayer || [];
                function gtag() { dataLayer.push(arguments); }
                gtag('js', new Date());

                gtag('config', 'UA-119386393-1');
            </script>
            <style>
                .passwordsp,
                .phonesp,
                .customCheck1sp {
                    color: red;
                }
            </style>
        </head>

        <body class="login-page">
            <div class="login-header box-shadow">
                <div class="container-fluid d-flex justify-content-between align-items-center">
                    <div class="brand-logo">
                        <a href="login">
                            <img src="vendors/images/deskapp-logo.svg" alt="">
                        </a>
                    </div>
                    <div class="login-menu">
                        <ul>
                            <li><a href="login">??????</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6 col-lg-7">
                            <img src="vendors/images/register-page-img.png" alt="">
                        </div>
                        <div class="col-md-6 col-lg-5">
                            <div class="register-box bg-white box-shadow border-radius-10">
                                <div class="wizard-content">
                                    <form class="tab-wizard2 wizard-circle wizard" action="checkregisterform" method="post"
                                        onsubmit="return checkAll()" id="register">
                                        <h5>????????????</h5>
                                        <section>
                                            <div class="form-wrap max-width-600 mx-auto">
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">???????????????*</label>
                                                    <div class="col-sm-8">
                                                        <input id="account" type="text" class="form-control"
                                                            name="account" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">Email*</label>
                                                    <div class="col-sm-8">
                                                        <input id="email" type="email" class="form-control" name="email"
                                                            required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">??????*</label>
                                                    <div class="col-sm-8">
                                                        <input id="password" type="password" class="form-control"
                                                            name="password" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">????????????*</label>
                                                    <div class="col-sm-8">
                                                        <input id="passwordCheck" type="password" class="form-control"
                                                            name="passwordCheck" required>
                                                        <span class="passwordsp"></span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">??????*</label>
                                                    <div class="col-sm-8">
                                                        <input id="phone" type="tel" class="form-control" name="phone"
                                                            required>
                                                        <span class="phonesp"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <input type="hidden" name="statusId" value="0">
                                            <input type="hidden" name="statusName" value="????????????">
                                        </section>
                                        <!-- Step 2 -->
                                        <h5>????????????(?????????)</h5>
                                        <section>
                                            <div class="form-wrap max-width-600 mx-auto">
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">??????</label>
                                                    <div class="col-sm-8">
                                                        <input id="name" type="text" class="form-control" name="name">
                                                    </div>
                                                </div>
                                                <div class="form-group row align-items-center">
                                                    <label class="col-sm-4 col-form-label">??????</label>
                                                    <div class="col-sm-8">
                                                        <div
                                                            class="custom-control custom-radio custom-control-inline pb-0">
                                                            <input type="radio" name="gender" id="male"
                                                                class="custom-control-input" value="male">
                                                            <label class="custom-control-label" for="male">???</label>
                                                        </div>
                                                        <div
                                                            class="custom-control custom-radio custom-control-inline pb-0">
                                                            <input type="radio" name="gender" id="female"
                                                                class="custom-control-input" value="female">
                                                            <label class="custom-control-label" for="female">???</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">??????</label>
                                                    <div class="col-sm-8">
                                                        <input id="birthday" type="text"
                                                            class="form-control date-picker" placeholder="??????????????????"
                                                            name="birthday">
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                        <!-- Step 3 -->
                                        <h5>??????(?????????)</h5>
                                        <section>
                                            <div class="form-wrap max-width-600 mx-auto">
                                                <div class="form-group">
                                                    <div class="col-sm-8">
                                                        <input class="photo form-control-file form-control height-auto"
                                                            type="file" name="photo" style="width: 300px">
                                                        <input class="photoBase64" type="hidden" name="photoBase64"
                                                            value="">
                                                    </div>
                                                    <div class="previewPhoto col-sm-8"
                                                        style="margin: auto; margin-top: 10px;"></div>
                                                </div>
                                            </div>
                                        </section>
                                        <!-- Step 4 -->
                                        <h5>??????</h5>
                                        <section>
                                            <div class="form-wrap max-width-600 mx-auto">
                                                <ul class="register-info">
                                                    <li>
                                                        <div class="row">
                                                            <div class="col-sm-4 weight-600">???????????????</div>
                                                            <div id="previewAccount" class="col-sm-8"></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="row">
                                                            <div class="col-sm-4 weight-600">Email</div>
                                                            <div id="previewEmail" class="col-sm-8"></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="row">
                                                            <div class="col-sm-4 weight-600">??????</div>
                                                            <div id="previewPassword" class="col-sm-8"></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="row">
                                                            <div class="col-sm-4 weight-600">??????</div>
                                                            <div id="previewPhone" class="col-sm-8"></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="row">
                                                            <div class="col-sm-4 weight-600">??????</div>
                                                            <div id="previewPhoto" class="col-sm-8"></div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <div class="custom-control custom-checkbox mt-4">
                                                    <input type="checkbox" class="custom-control-input"
                                                        id="customCheck1" name="customCheck1" value="checkbox"
                                                        onclick="checkCheckBox()">
                                                    <label class="custom-control-label" for="customCheck1">?????????????????????<a
                                                            href="#">????????????</a>???<a href="#">????????????</a></label>
                                                </div>
                                                <span class="customCheck1sp"></span>
                                            </div>
                                        </section>
                                    </form>
                                </div>
                                <div style="margin-bottom: 5px; text-align: center;">
                                    <% List<String> errors=(List<String>) request.getAttribute("errors");
                                            if(errors!=null){ %>
                                            <ul style="color:red">
                                                <% for(String error : errors){ %>
                                                    <li>
                                                        <%= error %>
                                                    </li>
                                                    <% } %>
                                            </ul>
                                            <% } %>
                                </div>
                                <div style="text-align: center;">
                                    <button class="btn btn-secondary" type="button" onclick="oneClick()">????????????</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- success Popup html Start -->
            <button type="button" id="success-modal-btn" hidden data-toggle="modal" data-target="#success-modal"
                data-backdrop="static">Launch modal</button>
            <div class="modal fade" id="success-modal" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered max-width-400" role="document">
                    <div class="modal-content">
                        <div class="modal-body text-center font-18">
                            <h3 class="mb-20">????????????</h3>
                            <div class="mb-30 text-center"><img src="vendors/images/success.png"></div>
                            ?????????????
                        </div>
                        <div class="modal-footer justify-content-center">
                            <a href="#" onclick="$('#register').submit()" class="btn btn-success">??????</a>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">??????</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- success Popup html End -->

            <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
                </script>
            <!-- js -->
            <script src="vendors/scripts/core.js"></script>
            <script src="vendors/scripts/script.min.js"></script>
            <script src="vendors/scripts/process.js"></script>
            <script src="vendors/scripts/layout-settings.js"></script>
            <script src="src/plugins/jquery-steps/jquery.steps.js"></script>
            <script src="vendors/scripts/steps-setting.js"></script>
            <script src="src/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
            <script src="src/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
            <script src="src/plugins/jquery-asColorPicker/jquery-asColorPicker.js"></script>
            <script src="vendors/scripts/colorpicker.js"></script>

            <script>
                let password = false, phone = false, checkbox = false;
                $("#password").bind("input propertychange", checkPassword1);
                $("#passwordCheck").bind("input propertychange", checkPassword2);
                $("#phone").bind("input propertychange", checkPhone);
                function checkPassword1() {
                    let passwordVal = $(this).val();
                    let checkVal = $(this).parent("div").parent("div").next("div").children("div").children("#passwordCheck").val();
                    if (checkVal == passwordVal) {
                        $(this).parent("div").parent("div").next("div").children("div").children(".passwordsp").html(``);
                        password = true;
                    } else {
                        $(this).parent("div").parent("div").next("div").children("div").children(".passwordsp").html(`??????????????????????????????????????????`);
                        password = false;
                    }
                }

                function checkPassword2() {
                    let checkVal = $(this).val();
                    let passwordVal = $(this).parent("div").parent("div").prev("div").children("div").children("#password").val();
                    if (checkVal == passwordVal) {
                        $(this).next(".passwordsp").html(``);
                        password = true;
                    } else {
                        $(this).next(".passwordsp").html(`??????????????????????????????????????????`);
                        password = false;
                    }
                }

                function checkPhone() {
                    let phoneVal = $(this).val();
                    let reg = /^09\d{8}$/;
                    if (reg.test(phoneVal)) {
                        $(this).next(".phonesp").html(``);
                        phone = true;
                    } else {
                        $(this).next(".phonesp").html(`????????????`);
                        phone = false;
                    }
                }

                function checkCheckBox() {
                    if ($("#customCheck1").prop("checked")) {
                        $(".customCheck1sp").html(``);
                        checkbox = true;
                    } else {
                        $(".customCheck1sp").html(`???????????????????????????`);
                        checkbox = false;
                    }
                }

                function checkAll() {
                    checkCheckBox();
                    return password && phone && checkbox;
                }

                function resetAll() {
                    password = true;
                    phone = true;
                    $(".passwordsp").html(``);
                    $(".phonesp").html(``);
                }

                function oneClick() {
                    $("input").eq(0).val("?????????");
                    $("input").eq(1).val("987654@gmail.com");
                    $("input").eq(2).val("123456");
                    $("input").eq(3).val("123456");
                    $("input").eq(4).val("0998765432");
                    $("input").eq(7).val("?????????");
                    $("#male").prop("checked", true);
                    resetAll();
                    preview();
                }

                $("#account").bind("input propertychange", preview);
                $("#email").bind("input propertychange", preview);
                $("#password").bind("input propertychange", preview);
                $("#phone").bind("input propertychange", preview);

                function preview() {
                    $("#previewAccount").html($("#account").val());
                    $("#previewEmail").html($("#email").val());
                    $("#previewPassword").html($("#password").val());
                    $("#previewPhone").html($("#phone").val());
                }

                // ????????????????????????????????????????????????????????????previewFiles()
                $(".photo").change(function () {
                    $(this).parent("div").next("div").empty() // ??????????????????
                    previewFiles.call(this, this.files) // this??????<input>??????
                });

                // ???????????????????????????files?????????????????????convertFile()
                function previewFiles(files) {
                    if (files && files.length >= 1) {
                        $.map(files, file => {
                            convertFile(file)
                                .then(data => {
                                    //console.log(data) // ??????????????????????????????console
                                    showPreviewImage.call(this, data, file.name)
                                })
                                .catch(err => console.log(err))
                        })
                    }
                }

                // ??????FileReader???????????????????????????Base64????????????source
                function convertFile(file) {
                    return new Promise((resolve, reject) => {
                        // ??????FileReader??????
                        let reader = new FileReader()
                        // ??????onload???????????????result???resolve (????????????Base64??????)
                        reader.onload = () => { resolve(reader.result) }
                        // ??????onerror??????????????????error???reject
                        reader.onerror = () => { reject(reader.error) }
                        // ????????????
                        reader.readAsDataURL(file)
                    })
                }

                // ??????????????????<img>
                function showPreviewImage(src, fileName) {
                    let image = new Image(250) // ?????????250px
                    image.name = fileName
                    image.src = src // <img>???src???????????????url?????????????????????Base64??????
                    let photo = new Image(70)
                    photo.name = fileName
                    photo.src = src
                    $(this).parent("div").next("div").append(image);
                    $("#previewPhoto").append(photo);
                    $(this).next(".photoBase64").attr("value", `\${src}`);
                }
            </script>
        </body>

        </html>