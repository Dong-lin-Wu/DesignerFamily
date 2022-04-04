<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>新增訂單</title>
</head>
<style>
td,th{
text-align:center;
}
.submit{
text-align:right;
}
</style>
<body>
<h1 align="center">強迫你買東西的網頁</h1>
<form action="OrderServlet" method="post" name="form" onsubmit="return check()">
<div class="container">
 <table class="table">
  <thead>
    <tr>
      <th >商品圖片</th>
      <th>商品名稱</th>
      <th>商品價格</th>
      <th>數量</th>
      <th>訂購金額</th>
      <th>訂購者</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="pr" items="${sessionScope.productList}">
    <tr>
      <td width="50px" align="right"><img src="img/${pr.commImg}" width="100%"></td>
      <td valign="middle" width=130px><input type="hidden" name="ordername${pr.commNo}" value="${pr.commTitle}">${pr.commTitle}</td>
      <td valign="middle" width=50px><input type="hidden" id="price${pr.commNo}"name="orderprice${pr.commNo}" value="${pr.commPrice}">${pr.commPrice}</td>
      <td valign="middle" width=60px><input type="text" id="qty${pr.commNo}"name= "orderqty${pr.commNo}" size="3"></td>
      <td valign="middle" width=80px id="pri${pr.commNo}"></td>
      <td valign="middle" width=50px><input type="hidden" name= "orderowner" value="${sessionScope.login.account}" size="6">${sessionScope.login.account}</td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<div class="container" align="right">
<span id="total"></span>
 <input type="hidden" name="action" value="addorder">
<input id="buy" type="submit" value="確認購買" >
</div>
</div>
</form>
<script>
let a = document.getElementById("price1").value;
let b = document.getElementById("price2").value;
let c = document.getElementById("price3").value;
let d = document.getElementById("price4").value;
let e = document.getElementById("price5").value;
let f = document.getElementById("price6").value;
document.getElementById("qty1").addEventListener("change", qty1);
document.getElementById("qty2").addEventListener("change", qty2);
document.getElementById("qty3").addEventListener("change", qty3);
document.getElementById("qty4").addEventListener("change", qty4);
document.getElementById("qty5").addEventListener("change", qty5);
document.getElementById("qty6").addEventListener("change", qty6);

function qty1(){
let g = document.getElementById("qty1").value;

if(g<=0 || isNaN(g) || g>2147483647){
	alert("數量錯誤!");
    this.value="";
    document.getElementById("pri1").innerHTML ="";
	total();
}else{
	let val=a*g
	document.getElementById("pri1").innerHTML =val;
	total();
}
}

function qty2(){
let h = document.getElementById("qty2").value;

if(h<=0 || isNaN(h) || h>2147483647){
	alert("數量錯誤!");
	 this.value="";
	document.getElementById("pri2").innerHTML ="";
	total();
}else{
	let val2=b*h
	console.log(val2)
	document.getElementById("pri2").innerHTML =val2;
	total();
}
}
function qty3(){
let i = document.getElementById("qty3").value;

if(i<=0 || isNaN(i) || i>2147483647){
	alert("數量錯誤!");
	this.value="";
	document.getElementById("pri3").innerHTML ="";
	total();	
}else{
	let val3=c*i
	document.getElementById("pri3").innerHTML =val3;
	total();	
}
}

function qty4(){
	let j = document.getElementById("qty4").value;

	if(j<=0 || isNaN(j) || j>2147483647){
		alert("數量錯誤!");
		this.value="";
		document.getElementById("pri4").innerHTML ="";
		total();	
	}else{
		let val3=d*j
		document.getElementById("pri4").innerHTML =val3;
		total();	
	}
	}
	
function qty5(){
	let k = document.getElementById("qty5").value;

	if(k<=0 || isNaN(k) || k>2147483647){
		alert("數量錯誤!");
		this.value="";
		document.getElementById("pri5").innerHTML ="";
		total();	
	}else{
		let val=e*k
		document.getElementById("pri5").innerHTML =val;
		total();	
	}
	}
	
function qty6(){
	let l = document.getElementById("qty6").value;

	if(l<=0 || isNaN(l) || l>2147483647){
		alert("數量錯誤!");
		this.value="";
		document.getElementById("pri6").innerHTML ="";
		total();
	}else{
		let val=f*l
		document.getElementById("pri6").innerHTML =val;
		total();	
	}
	}


function total(){
	let g = document.getElementById("qty1").value;
	let h = document.getElementById("qty2").value;
	let i = document.getElementById("qty3").value;
	let j = document.getElementById("qty4").value;
	let k = document.getElementById("qty5").value;
	let l = document.getElementById("qty6").value;
	let val=(a*g)+(b*h)+(c*i)+(d*j)+(e*k)+(f*l)
	console.log(val)
	document.getElementById("total").innerHTML ="總金額:"+val;
	
}

function check(){
	let g = document.getElementById("qty1").value;
	let h = document.getElementById("qty2").value;
	let i = document.getElementById("qty3").value;
	let j = document.getElementById("qty4").value;
	let k = document.getElementById("qty5").value;
	let l = document.getElementById("qty6").value;
	
	if(g==0 && h==0 && i==0 && j==0 && k==0 && l==0){
		alert("至少要買一個才能走!");
	return false;
}else{
	return true;
}
	
}

</script>
</body>
</html>