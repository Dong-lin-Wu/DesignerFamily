<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>訂單管理</title>
</head>
<style>
td,th{
text-align:center;
}
</style>
<body>
<h1 align="center">訂單查詢</h1>
<div class="container">
 <table class="table">
  <thead>
    <tr>
       <th>NO.</th>
      <th >訂單編號</th>
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
<c:forEach var="se" items="${search}">
    <tr>
     <td>${se.orderNo}</td>
      <td>${se.orderKey}</td>
      <td>${se.orderName}</td>
      <td>${se.orderQty}</td>
      <td>${se.orderDate}</td>
      <td>${se.orderPrice}</td>
      <td >${se.orderOwner}</td>
      <td>${se.orderStatus}</td> 
      <td><a href="OrderServlet?action=deleteorder&orderNo=${se.orderNo}"><input type=submit value=刪除></a>
      <a href="OrderServlet?action=findorder&orderNo=${se.orderNo}"><input type=submit value=修改></a>
      </td>
    </tr>
</c:forEach>
  </tbody>
</table>
<div class="container" align="right">
<form action="OrderServlet">
<input class="submit" type="submit" value="回首頁" >
</form>
</div>
</div>
</body>
</html>