<%@page import="tw.designerfamily.model.ForumBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,  tw.designerfamily.model.ForumBean  "  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>forum</title>
</head>
<style>
</style>
<body>
<jsp:directive.include file="header.jsp"/>
<div class="container" style="margin-top:650px">
	<h2 style="margin-top:20px">討論區</h2>
	
	 <form name="homepage" action="DiscussControllerServlet" method="post">
         <input type="hidden" name="nextto" value="forum">         
         <input type="submit" class="btn btn-outline-secondary" value="回討論區首頁">
      </form>
      
      <hr /><br />
  <div class="d-flex justify-content-between">
      <form name="homepage" action="DiscussControllerServlet" method="post">
         <input type="hidden" name="nextto" value="add">         
         <input type="submit" class="btn btn-primary" value="新增">
      </form>
      <br />
 	  <form name="homepage" action="DiscussControllerServlet" method="post">    
         <input type="hidden" name="nextto" value="ForumSearch">
        
         <input  type="text" name="search" placeholder="請輸入主題">
          <button type="submit" class="btn btn-secondary" value="查詢">查詢</button>
      </form>
  </div>                              
     
    <table class="table table-striped" style="margin-top:20px">
	<thead>
	    <tr>
	    	<th>編號</th>
	    	<th>主題</th>
	    	<!--<th>內容</th>-->
	    	<th>建立時間</th>
	    	<th>更新時間</th>
	    	<th>帳號</th>
	    	<th>類別</th>
	    	<th>功能</th>	    	   	
	    </tr>
	</thead>
      <tbody>
      <% int count=0 ;%>	
		<c:forEach var="dl" items="${disList}">     
      		<tr>
				<td>${dl.getForumid()}</td>
				<td>${dl.getForumSubject()}</td>
				<!-- <td>${dl.getForumDescription()}</td>-->
				<td>${dl.getForumCreate_time().substring(0, 16)}</td>
				<td>${dl.getForumUpdate_time().substring(0, 16)}</td>
				<td>${dl.getForumAccount()}</td>
				<td>${dl.getForumCategory()}</td>				
				<td style="width:200px">
					<form style="display:inline" action="ForumEdit.jsp" method="post">
						<!-- 以下這一句可能沒有使用到 -->
						<input type="hidden" name="nextto" value="ForumUpdate">
						
						<input type="hidden" name="id" value="<%= count %>">
						<button type="submit" class="btn btn-warning">修改</button>
					</form>
				<!-- Button trigger modal -->
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${dl.getForumid()}">刪除</button>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#discussDetails${dl.getForumid()}">詳細</button>
				
				
				<!-- Modal -->
					<form style="display:inline" action="DiscussControllerServlet" method="post">
						<input type="hidden" name="nextto" value="ForumDelete">
						<input type="hidden" name="id" value="${dl.forumid}">
						<div class="modal fade" id="exampleModal${dl.getForumid()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel"></h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        請確認是否刪除此筆資料。
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
						        <button type="submit" class="btn btn-primary">確認</button>
						      </div>
						    </div>
						  </div>
						</div>
					</form>
						
					<!-- Modal -->
					<div class="modal fade" id="discussDetails${dl.getForumid()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  					<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">內容</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <label>${dl.getForumDescription()}</label>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>				        
				      </div>
				    </div>
				  </div>
				</div>
			</td>
			</tr>		
		<%count++; %>
	</c:forEach>
		</tbody>
		</table>     
 </div>
</body>
</html>