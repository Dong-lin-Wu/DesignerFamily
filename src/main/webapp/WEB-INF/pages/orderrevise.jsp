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

<!-- 從這裡(第一段) -->
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
        <!-- 到這裡(第一段結束) -->
        
</head>
<style>
td,th,tr{
text-align:center;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="main-container">
		<div class="pd-ltr-20">
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
									<td><input type="hidden" name="orderQty" id="qty"
										value="${order.orderQty}" size="1">${order.orderQty}</td>
									<td>${order.orderDate.substring(0, 10)}</td>
									<td><input type="hidden" name="orderPrice" id="pri"
										value="${order.orderPrice}" size="1">${order.orderPrice}</td>
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
								<%
								rCount++;
								%>
							</tbody>
						</table>
					</div>
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
document.getElementById("pri").addEventListener("change",qty);

function qty(){
	
	let a = document.getElementById("pri").value;
	console.log(a)
	if(a<=0 || isNaN(a) || a>2147483647){
		alert("數量錯誤!");
		window.location.reload();
}
}
</script>

<script>
$("#select").attr("action", "searchorder");

	//var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
		//  keyboard: false
		//})
	//myModal.show()
</script>
 <!-- 從這裡(第二段) -->
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
        <!-- 到這裡(第二段結束) -->
</body>
</html>