<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>Product</title>
<style>
.description {
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<h3 style="display: inline">商品清單&nbsp;</h3>
		<form action="ProductServlet" method="post" style="display: inline">
			<input type="hidden" name="donext" value="ProductSearch"> <input
				class="form-control" type="hidden" name="search_keyword"
				id="search_keyword" style="display: inline" />
			<button type="submit" class="btn btn-light"
				style="border-color: #A6A6A6; margin-bottom: 10px">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
						d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
						d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg>
			</button>
		</form>

		<div id="searchtb_productinfo" style="padding: 2px 5px;">
			<div class="col-auto" style="padding: 3px">
				<form action="ProductServlet" method="post" style="display: inline">
					商品編號: <input type="hidden" name="donext" value="ProductSearchNo">
					<input class="form-control" type="text" name="search_no"
						id="search_no" style="width: 110px; display: inline"
						required="required" />

					<button type="submit" class="btn btn-outline-secondary">查詢</button>

				</form>
				<form action="ProductServlet" method="post" style="display: inline">
					&nbsp;&nbsp;關鍵字: <input type="hidden" name="donext"
						value="ProductSearch"> <input class="form-control"
						type="text" name="search_keyword" id="search_keyword"
						style="width: 110px; display: inline" required="required" />

					<button type="submit" class="btn btn-outline-secondary">查詢</button>

				</form>
				<a href="ProductAdd.jsp" style="float: right"><button
						type="button" class="btn btn-outline-primary">新增</button></a>
			</div>
		</div>

		<table class="table"
			style="margin-top: 20px; vertical-align: middle; text-align: center;">
			<thead class="table-light">
				<tr>
					<th>編號</th>
					<th>標題</th>
					<th>描述</th>
					<th>規格</th>
					<th>類別</th>
					<th>設計師</th>
					<th>價格</th>
					<th>數量</th>
					<th>圖片</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				int count = 0;
				%>

				<c:forEach var="pl" items="${productList}">
					<tr>
						<td>${pl.getCommNo()}</td>
						<td style="width: 180px">${pl.getCommTitle()}</td>
						<td class="description">${pl.getCommDES()}</td>
						<td>${pl.getCommSPE()}</td>
						<td>${pl.getCategory()}</td>
						<td>${pl.getDesigner()}</td>
						<td>${pl.getCommPrice()}</td>
						<td>${pl.getCommQuantity()}</td>
						<td width="100px" align="right"><img
							src="img/${pl.getCommImg()}" width="100%"></td>

						<td style="width: 80px">
							<form style="display: inline" action="ProductUpdate.jsp"
								method="post">
								<input type="hidden" name="donext" value="ProductUpdate">
								<input type="hidden" name="id" value="<%=count%>">
								<button type="submit" class="btn btn-outline-success"
									style="margin-bottom: 10px">修改</button>
							</form> <!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-danger"
								data-bs-toggle="modal"
								data-bs-target="#exampleModal${pl.getCommNo()}">刪除</button> <!-- Modal -->
							<form style="display: inline" action="ProductServlet"
								method="post">
								<input type="hidden" name="donext" value="ProductDelete">
								<input type="hidden" name="delete" value="${pl.getCommNo()}">
								<div class="modal fade" id="exampleModal${pl.getCommNo()}"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel"></h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">請確認是否刪除此筆資料。</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">取消</button>
												<button type="submit" class="btn btn-primary">確認</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</td>
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