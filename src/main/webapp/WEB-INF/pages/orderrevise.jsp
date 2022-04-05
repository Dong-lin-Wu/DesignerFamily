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
<title>訂單修改</title>
</head>
<style>
td,th,tr{
text-align:center;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="main-container">
		<div class="pd-ltr-20"></div>
	</div>
	<br>
	<form style="display: inline" action="checkO" method="post">
		<div class="container">
			<h2>訂單修改</h2>
			<br />
			<div>
				<table class="table" style="margin-top: 20px">
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
						<tr>
							<td><input type="hidden" name="orderNo"
								value="${order.orderNo}" size="1">${order.orderNo}</td>
							<td>${order.orderKey}</td>
							<td width="250px">${order.orderName}</td>
							<td><input type="text" name="orderQty" id="qty"
								value="${order.orderQty}" size="1"></td>
							<td>${order.orderDate.substring(0, 10)}</td>
							<td><input type="text" name="orderPrice" id="pri"
								value="${order.orderPrice}" size="1" readonly></td>
							<td>${order.orderOwner}</td>
							<td><select name="orderStatus">
									<option>${option.get(0)}</option>
									<option>${option.get(1)}</option>
									<option>${option.get(2)}</option>
							</select></td>
							<td>
								<!-- <form style="display:inline" action="RaiseUpdate.jsp" method="post">
							<input type="hidden" name="donext" value="RaiseReview">
							<input type="hidden" name="rID" value="${rl.getRaiseNo()}">
							<input type="hidden" name="rCount" value="<%= rCount %>">
							<button type="submit" class="btn btn-outline-secondary">詳細</button>
						</form>-->
								<button type="submit" class="btn btn-outline-success">確認</button>
							</td>
						</tr>
						<%rCount++;%>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<!-- 
<script>
	var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
		  keyboard: false
		})
	myModal.show()
</script>
 -->

	<script>
document.getElementById("qty").addEventListener("change",qty);
let a = document.getElementById("pri").value
let b = document.getElementById("qty").value
let c = a/b;
console.log(c);

function qty(){
	
	let a = document.getElementById("qty").value;
	console.log(a)
	if(a<=0 || isNaN(a) || a>2147483647){
		alert("數量錯誤!");
		window.location.reload();
}
	
function price(){
	let a = document.getElementById("qty").value;
	let val = a*c;
	document.getElementById("pri").value =val;
}
price();
}


</script>
</body>
</html>