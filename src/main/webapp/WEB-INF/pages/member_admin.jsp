<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <link rel="stylesheet" type="text/css" href="src/plugins/sweetalert2/sweetalert2.css">
            <link rel="stylesheet" type="text/css" href="src/plugins/jquery-asColorPicker/dist/css/asColorPicker.css">
            <link rel="stylesheet" type="text/css" href="vendors/styles/style.css">
            <link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/dataTables.bootstrap4.min.css">
            <link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/responsive.bootstrap4.min.css">

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
                .phonesp {
                    color: red;
                }
            </style>
        </head>

        <body>
            <%@ include file="header.jsp" %>
                <div class="main-container">
                    <div class="pd-ltr-20 xs-pd-20-10">
                        <div class="min-height-200px">
                            <div class="page-header">
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="title">
                                            <h4>成員</h4>
                                        </div>
                                        <nav aria-label="breadcrumb" role="navigation">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item">
                                                    <a href="admin">Home</a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">成員</li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-12 text-right">
                                        <a class="btn btn-primary" href="members.insert" role="button">新增</a>
                                    </div>
                                </div>
                            </div>

                            <div class="pd-20 card-box mb-30">
                                <div class="clearfix mb-20">
                                    <div class="pull-left">
                                        <h4 class="text-blue h4">成員清單</h4>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">編號</th>
                                                <th scope="col">使用者名稱</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">手機</th>
                                                <th scope="col">權限</th>
                                                <th scope="col">功能</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="member" items="${members}">
                                                <tr>
                                                    <th scope="row">${member.id}</th>
                                                    <td>${member.account}</td>
                                                    <td>${member.email}</td>
                                                    <td>${member.phone}</td>
                                                    <td>${member.status.statusName}</td>
                                                    <td>
                                                        <span><a class="btn btn-primary btn-sm"
                                                                data-bs-toggle="collapse" href="#detail${member.id}"
                                                                role="button" aria-expanded="false"
                                                                aria-controls="multiCollapseExample1">詳細</a></span>
                                                        <c:if
                                                            test="${member.status.statusId < sessionScope.login.status.statusId}">
                                                            <span><a class="btn btn-secondary btn-sm"
                                                                    data-bs-toggle="collapse" href="#update${member.id}"
                                                                    role="button" aria-expanded="false"
                                                                    aria-controls="multiCollapseExample2">修改</a></span>
                                                            <button type="button" class="btn btn-danger btn-sm"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#delete${member.id}">刪除</button>
                                                            <form style="display: inline;" action="members.delete"
                                                                method="post">
                                                                <input type="hidden" name="id" value="${member.id}">
                                                                <div class="modal fade" id="delete${member.id}"
                                                                    data-bs-backdrop="static" data-bs-keyboard="false"
                                                                    tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                                    aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <div class="swal2-icon swal2-warning swal2-animate-warning-icon"
                                                                                    style="display: flex;">
                                                                                    <span
                                                                                        class="swal2-icon-text">!</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-body"
                                                                                style="text-align: center;">
                                                                                <h2 class="swal2-title"
                                                                                    id="swal2-title">確定刪除?
                                                                                </h2>
                                                                                <div id="swal2-content"
                                                                                    style="display: block;">資料刪除後將無法復原!
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="submit"
                                                                                    class="btn btn-success">確定</button>
                                                                                <button type="button"
                                                                                    class="btn btn-danger"
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
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="collapse multi-collapse"
                                                                    id="detail${member.id}">
                                                                    <div class="card card-body">
                                                                        <h5>詳細資料</h5><br>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>編號 :</label>
                                                                                <p style="margin-top: 14px;">
                                                                                    ${member.id}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>使用者名稱 :</label>
                                                                                <p style="margin-top: 14px;">
                                                                                    ${member.account}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>Email :</label>
                                                                                <p style="margin-top: 14px;">
                                                                                    ${member.email}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>密碼 :</label>
                                                                                <p style="margin-top: 14px;">
                                                                                    ${member.password}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>手機 :</label>
                                                                                <p style="margin-top: 14px;">
                                                                                    ${member.phone}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 55px;">
                                                                            <div class="form-group">
                                                                                <label>權限 :</label>
                                                                                <p style="margin-top: 14px;">
                                                                                    ${member.status.statusName}</p>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>姓名 :</label>
                                                                                <c:choose>
                                                                                    <c:when
                                                                                        test="${member.name != null}">
                                                                                        <p style="margin-top: 14px;">
                                                                                            ${member.name}</p>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <p style="margin-top: 55px;">
                                                                                        </p>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>性別 :</label>
                                                                                <c:choose>
                                                                                    <c:when
                                                                                        test="${member.gender == 'male'}">
                                                                                        <p style="margin-top: 12px;">
                                                                                            男</p>
                                                                                    </c:when>
                                                                                    <c:when
                                                                                        test="${member.gender == 'female'}">
                                                                                        <p style="margin-top: 12px;">
                                                                                            女</p>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <p style="margin-top: 54px;">
                                                                                        </p>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>生日 :</label>
                                                                                <c:choose>
                                                                                    <c:when
                                                                                        test="${member.birthday != null}">
                                                                                        <p style="margin-top: 14px;">
                                                                                            ${member.birthday}</p>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <p style="margin-top: 55px;">
                                                                                        </p>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6"
                                                                            style="margin-bottom: 10px;">
                                                                            <div class="form-group">
                                                                                <label>圖片 :</label>
                                                                                <c:choose>
                                                                                    <c:when
                                                                                        test="${member.photo != null}">
                                                                                        <p style="margin-top: 12px;">
                                                                                            <img src="${member.photo}"
                                                                                                style="width: 250px">
                                                                                        </p>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <p style="margin-top: 55px;">
                                                                                        </p>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="collapse multi-collapse"
                                                                    id="update${member.id}">
                                                                    <div class="card card-body">
                                                                        <form action="members.update" method="post"
                                                                            onsubmit="return checkAll()">
                                                                            <h5>基本資料</h5><br>
                                                                            <input type="hidden" name="id"
                                                                                value="${member.id}">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>使用者名稱* :</label>
                                                                                    <input type="text"
                                                                                        class="form-control"
                                                                                        name="account"
                                                                                        value="${member.account}"
                                                                                        required>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>Email* :</label>
                                                                                    <input type="email"
                                                                                        class="form-control"
                                                                                        name="email"
                                                                                        value="${member.email}"
                                                                                        required>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>密碼* :</label>
                                                                                    <input type="password"
                                                                                        class="password form-control"
                                                                                        name="password"
                                                                                        value="${member.password}"
                                                                                        required>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>密碼確認* :</label>
                                                                                    <input type="password"
                                                                                        class="passwordCheck form-control"
                                                                                        name="passwordCheck"
                                                                                        value="${member.password}"
                                                                                        required>
                                                                                    <span class="passwordsp"></span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>手機* :</label>
                                                                                    <input type="tel"
                                                                                        class="phone form-control"
                                                                                        name="phone"
                                                                                        value="${member.phone}"
                                                                                        required>
                                                                                    <span class="phonesp"></span>
                                                                                </div>
                                                                            </div>
                                                                            <br>
                                                                            <!-- Step 2 -->
                                                                            <h5>額外資料(非必填)</h5><br>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>姓名 :</label>
                                                                                    <input type="text"
                                                                                        class="form-control" name="name"
                                                                                        value="${member.name}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>性別 :</label><br>
                                                                                    <div class="btn-group btn-group-toggle"
                                                                                        data-toggle="buttons"
                                                                                        style="margin-top: 2px;">
                                                                                        <c:choose>
                                                                                            <c:when
                                                                                                test="${member.gender == 'male'}">
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary active">
                                                                                                    <input type="radio"
                                                                                                        name="gender"
                                                                                                        id="male"
                                                                                                        autocomplete="off"
                                                                                                        value="male"
                                                                                                        checked>
                                                                                                    男
                                                                                                </label>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="gender"
                                                                                                        id="female"
                                                                                                        autocomplete="off"
                                                                                                        value="female">
                                                                                                    女
                                                                                                </label>
                                                                                            </c:when>
                                                                                            <c:when
                                                                                                test="${member.gender == 'female'}">
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="gender"
                                                                                                        id="male"
                                                                                                        autocomplete="off"
                                                                                                        value="male">
                                                                                                    男
                                                                                                </label>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary active">
                                                                                                    <input type="radio"
                                                                                                        name="gender"
                                                                                                        id="female"
                                                                                                        autocomplete="off"
                                                                                                        value="female"
                                                                                                        checked>
                                                                                                    女
                                                                                                </label>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="gender"
                                                                                                        id="male"
                                                                                                        autocomplete="off"
                                                                                                        value="male">
                                                                                                    男
                                                                                                </label>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="gender"
                                                                                                        id="female"
                                                                                                        autocomplete="off"
                                                                                                        value="female">
                                                                                                    女
                                                                                                </label>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>生日 :</label>
                                                                                    <input type="text"
                                                                                        class="form-control date-picker"
                                                                                        placeholder="點此選擇日期"
                                                                                        name="birthday"
                                                                                        value="${member.birthday}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>圖片 :</label><br>
                                                                                    <div style="margin-top: 2px;">
                                                                                        <input
                                                                                            class="photo form-control-file form-control height-auto"
                                                                                            type="file" name="photo"
                                                                                            style="width: 250px">
                                                                                        <input class="photoBase64"
                                                                                            type="hidden"
                                                                                            name="photoBase64" value="">
                                                                                    </div>
                                                                                    <div class="previewPhoto"
                                                                                        style="margin-top: 10px;">
                                                                                        <img src="${member.photo}"
                                                                                            style="width: 250px">
                                                                                    </div>
                                                                                    <img class="hideImg"
                                                                                        src="${member.photo}"
                                                                                        style="display: none;">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>權限 :</label><br>
                                                                                    <div class="btn-group btn-group-toggle"
                                                                                        data-toggle="buttons"
                                                                                        style="margin-top: 2px;">
                                                                                        <c:choose>
                                                                                            <c:when
                                                                                                test="${member.status.statusId == '8'}">
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary active">
                                                                                                    <input type="radio"
                                                                                                        name="statusId"
                                                                                                        autocomplete="off"
                                                                                                        value="8,管理員"
                                                                                                        checked>
                                                                                                    管理員
                                                                                                </label>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="statusId"
                                                                                                        autocomplete="off"
                                                                                                        value="0,一般會員">
                                                                                                    一般會員
                                                                                                </label>
                                                                                            </c:when>
                                                                                            <c:when
                                                                                                test="${member.status.statusId == '0'}">
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="statusId"
                                                                                                        autocomplete="off"
                                                                                                        value="8,管理員">
                                                                                                    管理員
                                                                                                </label>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary active">
                                                                                                    <input type="radio"
                                                                                                        name="statusId"
                                                                                                        autocomplete="off"
                                                                                                        value="0,一般會員"
                                                                                                        checked>
                                                                                                    一般會員
                                                                                                </label>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="statusId"
                                                                                                        autocomplete="off"
                                                                                                        value="8,管理員">
                                                                                                    管理員
                                                                                                </label>
                                                                                                <label
                                                                                                    class="btn btn-outline-secondary">
                                                                                                    <input type="radio"
                                                                                                        name="statusId"
                                                                                                        autocomplete="off"
                                                                                                        value="0,一般會員">
                                                                                                    一般會員
                                                                                                </label>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="text-right">
                                                                                <button class="btn btn-primary"
                                                                                    type="submit">儲存</button>
                                                                                <button class="btn btn-secondary"
                                                                                    type="reset"
                                                                                    onclick="resetAll()">復原</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Responsive tables End -->
                            </div>
                        </div>
                    </div>
                </div>

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
                <script src="src/plugins/apexcharts/apexcharts.min.js"></script>
                <script src="src/plugins/datatables/js/jquery.dataTables.min.js"></script>
                <script src="src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
                <script src="src/plugins/datatables/js/dataTables.responsive.min.js"></script>
                <script src="src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
                <script src="vendors/scripts/dashboard.js"></script>
                <!-- add sweet alert js & css in footer -->
                <script src="src/plugins/sweetalert2/sweetalert2.all.js"></script>
                <script src="src/plugins/sweetalert2/sweet-alert.init.js"></script>

                <script>
                    $("#select").attr("action", "search.members");

                    let password = true, phone = true;
                    $(".password").bind("input propertychange", checkPassword1);
                    $(".passwordCheck").bind("input propertychange", checkPassword2);
                    $(".phone").bind("input propertychange", checkPhone);
                    function checkPassword1() {
                        let passwordVal = $(this).val();
                        let checkVal = $(this).parent("div").parent("div").next("div").children("div").children(".passwordCheck").val();
                        if (checkVal == passwordVal) {
                            $(this).parent("div").parent("div").next("div").children("div").children(".passwordsp").html(``);
                            password = true;
                        } else {
                            $(this).parent("div").parent("div").next("div").children("div").children(".passwordsp").html(`兩次密碼輸入不同，請重新輸入`);
                            password = false;
                        }
                    }

                    function checkPassword2() {
                        let checkVal = $(this).val();
                        let passwordVal = $(this).parent("div").parent("div").prev("div").children(".password").val();
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
                        for (let i = 0; i < $(".previewPhoto").length; i++)
                            $(".previewPhoto").eq(i).children("img").attr("src", $(".previewPhoto").eq(i).next(".hideImg").attr("src"));
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