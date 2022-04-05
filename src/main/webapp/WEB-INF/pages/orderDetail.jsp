<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>訂單管理</title>
</head>
<style>
td,th,tr{
text-align:center;
}
</style>
<body>
<%@ include file="header.jsp" %>
        <div class="main-container">
<div class="pd-ltr-20">
</div></div>
<br>
<div class="container">
	<h2>訂單管理</h2>
	<br>
	<form action="buy" method="post" style="float:left">
		<button type="submit" class="btn btn-outline-primary" style="margin-bottom:15px">新增</button>
	</form>
	
	<form action="searchorder" method="post" class="row g-3" style="float:right">
		<div class="col-auto">
			<input type="text" class="form-control" id="search" name="search" size="30">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-outline-secondary">關鍵字查詢</button>
		</div>
	</form>
	
	<div >
		<table class="table" style="margin-top:20px">
		<thead class="table-light">
		    <tr>
		    	<th>NO.</th>
		    	<th>訂單編號</th>
		    	<th>商品名稱</th>
		    	<th>數量</th>
		    	<th>下單日期</th>
		    	<th>訂單價格</th>
		    	<th>訂購者</th>	    	
		    	<th>訂單狀態</th>	    	
		    	<th>操作</th>
		    </tr>
		</thead>
		<tbody>
			<% int rCount=0 ;%>
			<c:forEach var="va" items="${list}">
				<tr>
					<td>${va.orderNo}</td>
					<td>${va.orderKey}</td>
					<td width="260px">${va.orderName}</td>
					<td>${va.orderQty}</td>
					<td>${va.orderDate.substring(0, 10)}</td>
					<td>${va.orderPrice}</td>
					<td>${va.orderOwner}</td>
					<td>${va.orderStatus}</td>	
					<td>
						<!-- <form style="display:inline" action="RaiseUpdate.jsp" method="post">
							<input type="hidden" name="donext" value="RaiseReview">
							<input type="hidden" name="rID" value="${rl.getRaiseNo()}">
							<input type="hidden" name="rCount" value="<%= rCount %>">
							<button type="submit" class="btn btn-outline-secondary">詳細</button>
						</form>-->
						<form style="display:inline" action="reviseorder" method="post">
							<input type="hidden" name="orderNo" value="${va.orderNo}">
							<button type="submit" class="btn btn-outline-success">修改</button>
						</form>
						
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${va.orderNo}">刪除</button>
						
						<!-- Modal -->
						<form style="display:inline" action="deleteorder" method="post">
							<input type="hidden" name="orderNo" value="${va.orderNo}">
							<div class="modal fade" id="exampleModal${va.orderNo}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel"></h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        請確認是否刪除此筆資料。
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
							        <button type="submit" class="btn btn-primary">確認</button>
							      </div>
							    </div>
							  </div>
							</div>
						</form>
					</td>
				</tr>
				<%rCount++; %>
			</c:forEach>
		   
		</tbody>
		</table>
	</div>
</div>
<!-- 
<script>
	var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
		  keyboard: false
		})
	myModal.show()
</script>
 -->

</body>
</html>