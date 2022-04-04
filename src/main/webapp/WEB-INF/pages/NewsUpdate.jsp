<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動修改</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<style>
	.red{
	color:red;
	margin-left:10px;
}
</style>
</head>
<body>     
	<div class='container' style="width: 600px">

		<h1 style="margin-top: 20px; text-align: center">修改活動</h1>
		<form action="NewsUpdate.jsp" method="post" style="display:inline">
			<input type="hidden" name="todo" value="1">
			<button type="submit" class="btn btn-outline-dark">優惠攻略</button>
		</form>
		
		<%-- Final專題
		<form action="NewsUpdate.jsp" method="post" style="display:inline">
			<input type="hidden" name="todo" value="2">
			<button type="submit" class="btn btn-outline-dark">展覽活動</button>
		</form>
		 --%>
		 				
		  <c:choose>
			<%-- 展覽活動 --%>
		  	<c:when test="${param.todo == '2'}">
		  	<form action="" method="post">
		  	<div class="mb-3">
				<label for="type" class="form-label"></label> 
				<input type="text" class="form-control" id="type" value="展覽活動" readonly name="NewsType">
			</div>
			<div class="mb-3">
				<label for="title" class="form-label">標題</label> 
				<input type="text" class="form-control" id="exhtitle" name="NewsTitle"><em class="red">${NewsError1}</em>
			</div>
			<div class="mb-3">
				<label for="subtitle" class="form-label">副標題</label> 
				<input type="text" class="form-control" id="exhsubtitle" name=>
			</div>
			<div class="mb-3">
				
			</div>
			<div class="mb-3">
				<label for="registerbegin" class="form-label">報名起始日</label> 
				<input type="date" class="form-control" id="exhregisterbegin" placeholder="">
			</div>
			<div class="mb-3">
				<label for="registerend" class="form-label">報名結束日</label> 
				<input type="date" class="form-control" id="exhregisterend" placeholder="">
			</div>
			<div class="mb-3">
				<label for="numberMax" class="form-label">人數上限</label> 
				<input type="text" class="form-control" id="exhnumberMax" placeholder="">
			</div>
			<div class="mb-3">
				<label for="registerednumber" class="form-label">已報名人數</label> 
				<input type="text" class="form-control" id="exhregisterednumber" placeholder="">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">內文</label>
				<textarea class="form-control" id="exhcontent" rows="12" style="resize: none"></textarea>
				<em class="red">${NewsError2}</em>
			</div>
			<div class="mb-3">
				<label for="picture" class="form-label">照片</label> 
				<input class="form-control" type="file" id="exhpicture">
			</div>
		
			<button type="reset" class="btn btn-primary">清除修改</button>
			<button type="submit" class="btn btn-primary">送出</button>
			<span>
			<em class="red">${NewsError}</em>
			</span>	
			</form>
			
			<%
			request.getSession().removeAttribute("NewsError");
			request.getSession().removeAttribute("NewsError1");
			request.getSession().removeAttribute("NewsError2");
			%>
			</c:when>
			
			<%-- 優惠攻略 --%>
			<c:otherwise>
			<form action="NewsUpdateServlet" method="post">
				<input type="hidden" name="donext" value="doUpdate">
				<input type="hidden" name="NewsId" value="${n.newsId}">
			<div class="mb-3">
				<label for="type" class="form-label"></label> 
				<input type="text" class="form-control" id="type" value="優惠攻略" readonly name="NewsType">
			</div>
			<div class="mb-3">
				<label for="title" class="form-label">標題</label> 
				<input type="text" class="form-control" id="title" value="${n.newsTitle}" name="NewsTitle">
				<em class="red">${NewsError1}</em>
			</div>
			<div class="mb-3">
				<label for="subtitle" class="form-label">副標題</label> 
				<input type="text" class="form-control" id="subtitle" value="${n.newsSubtitle}" name="NewsSubtitle">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">內文</label>
				<textarea class="form-control" id="content" rows="12" style="resize: none"  name="NewsContent">${n.newsContent}</textarea>
				<em class="red">${NewsError2}</em>
			</div>
			<%-- 
			<div class="mb-3">
				<label for="picture" class="form-label">照片</label> 
				<input class="form-control" type="file" id="picture">
			</div> 
			--%>
			<div class="mb-3">
				<label for="Note" class="form-label">備註</label>
				<textarea class="form-control" id="Note" rows="4" style="resize: none" name="NewsNote">${n.newsNote}</textarea>
			</div>

			<button type="reset" class="btn btn-primary">清除修改</button>
			<button type="submit" class="btn btn-primary">送出</button>
			<span>
			<em class="red">${NewsError}</em>
			</span>	
			</form>
			
			<%
			request.getSession().removeAttribute("NewsError");
			request.getSession().removeAttribute("NewsError1");
			request.getSession().removeAttribute("NewsError2");
			%>
			</c:otherwise>
		  </c:choose>
				
	</div>	
	
	<%-- jsp不能使用html的註解(<!-- -->) --%>
</body>
</html>