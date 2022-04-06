<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
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
<br>
<div class="container">
	<h2 align="center">商品</h2>
	<br/>
	<form action="mycart" method="post" style="float:left">
		<button type="submit" class="btn btn-outline-primary" style="margin-bottom:15px">購物車</button>
	</form>
	<div >
		<table class="table" style="margin-top:20px">
		<thead class="table-light">
		    <tr>
		    	<th>名稱</th>
		    	<th>類別</th>
		    	<th>價格</th>
		    	<th>圖片</th>
		    	<th>數量</th>
		    	<th>操作</th>
		    </tr>
		</thead>
		<tbody>
			<%int count=0;%>
			<c:forEach var="va" items="${goods}">

						<tr>
							<td width="400px">
							${va.commTitle}</td>
							<td>${va.category}</td>
							<td>${va.commPrice}</td>
							<td width="130px"><img
							src="${va.commImg}" width="100%"></td>
						<form style="display: inline" action="cartItem" method="post">
							<td width="100px">
							<select class="form-select"
								aria-label="Default select example" name="total" >
									<option selected>1</option>
									<option >2</option>
									<option >3</option>
									<option >4</option>
									<option >5</option>
									<option >6</option>
									<option >7</option>
									<option >8</option>
									<option >9</option>
									<option >10</option>
							</select></td>
							<td>
									<input type="hidden" name="commNo" value="${va.commNo}">
									<button type="submit" class="btn btn-outline-success">加入購物車</button>
							</td>
								</form>
						</tr>
						<%count++ ;%>
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
 <script>

 </script>
</body>
</html>