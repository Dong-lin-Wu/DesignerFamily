<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>訂單修改</title>
</head>
<style>
td,th{
text-align:center;
}
</style>
<body>
<h1 align="center">訂單修改</h1>
<form action="OrderServlet" method="post" name="form">
<div class="container">
 <table class="table">
  <thead>
    <tr>
      <th >NO</th>
      <th>訂單編號</th>
      <th width="300px" align="right">商品名稱</th>
      <th >數量</th>
      <th >下單日期</th>
      <th >訂單價格</th>
      <th>訂購者</th>
      <th>訂單狀態</th>
      <th >操作</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="hidden"  name = "orderno" value="${order.orderNo}"size="2">${order.orderNo}</td>
      <td>${order.orderKey}</td>
      <td>${order.orderName}</td>
      <td><input type="text" name = "orderqty" id="qty" value="${order.orderQty}"size="2" ></td>
      <td>${order.orderDate}</td>
      <td><input type="text" name = "orderprice" id="pri" value="${order.orderPrice}" size="7" readonly></td>
      <td>${order.orderOwner}</td>
      <td><select name="orderstatus">
      <option>${option.get(0)}</option>
      <option>${option.get(1)}</option>
      <option>${option.get(2)}</option>
      </select></td>
      <td>
      <input type="hidden" name="action" value="reviseorder">
      <input type="submit" value="確認修改">
      </td>
    </tr>
  </tbody>
</table>
</div>
</form>
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