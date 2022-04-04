<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.designerfamily.model.ProductBean"%>
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
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<div class='container'>
		<form action="ProductServlet" method="post" style="margin-top:1em;" >
			<input type="hidden" name="donext" value="ProductSearch"> <input
				class="form-control" type="hidden" name="search_keyword"
				id="search_keyword" style="display: inline" />
			<button type="submit" class="btn btn-light"
				style="margin-bottom: 5px;display: flex;align-items: center;">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
						d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
						d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg>
				&nbsp;&nbsp;商品清單
			</button>
		</form>

		<h3 style="margin-top: 20px">新增商品</h3>
		<form action="ProductServlet" method="POST" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="commTitle" class="form-label">商品標題</label> <input
					type="text" class="form-control" id="commTitle" name="commTitle"
					required="required">
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">商品描述</label>
				<textarea class="form-control" id="commDES" name="commDES"
					aria-describedby="DESInfo" required="required"></textarea>
				<div id="DESInfo" class="form-text">請新增商品描述。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">商品規格</label> <input
					type="text" class="form-control" id="commSPE" name="commSPE"
					aria-describedby="DESInfo">
				<div id="DESInfo" class="form-text">請新增商品規格。</div>
			</div>
			<div class="mb-3">
				<label for="category" class="form-label">商品類別</label> <select
					id="category" name="category" class="form-select"
					aria-label="Default select example" aria-describedby="CategoryInfo">
					<option value="配件飾品">配件飾品</option>
					<option value="文具">文具</option>
					<option value="包包提袋">包包提袋</option>
					<option value="衣著">衣著</option>
					<option value="居家生活">居家生活</option>
					<option value="創意科技">創意科技</option>
					<option value="其他">其他</option>
				</select>
				<div id="CategoryInfo" class="form-text">請選擇商品類別。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">設計師</label> <input
					type="text" class="form-control" id="designer" name="designer"
					aria-describedby="DESInfo" required="required">
				<div id="DESInfo" class="form-text">請新增設計師/品牌名稱。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">價格</label> <input
					type="text" class="form-control" id="commPrice" name="commPrice"
					aria-describedby="DESInfo" required="required">
				<div id="DESInfo" class="form-text">請輸入商品價格。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">數量</label> <input
					type="text" class="form-control" id="commQuantity"
					name="commQuantity" aria-describedby="DESInfo" required="required">
				<div id="DESInfo" class="form-text">請輸入商品數量。</div>
			</div>
			
			<div class="mb-3">
				<label for="commDES" class="form-label">圖片</label> <input
					type="file" class="form-control" id="commImg"
					name="photo" aria-describedby="DESInfo" required="required">
				<div id="DESInfo" class="form-text">請上傳圖片。</div>
			</div>
			
			
			<input type="hidden" name="donext" value="ProductAdd">
			<button type="submit" class="btn btn-primary" name="upload">Submit</button>
		</form>




	</div>
</body>
</html>