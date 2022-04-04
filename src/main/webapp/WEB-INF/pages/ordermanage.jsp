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
td,th,tr{
text-align:center;
}
</style>
<body>
<%@ include file="header.jsp" %>
<div class="container" style="margin-top:650px">

<h1 align="center">訂單管理</h1> <a href="orderadd.jsp"><input type=submit value=購物清單></a>
<form action="OrderServlet" method="post">
  <p align="center">
  <input type="text" name="orderkey" size=30>
    <input type="hidden" name="action" value="search">
  <input type=submit value=查詢></p>
  </form>
 <table class="table">
  <thead>
    <tr>
       <th>NO.</th>
      <th >訂單編號</th>
      <th width="300px">商品名稱</th>
      <th >數量</th>
      <th >下單日期</th>
      <th >訂單價格</th>
      <th>訂購者</th>
      <th>訂單狀態</th>
      <th >操作</th>
    </tr>
  </thead>
  <tbody>
<c:forEach var="va" items="${list}">
    <tr>
     <td>${va.orderNo}</td>
      <td>${va.orderKey}</td>
      <td>${va.orderName}</td>
      <td>${va.orderQty}</td>
      <td>${va.orderDate.substring(0, 10)}</td>
      <td>${va.orderPrice}</td>
      <td >${va.orderOwner}</td>
      <td>${va.orderStatus}</td> 
      <td><a href="OrderServlet?action=deleteorder&orderNo=${va.orderNo}"><input type=submit value=刪除></a>
      <a href="OrderServlet?action=findorder&orderNo=${va.orderNo}"><input type=submit value=修改></a>
      </td>
    </tr>
</c:forEach>
  </tbody>
</table>
</div>
</body>
</html>