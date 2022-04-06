<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增活動</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<style>
.red {
	color: red;
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class='container' style="width: 600px">

		<h1 style="margin: 20px 0px; text-align: center">新增活動</h1>
		
		<%--
		<form action="NewsAdd.jsp" method="post" style="display: inline ;width: 104px; float: left">
			<input type="hidden" name="todo" value="1"/>
			<button type="submit" class="btn btn-outline-dark">優惠攻略</button>
		</form>
		
		
		<form:form action="NewsAdd.jsp" method="post" style="display:inline ;width: 101px">
			<form:input type="hidden" name="todo" value="2" />
			<form:button type="submit" class="btn btn-outline-dark">展覽活動</form:button>
		</form:form>
		  --%>
		
		<form action="newsIndex" method="get" style="display: inline;width: 104px; float: right">
			<input type="hidden" name="todo" value="1" />
			<button type="submit" class="btn btn-outline-dark" >回上一頁</button>
		</form>
		
		<c:choose>
			<c:when test="${param.todo == '2'}">
			<%-- 展覽活動 
				<form:form action="" method="post">
					<div class="mb-2">
						<form:label for="type" class="form-label" path="type"></form:label> 
						<form:input type="text" class="form-control" id="type" value="展覽活動" readonly name="type" path="type"/>
					</div>
					<div class="mb-2">
						<form:label for="title" class="form-label" path="title"><b>標題</b><em class="red">${error1}</em></form:label> 
						<form:input type="text" class="form-control" id="title" name="title" path="title"/>						
					</div>
					<div class="mb-2">
						<form:label for="subtitle" class="form-label" path="subtitle"><b>副標題</b></form:label> 
						<form:input type="text" class="form-control" id="subtitle" name="subtitle" path="subtitle"/>
					</div>
					<div class="mb-2">
						<form:label for="registerbegin" class="form-label" path="registerbegin"><b>報名起始日</b></form:label> 
						<form:input type="date" class="form-control" id="registerbegin" placeholder="" path="registerbegin"/>
					</div>
					<div class="mb-2">
						<form:label for="registerend" class="form-label" path="registerend"><b>報名結束日</b></form:label> 
						<form:input type="date" class="form-control" id="registerend" placeholder="" path="registerend"/>
					</div>
					<div class="mb-2">
						<form:label for="numberMax" class="form-label" path="numberMax"><b>人數上限</b></form:label> 
						<form:input type="text" class="form-control" id="numberMax" placeholder="" path="numberMax"/>
					</div>
					<div class="mb-2">
						<form:label for="registerednumber" class="form-label" path="registerednumber"><b>已報名人數</b></form:label> 
						<form:input type="text" class="form-control" id="registerednumber" placeholder="" path="registerednumber"/>
					</div>
					<div class="mb-2">
						<form:label for="content" class="form-label" path="content"><b>活動內容</b><em class="red">${error2}</em></form:label>
						<form:textarea class="form-control" id="content" rows="12" style="resize: none" path="content"></form:textarea>						
					</div>
					
					<!-- 待修改
					<div class="mb-2">
						<form:label for="picture" class="form-label" path="picture"><b>照片</b></form:label> 
						<form:input class="form-control" type="file" id="exhpicture" path="picture"/>
					</div>  -->
					
					<form:button type="reset" class="btn btn-primary">清除</form:button>
					<form:button type="submit" class="btn btn-primary">送出</form:button>
					<span> <em class="red">${error}</em>
					</span>
				</form:form>

				<%
				request.getSession().removeAttribute("error");
				request.getSession().removeAttribute("error1");
				request.getSession().removeAttribute("error2");
				%>
				--%>
			</c:when>
				

			<%-- 優惠攻略 --%>
			<c:otherwise>
				<form:form action="newsAdd" method="post" modelAttribute="addList">
					<div class="mb-3">
						<label for="type" class="form-label" path="newsType"></label> 
						<input type="text" class="form-control" id="type" value="優惠攻略" readonly name="newsType"/>
					</div>
					<div class="mb-3">
						<form:label for="newsTitle" class="form-label" path="newsTitle"><b>標題</b>&emsp;<span style="color:red"></span></form:label> <em id="titleError" class="red">${NewsError1}</em>
						<form:input type="text" class="form-control nBlank" id="newsTitle" name="newsTitle" value="${n1.newsTitle}" path="newsTitle"/>						
					</div>
					<div class="mb-3">
						<form:label for="newsSubtitle" class="form-label" path="newsSubtitle"><b>副標題</b></form:label> 
						<form:input type="text" class="form-control" id="newsSubtitle" name="newsSubtitle" value="${n1.newsSubtitle}" path="newsSubtitle"/>
					</div>
					<div class="mb-3">
						<form:label for="newsContent" class="form-label" path="newsContent"><b>活動內容</b>&emsp;<span style="color:red"></span></form:label><em id="contentError" class="red">${NewsError2}</em>
						<form:textarea class="form-control nBlank" id="newsContent" rows="12" style="resize: none" name="newsContent" value="${n1.newsContent}" path="newsContent"></form:textarea>						
					</div>

			        <div class="mb-3">
	            		<form:label for="News_PicName" class="form-label" path="newsPicName"><b>活動照片</b></form:label>
	            		<form:input class="form-control uploadImages" style="width:280px" type="file" id="News_PicName" name="NewsPicName" path="newsPicName"/>
	        			<form:input type="hidden" id="News_PicBase64" name="NewsPicBase64" value="" path="newsPicBase64"/>
	       			 </div>
	        		<div class="mb-3" id="previewPicDiv"></div>
					
					<div class="mb-3">
						<form:label for="newsNote" class="form-label" path="newsNote"><b>備註</b></form:label>
						<form:textarea class="form-control" id="newsNote" rows="4" style="resize: none" name="newsNote" value="${n1.newsNote}" path="newsNote"></form:textarea>						
					</div>	
	        							
					<form:button type="reset" class="btn btn-primary">清除</form:button>
					<form:button type="submit" class="btn btn-primary">送出</form:button>
					<span> <em class="red">${NewsError}</em></span>
					<div style="text-align: center; width: 1000px; margin: 20px auto">
						<input type="button" name="button" id="button" value="一鍵輸入" onclick="oneClick()"/>
					</div>
				</form:form>


				<%
				request.getSession().removeAttribute("NewsError");
				request.getSession().removeAttribute("NewsError1");
				request.getSession().removeAttribute("NewsError2");
				%>
				
				
				<script
	    			src="https://code.jquery.com/jquery-3.6.0.js"
	    			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	    			crossorigin="anonymous">
				</script>
				
				
				<script>
				<%-- 一鍵輸入 --%>
				function oneClick() {
					$("#newsTitle").attr("value","2022 邀請朋友活動");
                 	$("#newsSubtitle").attr("value","");                	
                 	$("#newsContent").html("<br>● 邀請朋友加入 XXXXX <br>邀請朋友成功加入 XXXXX ，就可獲得 300 P Coins，可以在結帳時折抵消費金額或換取限量獎勵。<br>當你邀請的朋友完成首次購買，或是也邀請新朋友加入 XXXXX ，你可以分別再獲得 300 P Coins。邀請一個朋友，等於最多可以獲得 900 P Coins！<br>◎ 優惠期間：無限期<br>◎ 優惠內容：邀請朋友成功加入，就可獲得 300 P Coins，可用於折抵消費或換取限量獎勵。<br>");
                 	$("#newsNote").html("300 P Coins 價值 NT$ 30，可以用來折抵消費跟兌換回饋獎勵。");
                  }

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

			</c:otherwise>
		</c:choose>
	</div>

</body>

</html>