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
vertical-align: middle; 
}
</style>
<body>
<div class="container">
	<h2>訂單明細</h2>
	<br>
		<form action="showorder" method="post" style="float: left">
			<button type="submit" class="btn btn-outline-primary"
				style="margin-bottom: 15px">訂單管理</button>
		</form>
		<div >
		<table class="table" style="margin-top:20px">
		<thead class="table-light">
		    <tr>
		    	<th>商品名稱</th>
		    	<th>商品圖片</th>
		    	<th>數量</th>
		    	<th>訂單價格</th>
		    	<th>下單日期</th>
		    	<th>訂購者</th>	    	
		    	<th>訂單狀態</th>	    	
		    </tr>
		</thead>
		<tbody>
			<c:forEach var="va" items="${detail}">
				<c:forEach var="vb" items="${va.item}">
				<tr>
					<td>${vb.product.commTitle}</td>
					<td width="100px" align="right"><img
							src="${vb.product.commImg}" width="100%"></td>
					<td>${vb.qty}</td>
					<td>${vb.totalprice}</td>
					<td>${va.orderDate.substring(0, 19)}</td>
					<td>${va.orderOwner}</td>
					<td>${va.orderStatus}</td>
				</tr>
					</c:forEach>
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