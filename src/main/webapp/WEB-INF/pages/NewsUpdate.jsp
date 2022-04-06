<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

		<h1 style="margin: 20px 0px; text-align: center">修改活動</h1>
		
		<%-- 
		<form action="NewsUpdate.jsp" method="post" style="display:inline;width: 104px; float: left">
			<input type="hidden" name="todo" value="1">
			<button type="submit" class="btn btn-outline-dark">優惠攻略</button>
		</form>
		
		
		<form action="NewsUpdate.jsp" method="post" style="display:inline;width: 101px">
			<input type="hidden" name="todo" value="2">
			<button type="submit" class="btn btn-outline-dark">展覽活動</button>
		</form>
		--%>
		 
		 <form action="newsIndex" method="get" style="display: inline;width: 104px; float: right">
			<input type="hidden" name="todo" value="1">
			<button type="submit" class="btn btn-outline-dark">回上一頁</button>
		</form>
				 				
		  <c:choose>
			<%-- 展覽活動 --%>
		  	<c:when test="${param.todo == '2'}">
		  	<form action="" method="post">
		  	<div class="mb-3">
				<label for="type" class="form-label"></label> 
				<input type="text" class="form-control" id="type" value="展覽活動" readonly name="NewsType">
			</div>
			<div class="mb-3">
				<label for="title" class="form-label"><b>標題</b><em class="red">${Error1}</em></label> 
				<input type="text" class="form-control" id="exhtitle" name="NewsTitle">
			</div>
			<div class="mb-3">
				<label for="subtitle" class="form-label"><b>副標題</b></label> 
				<input type="text" class="form-control" id="exhsubtitle" name=>
			</div>
			<div class="mb-3">
				
			</div>
			<div class="mb-3">
				<label for="registerbegin" class="form-label"><b>報名起始日</b></label> 
				<input type="date" class="form-control" id="exhregisterbegin" placeholder="">
			</div>
			<div class="mb-3">
				<label for="registerend" class="form-label"><b>報名結束日</b></label> 
				<input type="date" class="form-control" id="exhregisterend" placeholder="">
			</div>
			<div class="mb-3">
				<label for="numberMax" class="form-label"><b>人數上限</b></label> 
				<input type="text" class="form-control" id="exhnumberMax" placeholder="">
			</div>
			<div class="mb-3">
				<label for="registerednumber" class="form-label"><b>已報名人數</b></label> 
				<input type="text" class="form-control" id="exhregisterednumber" placeholder="">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label"><b>活動內容</b><em class="red">${Error2}</em></label>
				<textarea class="form-control" id="exhcontent" rows="12" style="resize: none"></textarea>			
			</div>
			
			<!-- 待修改
			<div class="mb-3">
				<label for="picture" class="form-label"><b>照片</b></label> 
				<input class="form-control" type="file" id="exhpicture">
			</div>  -->
		
			<button type="reset" class="btn btn-primary">清除修改</button>
			<button type="submit" class="btn btn-primary">送出</button>
			<span>
			<em class="red">${Error}</em>
			</span>	
			</form>
			
			<%
			request.getSession().removeAttribute("Error");
			request.getSession().removeAttribute("Error1");
			request.getSession().removeAttribute("Error2");
			%>
			</c:when>
			
			<%-- 優惠攻略 --%>
			<c:otherwise>
			<form:form action="newsUpdate" method="post" modelAttribute="updateList">
				<input type="hidden" name="donext" value="doUpdate" path="newsId"/>
				<form:input type="hidden" name="NewsId" value="${n.newsId}" path="newsId"/>
			<div class="mb-3">
				<form:label for="newsType" class="form-label" path="newsType"></form:label> 
				<input type="text" class="form-control" id="type" value="優惠攻略" readonly name="newsType"/>
			</div>
			<div class="mb-3">
				<form:label for="newsTitle" class="form-label" path="newsTitle"><b>標題</b>&emsp;<span style="color:red"></span></form:label> <em id="titleError" class="red">${NewsError1}</em>
				<form:input type="text" class="form-control nBlank" id="newsTitle" value="${n.newsTitle}" name="newsTitle" path="newsTitle"/>			
			</div>
			<div class="mb-3">
				<form:label for="newsSubtitle" class="form-label" path="newsSubtitle"><b>副標題</b></form:label> 
				<form:input type="text" class="form-control" id="newsSubtitle" value="${n.newsSubtitle}" name="newsSubtitle" path="newsSubtitle"/>
			</div>
			<div class="mb-3">
				<form:label for="newsContent" class="form-label" path="newsContent"><b>活動內容</b>&emsp;<span style="color:red"></span></form:label><em id="contentError" class="red">${NewsError2}</em>
				<form:textarea class="form-control nBlank" id="newsContent" rows="12" style="resize: none"  name="newsContent" path="newsContent"></form:textarea>				
			</div>
			<div class="mb-3">
         		<form:label for="News_PicName" class="form-label" path="newsPicName"><b>活動照片</b></form:label>
           		<form:input class="form-control uploadImages" style="width:280px" type="file" id="News_PicName" name="NewsPicName" path="newsPicName"/>
       			<form:input type="hidden" id="News_PicBase64" name="NewsPicBase64" value="" path="NewsPicBase64"/>
    		</div>
	        <div class="mb-3" id="previewPicDiv"></div>
			<div class="mb-3">
				<form:label for="newsNote" class="form-label" path="newsNote"><b>備註</b></form:label>
				<form:textarea class="form-control" id="newsNote" rows="4" style="resize: none" name="newsNote" path="newsNote"></form:textarea>
			</div>

			<form:button type="reset" class="btn btn-primary">清除修改</form:button>
			<form:button type="submit" class="btn btn-primary">送出</form:button>
			<span><em class="red">${NewsError}</em></span>	
			
			</form:form>
			
			<%
			request.getSession().removeAttribute("NewsError");
			request.getSession().removeAttribute("NewsError1");
			request.getSession().removeAttribute("NewsError2");
			%>
			</c:otherwise>
		  </c:choose>
				
	</div>	
	
		<script
   			src="https://code.jquery.com/jquery-3.6.0.js"
   			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   			crossorigin="anonymous">
		</script>
		<script>

		<%--必填欄位提醒--%>
		$(".nBlank").blur(function(event){
			<%--console.log(this);--%>
			$("#titleError,#contentError").text("");
			let theSpan = $(this).closest("div.mb-3").children("label").children("span");
			if($(this).val().length == 0){
				theSpan.text("必填");
			}else{
				theSpan.text("");
			}
		})
		
		
		// 預覽圖片，將取得的files一個個取出丟到convertFile()
		function previewFiles(theImgs) {
		if (theImgs[0].files && theImgs[0].files.length >= 1) {
			$.map(theImgs[0].files, file => {
			convertFile(file)
				.then(data => {
				//console.log(data) // 把編碼後的字串輸出到console
				showPreviewImage(theImgs, data, file.name)
				})
			.catch(err => console.log(err))	
				})
			}
		}

		// 使用FileReader讀取檔案，並且回傳Base64編碼後的source
		function convertFile(file) {
		return new Promise((resolve,reject)=>{
		// 建立FileReader物件
			let reader = new FileReader()
		// 註冊onload事件，取得result則resolve (會是一個Base64字串)
			reader.onload = () => { resolve(reader.result) }
		// 註冊onerror事件，若發生error則reject
			reader.onerror = () => { reject(reader.error) }
		// 讀取檔案
			reader.readAsDataURL(file)
			})
		}

		// 在頁面上新增<img>
		function showPreviewImage(theImgs, src, fileName) {
			let image = new Image(250) // 設定寬250px
			image.name = fileName
			image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
			theImgs.closest("div").next().append(image);
			theImgs.next().attr("value",src);
		}

		// 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
		$(".uploadImages").change(function(){
		$(this).closest("div").next().empty();
		previewFiles($(this)); // this即為<input>元素
		})

		
		</script>
	<%-- jsp不能使用html的註解(<!-- -->) --%>
</body>
</html>