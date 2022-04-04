<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>registerform</title>
            <style>
                fieldset {
                    width: 400px;
                    margin: auto;
                }

                legend {
                    margin-left: 50px;
                    padding: 15px;
                    font-size: 150%;
                    font-weight: bold;
                }

                .ds1 {
                    width: 250px;
                    margin: auto;
                    margin-bottom: 20px;
                }

                .ip1 {
                    width: 226px;
                    padding: 10px;
                    font-size: 15px;
                }

                .passwordsp,
                .phonesp {
                    color: red;
                }

                .ds2 {
                    width: 250px;
                    margin: 20px 190px;
                }

                #submit {
                    width: 250px;
                    padding: 10px;
                    font-size: 15px;
                }

                a {
                    line-height: 50px;
                }

                ul {
                    width: 100px;
                    margin: auto;
                    padding: 0px;
                    list-style-type: none;
                    text-align: center;
                }

                #button {
                    margin-top: 30px;
                    font-size: 17px;
                }
            </style>
        </head>

        <body>
            <fieldset>
                <legend>註冊</legend>
                <form action="registerform" method="post" onsubmit="return checkAll()">
                    <div class="ds1">
                        <input class="ip1" type="text" name="account" placeholder="使用者名稱" required>
                    </div>
                    <div class="ds1">
                        <input class="ip1 password" type="password" name="password" placeholder="密碼" required>
                    </div>
                    <div class="ds1" style="text-align: center;">
                        <input class="ip1 passwordCheck" type="password" name="passwordCheck" placeholder="密碼確認"
                            required><span class="passwordsp"></span>
                    </div>
                    <div class="ds1">
                        <input class="ip1" type="text" name="name" placeholder="姓名 (非必填)">
                    </div>
                    <div class="ds1">
                        <input class="ip1" type="email" name="email" placeholder="Email" required>
                    </div>
                    <div class="ds1" style="text-align: center;">
                        <input class="ip1 phone" type="tel" name="phone" placeholder="手機" required><span
                            class="phonesp"></span>
                    </div>
                    <div class="ds2">
                        <label>性別：</label>
                        <input type="radio" name="gender" id="male" value="male">男
                        <input type="radio" name="gender" id="female" value="female">女
                    </div>
                    <div class="ds1">
                        <label>生日：</label>
                        <input class="ip1" type="date" name="birthday">
                    </div>
                    <div class="ds2">
                        <label>圖片：</label>
                        <input class="photo" type="file" name="photo" style="width: 250px">
                        <input class="photoBase64" type="hidden" name="photoBase64" value="">
                    </div>
                    <div class="ds2 previewPhoto"></div>
                    <input type="hidden" name="statusId" value="0">
                    <input type="hidden" name="statusName" value="一般會員">
                    <div class="ds1">
                        <input type="submit" name="submit" id="submit" value="註冊">
                    </div>
                </form>
            </fieldset>
            <div class="ds1" style="text-align: center;">
                <a href="login.jsp">登入</a>
            </div>
            <div class="ds1">
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
            <div class="ds1" style="text-align: center;">
                <input type="button" name="button" id="button" value="一鍵輸入" onclick="oneClick()">
            </div>
            <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
                </script>
            <script>
                let password = true, phone = true;
                $(".password").bind("input propertychange", checkPassword1);
                $(".passwordCheck").bind("input propertychange", checkPassword2);
                $(".phone").bind("input propertychange", checkPhone);
                function checkPassword1() {
                    let passwordVal = $(this).val();
                    let checkVal = $(this).parent("div").next("div").children(".passwordCheck").val();
                    if (checkVal == passwordVal) {
                        $(this).parent("div").next("div").children(".passwordsp").html(``);
                        password = true;
                    } else {
                        $(this).parent("div").next("div").children(".passwordsp").html(`兩次密碼輸入不同，請重新輸入`);
                        password = false;
                    }
                }

                function checkPassword2() {
                    let checkVal = $(this).val();
                    let passwordVal = $(this).parent("div").prev("div").children(".password").val();
                    if (checkVal == passwordVal) {
                        $(this).next(".passwordsp").html(``);
                        password = true;
                    } else {
                        $(this).next(".passwordsp").html(`兩次密碼輸入不同，請重新輸入`);
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
                        $(this).next(".phonesp").html(`格式錯誤`);
                        phone = false;
                    }
                }

                function checkAll() {
                    return password && phone;
                }

                function resetAll() {
                    password = true;
                    phone = true;
                    $(".passwordsp").html(``);
                    $(".phonesp").html(``);
                }

                function oneClick() {
                    $("input").eq(0).val("吳東霖");
                    $("input").eq(1).val("123456");
                    $("input").eq(2).val("123456");
                    $("input").eq(3).val("吳東霖");
                    $("input").eq(4).val("987654@gmail.com");
                    $("input").eq(5).val("0998765432");
                    $("#male").prop("checked", true);
                    resetAll();
                }

                // 預覽圖片，將取得的files一個個取出丟到convertFile()
                function previewFiles(files) {
                    if (files && files.length >= 1) {
                        $.map(files, file => {
                            convertFile(file)
                                .then(data => {
                                    //console.log(data) // 把編碼後的字串輸出到console
                                    showPreviewImage.call(this, data, file.name)
                                })
                                .catch(err => console.log(err))
                        })
                    }
                }

                // 使用FileReader讀取檔案，並且回傳Base64編碼後的source
                function convertFile(file) {
                    return new Promise((resolve, reject) => {
                        // 建立FileReader物件
                        let reader = new FileReader()
                        // 註冊onload事件，取得result則resolve (會是一個Base64字串)
                        reader.onload = () => { resolve(reader.result) }
                        // 註冊onerror事件，若發生error則reject
                        reader.onerror = () => { reject(reader.error) }
                        // 讀取檔案
                        reader.readAsDataURL(file)
                    })
                }

                // 在頁面上新增<img>
                function showPreviewImage(src, fileName) {
                    let image = new Image(250) // 設定寬250px
                    image.name = fileName
                    image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
                    $(this).parent("div").next("div").append(image);
                    $(this).next(".photoBase64").attr("value", `\${src}`);
                }

                // 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
                $(".photo").change(function () {
                    $(this).parent("div").next("div").empty() // 清空當下預覽
                    previewFiles.call(this, this.files) // this即為<input>元素
                });
            </script>
        </body>

        </html>