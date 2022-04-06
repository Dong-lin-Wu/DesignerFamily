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
<title>購物車</title>
</head>
<style>
td,th,tr{
text-align:center;
vertical-align: middle; 
}
</style>
<body>
<br/>
		<div class="container">
				<form action="buy" method="post">
					<input class="form-control" type="hidden" name="search_keyword"
						id="search_keyword" style="display: inline" />
					<button type="submit" class="btn btn-light"
						style="margin-bottom: 5px; display: flex; align-items: center;">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
								d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
								d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg>
						&nbsp;&nbsp;商品
					</button>
				</form>
				<h2 align="center">購物車</h2>
				<div>
					<table class="table" style="margin-top: 20px">
						<thead class="table-light">
							<tr>
								<th>圖片</th>
								<th>名稱</th>
								<th>數量</th>
								<th>價格</th>
								<th>操作</th>
							</tr>
						</thead>
						<% int i=0, sum=0; 
			@SuppressWarnings("unchecked")
			List<CartItem> list = (List<CartItem>)session.getAttribute("carts");%>
						<tbody>
							<c:forEach var="va" items="${carts}">
								<tr>
									<td width="100px" align="right"><img
										src="${va.product.commImg}" width="100%"></td>
									<td width="400px">${va.product.commTitle}</td>
									<td>${va.qty}</td>
									<td>${va.totalprice}</td>
									<td>
										<form style="display: inline" action="removeCart"
											method="post">
											<input type="hidden" name="commNo"
												value="${va.product.commNo}">
											<button type="submit" class="btn btn-outline-danger">移除</button>
										</form>
									</td>
								</tr>
								<%
						sum += list.get(i).getTotalprice();
						i++;
						%>
							</c:forEach>
						</tbody>
					</table>
					<form action="checkout" method="post">
						<div align="right">
							商品總金額:<%=sum%>
							<input type="hidden" name="qty" value="<%=sum%>" id="qty"
								size="1">
							<button type="submit" style="width: 88px; height: 33px;"
								id="send" onclick="return check()">買單</button>
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
 <script>
function check(){
	let a = document.getElementById("qty").value;
	console.log(a);
	if(a<=0){
		alert("請購買商品再結帳!");
		return false;
	}else{
		return true;
	}
}
		

 </script>
</body>
</html>