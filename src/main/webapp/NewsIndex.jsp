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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container" style="margin-top:650px">
		<h2 style="text-align: center">最新活動</h2>
		<br>
		<a href="NewsAdd.jsp" style="margin: 5px 0px; width: 100px; float: left">
			<button type="button" class="btn btn-outline-primary">新增</button>
		</a>

		<form action="NewsSearchServlet" method="post" class="d-flex form1" style="width: 300px; margin: 5px 0px; float: right">
			<input class="form-control me-2" type="search" placeholder="標題,副標題,內容" aria-label="Search" name="keyword">
			<button class="btn btn-outline-success" type="submit" style="width:100px">搜尋</button>
		</form>

		<table class="table table-borderless">
			<thead>
				<tr class="table-secondary">
					<th scope="col">編號</th>
					<th scope="col">標題</th>
					<th scope="col">創建時間</th>
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
						<td>
							<%--Collapse--%> <span><a class="btn btn-primary"
								data-bs-toggle="collapse" href="#NewsDetail${n1.newsId}"
								role="button" aria-expanded="false"
								aria-controls="collapseExample"> 詳細 </a> </span>

							<form action="NewsUpdateServlet" method="get"
								style="display: inline">
								<input type="hidden" name="donext" value="NewsUpdate"> <input
									type="hidden" name="id" value="${n1.newsId}">
								<button type="submit" class="btn btn-warning">修改</button>
							</form> <%-- Button trigger modal --%>
							<button type="button" class="btn btn-danger"
								data-bs-toggle="modal"
								data-bs-target="#exampleModal${n1.newsId}">刪除</button>
					</tr>

					<tr>
						<%-- collapse的畫面 --%>
						<td colspan="4">
							<div class="collapse" id="NewsDetail${n1.newsId}">
								<div class="card card-body">
									<%-- <label>編號：${n1.newsId}</label>--%>
									<label>活動性質：${n1.newsType}</label> <label>標題：${n1.newsTitle}</label>
									<label>副標題：${n1.newsSubtitle}</label> <label>更新日期：${n1.newsDate}</label>
									<label>內文：${n1.newsContent}</label>
									<%-- <img src="/images/${n1.newsImagePath}" style="width:200px;"> 待確認圖片存放位置 --%>
									<label>備註：${n1.newsNote}</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<%-- Delete Modal --%>
						<form style="display: inline" action="NewsDeleteServlet"
							method="post">
							<input type="hidden" name="donext" value="NewsDeleteServlet">
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

</body>
</html>