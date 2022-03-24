<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8">
                <title>member_admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
                    crossorigin="anonymous">
                    </script>
                <style>
                    .ds1 {
                        width: 1000px;
                        margin: 20px auto;
                    }

                    .ds2 {
                        width: 500px;
                        margin-left: 20px;
                        margin-bottom: 20px;
                    }

                    .ip1 {
                        width: 226px;
                        padding: 5px;
                        font-size: 15px;
                    }

                    .passwordsp,
                    .phonesp {
                        color: red;
                    }

                    .ds3 {
                        width: 250px;
                        margin: 20px 20px;
                    }

                    #submit {
                        width: 226px;
                        padding: 5px;
                        font-size: 15px;
                    }

                    .ds4 {
                        width: 226px;
                        margin-left: 20px;
                        text-align: center;
                    }
                </style>
            </head>

            <body>
                <%@ include file="header.jsp" %>
                <div class="ds1">
                    <div class="container" style="margin-top: 650px">
                        <h2>會員清單</h2>
                        <p>
                            <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExampleAdd"
                                role="button" aria-expanded="false" aria-controls="collapseExample" onclick="clearEm()">
                                新增 </a> <em style="color:red">${sessionScope.error}</em>
                            <%session.removeAttribute("error"); %>
                        </p>
                        <div class="collapse" id="collapseExampleAdd">
                            <div class="card card-body">
                                <form action="member" method="post" onsubmit="return checkAll()">
                                    <input type="hidden" name="todo" value="insert">
                                    <div class="ds2">
                                        <input class="ip1" type="text" name="account" placeholder="使用者名稱" required>
                                    </div>
                                    <div class="ds2">
                                        <input class="ip1 password" type="password" name="password" placeholder="密碼"
                                            required>
                                    </div>
                                    <div class="ds2">
                                        <input class="ip1 passwordCheck" type="password" name="passwordCheck"
                                            placeholder="密碼確認" required><span class="passwordsp"></span>
                                    </div>
                                    <div class="ds2">
                                        <input class="ip1" type="text" name="name" placeholder="姓名 (非必填)">
                                    </div>
                                    <div class="ds2">
                                        <input class="ip1" type="email" name="email" placeholder="Email" required>
                                    </div>
                                    <div class="ds2">
                                        <input class="ip1 phone" type="tel" name="phone" placeholder="手機" required><span
                                            class="phonesp"></span>
                                    </div>
                                    <div class="ds3">
                                        <label>性別：</label>
                                        <input type="radio" name="gender" id="male" value="male">男
                                        <input type="radio" name="gender" id="female" value="female">女
                                    </div>
                                    <div class="ds2">
                                        <label>生日：</label><br>
                                        <input class="ip1" type="date" name="birthday">
                                    </div>
                                    <div class="ds3">
                                        <label>圖片：</label>
                                        <input class="photo" type="file" name="photo" style="width: 250px">
                                        <input class="photoBase64" type="hidden" name="photoBase64" value="">
                                    </div>
                                    <div class="ds3 previewPhoto"></div>
                                    <div class="ds3">
                                        <label>權限：</label>
                                        <select name="statusId">
                                            <option value="8,管理員">管理員</option>
                                            <option value="0,一般會員">一般會員</option>
                                        </select>
                                    </div>
                                    <div class="ds2">
                                        <input type="submit" name="submit" id="submit" value="加入">
                                    </div>
                                </form>
                                <div class="ds1" style="text-align: center;">
                                    <input type="button" name="button" id="button" value="一鍵輸入" onclick="oneClick()">
                                </div>
                            </div>
                        </div>
                        <br>
                        <div style="width: 300px;">
                            <form class="d-flex" action="member" method="post">
                                <input type="hidden" name="todo" value="select">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                                    name="keyword">
                                <button class="btn btn-outline-success" type="submit">搜尋</button>
                            </form>
                        </div>
                        <br>
                        <table class="table table-borderless">
                            <thead class="table-dark">
                                <tr>
                                    <th>編號</th>
                                    <th>使用者名稱</th>
                                    <th>Email</th>
                                    <th>手機</th>
                                    <th>權限</th>
                                    <th>功能</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="member" items="${members}">
                                    <tr>
                                        <td>${member.id}</td>
                                        <td>${member.account}</td>
                                        <td>${member.email}</td>
                                        <td>${member.phone}</td>
                                        <td>${member.status.statusName}</td>
                                        <td>
                                            <span> <a class="btn btn-primary btn-sm" data-bs-toggle="collapse"
                                                    href="#collapseExampleDetail${member.id}" role="button"
                                                    aria-expanded="false" aria-controls="collapseExample"> 詳細 </a>
                                            </span>
                                            <c:if
                                                test="${member.status.statusId < sessionScope.login.status.statusId}">
                                                <span> <a class="btn btn-secondary btn-sm" data-bs-toggle="collapse"
                                                        href="#collapseExampleUpdate${member.id}" role="button"
                                                        aria-expanded="false" aria-controls="collapseExample"> 修改 </a>
                                                </span>
                                                <button type="button" class="btn btn-danger btn-sm"
                                                    data-bs-toggle="modal" data-bs-target="#staticBackdrop${member.id}">
                                                    刪除
                                                </button>
                                                <form style="display: inline;" action="member" method="post">
                                                    <input type="hidden" name="todo" value="delete">
                                                    <input type="hidden" name="id" value="${member.id}">
                                                    <div class="modal fade" id="staticBackdrop${member.id}"
                                                        data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                                        aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="staticBackdropLabel">刪除
                                                                    </h5>
                                                                    <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <p>是否刪除此筆資料？</p>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="submit"
                                                                        class="btn btn-primary">確定</button>
                                                                    <button type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">取消</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div class="collapse" id="collapseExampleDetail${member.id}">
                                                <div class="card card-body">
                                                    <label>編號：${member.id}</label>
                                                    <label>使用者名稱：${member.account}</label>
                                                    <label>密碼：${member.password}</label>
                                                    <label>姓名：${member.name}</label>
                                                    <label>Email：${member.email}</label>
                                                    <label>手機：${member.phone}</label>
                                                    <label>性別：
                                                        <c:choose>
                                                            <c:when test="${fn:contains(member.gender,'female')}">
                                                                女
                                                            </c:when>
                                                            <c:otherwise>
                                                                男
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </label>
                                                    <label>生日：${member.birthday}</label>
                                                    <label>圖片：<img src="${member.photo}" style="width: 250px"></label>
                                                    <label>權限：${member.status.statusName}</label>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div class="collapse" id="collapseExampleUpdate${member.id}">
                                                <div class="card card-body">
                                                    <form action="member" method="post" onsubmit="return checkAll()">
                                                        <input type="hidden" name="todo" value="update">
                                                        <input type="hidden" name="id" value="${member.id}">
                                                        <div class="ds2">
                                                            <input class="ip1" type="text" name="account"
                                                                value="${member.account}" placeholder="使用者名稱" required>
                                                        </div>
                                                        <div class="ds2">
                                                            <input class="ip1 password" type="password" name="password"
                                                                value="${member.password}" placeholder="密碼" required>
                                                        </div>
                                                        <div class="ds2">
                                                            <input class="ip1 passwordCheck" type="password"
                                                                name="passwordCheck" value="${member.password}"
                                                                placeholder="密碼確認" required><span
                                                                class="passwordsp"></span>
                                                        </div>
                                                        <div class="ds2">
                                                            <input class="ip1" type="text" name="name"
                                                                value="${member.name}" placeholder="姓名 (非必填)">
                                                        </div>
                                                        <div class="ds2">
                                                            <input class="ip1" type="email" name="email"
                                                                value="${member.email}" placeholder="Email" required>
                                                        </div>
                                                        <div class="ds2">
                                                            <input class="ip1 phone" type="tel" name="phone"
                                                                value="${member.phone}" placeholder="手機" required><span
                                                                class="phonesp"></span>
                                                        </div>
                                                        <div class="ds3">
                                                            <label>性別：</label>
                                                            <c:choose>
                                                                <c:when test="${fn:contains(member.gender,'female')}">
                                                                    <input type="radio" name="gender" id="male"
                                                                        value="male">男
                                                                    <input type="radio" name="gender" id="female"
                                                                        value="female" checked>女
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="radio" name="gender" id="male"
                                                                        value="male" checked>男
                                                                    <input type="radio" name="gender" id="female"
                                                                        value="female">女
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="ds2">
                                                            <label>生日：</label><br>
                                                            <input class="ip1" type="date" name="birthday"
                                                                value="${member.birthday}">
                                                        </div>
                                                        <div class="ds3">
                                                            <label>圖片：</label>
                                                            <input class="photo" type="file" name="photo"
                                                                style="width: 250px">
                                                            <input class="photoBase64" type="hidden" name="photoBase64"
                                                                value="">
                                                        </div>
                                                        <div class="ds3 previewPhoto"><img src="${member.photo}"
                                                                style="width: 250px">
                                                        </div>
                                                        <div class="ds3">
                                                            <label>權限：</label>
                                                            <select name="statusId">
                                                                <c:choose>
                                                                    <c:when
                                                                        test="${fn:contains(member.status.statusId,'8')}">
                                                                        <option value="8,管理員" selected>管理員</option>
                                                                        <option value="0,一般會員">一般會員</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="8,管理員">管理員</option>
                                                                        <option value="0,一般會員" selected>一般會員</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </select>
                                                        </div>

                                                        <div class="ds4">
                                                            <button type="submit"
                                                                class="btn btn-primary btn-sm">儲存</button>
                                                            <button type="reset" class="btn btn-primary btn-sm"
                                                                onclick="resetAll()">復原</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.6.0.js"
                    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
                    </script>
                <script>
                    function clearEm() {
                        $("em").html(``);
                    }

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
                        $("input").eq(9).val("謝昀軒");
                        $("input").eq(10).val("123456");
                        $("input").eq(11).val("123456");
                        $("input").eq(12).val("謝昀軒");
                        $("input").eq(13).val("987654@gmail.com");
                        $("input").eq(14).val("0998765432");
                        $("#female").prop("checked", true);
                        resetAll();
                    }

                    // 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
                    $(".photo").change(function () {
                        $(this).parent("div").next("div").empty() // 清空當下預覽
                        previewFiles.call(this, this.files) // this即為<input>元素
                    });

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
                </script>
            </body>

            </html>