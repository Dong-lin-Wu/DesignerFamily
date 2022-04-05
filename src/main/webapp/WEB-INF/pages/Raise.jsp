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
<title>Raise Index</title>

	<!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="vendors/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="vendors/images/favicon-16x16.png">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
        rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="src/plugins/datatables/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="vendors/styles/style.css">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>

</head>
<body>
	<%@ include file="header.jsp"%>
<br>
<div class="main-container">
	<div class="pd-ltr-20">
		<h2>募資清單</h2>
		<br>
		<form action="raiseindexdonext.controller" method="post" style="float:left">
			<input type="hidden" name="donext" value="RaiseAdd">
			<input type="hidden" name="rID" value="0">
			<button type="submit" class="btn btn-outline-primary" style="margin-bottom:15px">新增</button>
		</form>
		<div >
			<table class="table" style="margin-top:20px">
			<thead class="table-light">
			    <tr>
			    	<th>編號</th>
			    	<th>姓名</th>
			    	<th>名稱</th>
			    	<th>類別</th>
			    	<th>預計開始日</th>
			    	<th>目標金額</th>
			    	<th>封面照片</th>	    	
			    	<th>狀態</th>	    	
			    	<th>功能</th>
			    </tr>
			</thead>
			<tbody>
				<c:forEach var="rl" items="${raiseList}">
					<tr>
						<td>${rl.getRaiseNo()}</td>
						<td>${rl.getRaiseName()}</td>
						<td>${rl.getRaiseTitle()}</td>
						<td>${rl.getRaiseCategory()}</td>
						<td>${rl.getRaiseSDate()}</td>
						<td>${Integer.parseInt(rl.getRaiseTarget())}</td>
						<td><img style="width:250px" src="${rl.getRaisePicBase64()}"></td>
						<td>${rl.getRaiseStatus()}</td>	
						<td>
							<form style="display:inline" action="raiseindexdonext.controller" method="post">
								<input type="hidden" name="donext" value="RaiseReview">
								<input type="hidden" name="rID" value="${rl.getRaiseNo()}">
								<button type="submit" class="btn btn-outline-secondary">審核</button>
							</form>
							<form style="display:inline" action="raiseindexdonext.controller" method="post">
								<input type="hidden" name="donext" value="RaiseUpdate">
								<input type="hidden" name="rID" value="${rl.getRaiseNo()}">
								<button type="submit" class="btn btn-outline-success">修改</button>
							</form>
							
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${rl.getRaiseNo()}">刪除</button>
							
							<!-- Modal -->
							<form style="display:inline" action="raiseindexdonext.controller" method="post">
								<input type="hidden" name="donext" value="RaiseDelete">
								<input type="hidden" name="rID" value="${rl.getRaiseNo()}">
								<div class="modal fade" id="exampleModal${rl.getRaiseNo()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
						</td>
					</tr>
				</c:forEach>
			   
			</tbody>
			</table>
		</div>
	</div>
</div>
<!-- js -->
<script src="vendors/scripts/core.js"></script>
<script src="vendors/scripts/script.min.js"></script>
<script src="vendors/scripts/process.js"></script>
<script src="vendors/scripts/layout-settings.js"></script>
<script src="src/plugins/apexcharts/apexcharts.min.js"></script>
<script src="src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script src="src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script src="vendors/scripts/dashboard.js"></script>
<script>
	$("#select").attr("action", "raiseindexsearch.controller");

	//var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
	//	  keyboard: false
	//	})
	//myModal.show()

</script>

</body>
</html>