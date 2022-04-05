<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List,tw.designerfamily.model.CartItem"%>
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
<title>結帳</title>
</head>
<style>
td,th,tr{
text-align:center;
}
</style>
<body>
<%@ include file="header1.jsp" %>
        <div class="main-container">
<div class="pd-ltr-20">
</div></div>
<br>
<div class="container">
	<h2 align="center">結帳</h2>
	<div>
	<form action="generatedorder" method="post">
		<table class="table" style="margin-top:20px">
		<thead class="table-light">
		    <tr>
		    	<th>圖片</th>
		    	<th>名稱</th>
		    	<th>數量</th>
		    	<th>價格</th>
		    </tr>
		</thead>
		<% int i=0, sum=0, count=0; 
			@SuppressWarnings("unchecked")
			List<CartItem> list = (List<CartItem>)session.getAttribute("carts");
			%>
				<tbody>
					<c:forEach var="va" items="${check}">
						<tr>
							<td width="100px" align="right"><img src="${va.product.commImg}"
								width="100%">
								</td>
							<td width="400px">${va.product.commTitle}</td>
							<td>${va.qty}</td>
							<td>${va.totalprice}</td>
						</tr>
						<%
						sum += list.get(i).getTotalprice();
						i++;
						count++;
						%>
				<input type="hidden" name="name" value="${va.product.commTitle}">
				<input type="hidden" name="qty" value="${va.qty}">
					</c:forEach>
				</tbody>
			</table>
			<div align="right">
				商品總金額:<%=sum%>
				<input type="hidden" name="price" value="<%=sum%>">
				<button type="submit" style="width:88px;height:33px;">結帳</button>
			</div>
			</form>
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