<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>最新活動</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="main-container">
		<div class="pd-ltr-20">
		<h2 style="text-align: center">最新活動</h2>
		<br>
		<a href="newsAdd" style="margin: 5px 0px; width: 100px; float: left">
			<button type="button" class="btn btn-outline-warning">新增</button>
		</a>
		<!--
		<form action="newsSearch" method="post" class="d-flex form1" style="width: 300px; margin: 5px 0px; float: right">
			<input class="form-control me-2" type="search" placeholder="標題,副標題,內容" aria-label="Search" name="keyword">
			<button class="btn btn-outline-success" type="submit" style="width:100px">搜尋</button>
		</form>
		  -->
		<table class="table table-borderless">
			<thead>
				<tr class="table-secondary">
					<th scope="col">編號</th>
					<th scope="col">標題</th>
					<th scope="col">創建時間</th>
					<th scope="col">活動照片</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				int count = 0;
				%>
				<c:forEach var="n1" items="${list}">


					<tr>
						<td>${n1.newsId}</td>
						<td>${n1.newsTitle}</td>
						<td>${n1.newsDate}</td>
						<td><img style="width:50px" src="${n1.getNewsPicBase64()}"></td>
						<td>
							<%--Collapse--%> 
							<span><a class="btn btn-outline-primary"
								data-bs-toggle="collapse" href="#NewsDetail${n1.newsId}"
								role="button" aria-expanded="false"
								aria-controls="collapseExample"> 詳細 </a> </span>

							<form action="newsUpdate" method="get"
								style="display: inline">
							 <input type="hidden" name="id" value="${n1.newsId}">
								<button type="submit" class="btn btn-outline-dark">修改</button>
							</form> <%-- Button trigger modal --%>
							<button type="button" class="btn btn-outline-danger"
								data-bs-toggle="modal"
								data-bs-target="#exampleModal${n1.newsId}">刪除</button>
					</tr>

					<tr>
						<%-- collapse的畫面 --%>
						<td colspan="5">
							<div class="collapse" id="NewsDetail${n1.newsId}">
								<div class="card card-body">
									<%-- <label>編號：${n1.newsId}</label>--%>
									<label>活動性質：${n1.newsType}</label> 
									<label>標題：${n1.newsTitle}</label>
									<label>副標題：${n1.newsSubtitle}</label> 
									<label>更新日期：${n1.newsDate}</label>
									<label>內文：${n1.newsContent}</label>
									<label>活動照片:<br><img style="width:300px" src="${n1.newsPicBase64}"></label><br>
									<label>備註：${n1.newsNote}</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<%-- Delete Modal --%>
						<form style="display: inline" action="newsDelete"
							method="post">
							<input type="hidden" name="donext" value="newsDelete">
							<input type="hidden" name="id" value="${n1.newsId}">
							<td>
								<div class="modal fade" id="exampleModal${n1.newsId}"data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">刪除頁面</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body"><p>請確認是否刪除此筆資料。</p></div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">取消</button>
												<button type="submit" class="btn btn-primary">確定</button>
											</div>
										</div>
									</div>
								</div>

							</td>
						</form>
					</tr>
					<%
					count++;
					%>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
         
         
         
        <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	
	  	<!-- 從這裡(第一段)(DeskApp) -->
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
        <link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="vendors/styles/style.css">

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());

            gtag('config', 'UA-119386393-1');
        </script>
        <!-- 到這裡(第一段結束) -->
		<!-- 第二段開始(DeskApp) -->
 		<script src="vendors/scripts/core.js"></script>
        <script src="vendors/scripts/script.min.js"></script>
        <script src="vendors/scripts/process.js"></script>
        <script src="vendors/scripts/layout-settings.js"></script>
        <script src="src/plugins/apexcharts/apexcharts.min.js"></script>
        <script src="src/plugins/datatables/js/jquery.dataTables.min.js"></script>
        <script src="src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
        <script src="src/plugins/datatables/js/dataTables.responsive.min.js"></script>
        <script src="src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
        <script src="vendors/scripts/dashboard.js"></script>
        <!-- 第二段結束(DeskApp) -->
        
        
        <!-- 共用搜尋欄 -->
        <script>
			$("#select").attr("action","newsIndex");
        </script>
         
         
</body>
</html>