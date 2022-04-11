<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.designerfamily.model.RaiseBean, tw.designerfamily.model.RaisePlanBean, java.util.List, java.util.Set"%>
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

<title>Insert title here</title>
<style>
	div{
		margin-top:20px;
	}
</style>

</head>
<body>
	<div class='container'>
		<h3 style="margin-top:20px">募資計畫明細</h3>
		<form action="raiseupdate.controller" method="POST" style="display:inline">
			<div class="mb-3">
			    <label for="Raise_Title" class="form-label"><b>計畫名稱</b></label>
			    <input type="text" class="form-control" id="Raise_Title" name="Raise_Title" value="${raiseBean.raiseTitle}" required="required">
			</div>
			<div class="mb-3">
			    <label for="Raise_Brief" class="form-label"><b>計畫簡述</b></label>
			    <input type="text" class="form-control" id="Raise_Brief" name="Raise_Brief" aria-describedby="BriefInfo" value="${raiseBean.raiseBrief}" required="required">
			    <div id="BriefInfo" class="form-text">請用簡短的兩三句話介紹這個計畫。</div>
			</div>
			<div class="mb-3">
			 	<label for="Raise_Category" class="form-label"><b>計畫類別</b></label>
			  	<select id="Raise_Category" name="Raise_Category" class="form-select" style="width:250px" aria-label="Default select example" aria-describedby="CategoryInfo">  	
				  	<option value="音樂">音樂</option>
				  	<option value="攝影">攝影</option>
				  	<option value="時尚">時尚</option>
				  	<option value="設計">設計</option>	
				  	<option value="遊戲">遊戲</option>
				  	<option value="飲食">飲食</option>
				  	<option value="教育">教育</option>
				  	<option value="科技">科技</option>
				  	<option value="藝術">藝術</option>
			  	</select>
				<div id="CategoryInfo" class="form-text">請選擇計畫類別。</div>
			</div>
				<div class="mb-3">
			    <label for="Raise_Target" class="form-label"><b>計畫目標資金</b></label>
			    <div style="margin-top:0px"><input type="text" class="form-control" style="width:250px;float:left" id="Raise_Target" name="Raise_Target" aria-describedby="TargetInfo" placeholder="100000" value="${raiseBean.raiseTarget}" required="required"><span style="line-height:38px;margin-left:10px">NTD</span></div>
			 	<div id="TargetInfo" class="form-text">請根據你計畫的需求，估算你所需要募集的金額。</div>
			</div>
			
			<div class="mb-3" style="margin:0px">
			 	<label for="Raise_PicName" class="form-label"><b>封面照片</b></label>
			 	<input class="form-control uploadImages" style="width:250px" type="file" id="Raise_PicName" name="Raise_PicName">
				<input type="hidden" id="Raise_PicBase64" name="Raise_PicBase64" value="${raiseBean.raisePicBase64}">
				<input type="hidden" id="Raise_PicName_default" name="Raise_PicName_default" value="${raiseBean.raisePicName}">
			 	<div style="margin:10px 0px 0px 0px">${raiseBean.raisePicName}</div>
			</div>
			<div class="mb-3" id="previewPicDiv" style="margin-top:0px">
				<img style="width:250px" name="${raiseBean.raisePicName}" src="${raiseBean.raisePicBase64}">
			</div>

			<div class="mb-3">			  
				<label for="Raise_SDate" class="form-label"><b>預計開始時間</b></label><br>
				<input type="date" id="Raise_SDate" name="Raise_SDate">
			 	<div id="SDateInfo" class="form-text">告訴我們你希望什麼時候開始你的計畫，我們將會為你安排審核順序。我們至少需要約十個工作天審核你的提案。</div>
			</div>
			<div class="mb-3">			  
				<label for="Raise_ExpDate" class="form-label"><b>預計結束時間</b></label><br>
				<input type="date" id="Raise_ExpDate" name="Raise_ExpDate">
			 	<div id="ExpDateInfo" class="form-text">計畫時間建議為期在60天內。</div>
			</div>
			<label for="Raise_Describe" class="form-label"><b>計畫說明</b></label>
			<div class="form-floating" style="margin-top:0px">
				<textarea class="form-control" placeholder="" id="Raise_Describe" name="Raise_Describe" style="height: 200px" required>${raiseBean.raiseDescribe}</textarea>   
			    <div id="DescribeInfo" class="form-text">請告訴我們關於你計畫的故事、為什麼大家應該支持你的計畫。</div>
			    <div id="DescribeInfo1" class="form-text">請注意：我們必須要有足夠的訊息才有辦法審核計畫，如果你所提供的資訊過少，或我們無法認證您計畫的真實性、可行性，計畫就會無法上架。</div>
			</div>
			<hr>
	        <div class="mb-3">
	            <label for="RaisePlan_Amount_1" class="form-label"><b>回饋選項金額（一）</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="RaisePlan_Amount_1" name="RaisePlan_Amount_1" aria-describedby="TargetInfo" placeholder="300" value="${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanAmount}" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	        </div>
	         <div class="mb-3">
	            <label for="RaisePlan_PicName_1" class="form-label"><b>回饋選項照片（一）</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="RaisePlan_PicName_1" name="RaisePlan_PicName_1">
	        	<input type="hidden" id="RaisePlan_PicBase64_1" name="RaisePlan_PicBase64_1" value="${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanPicBase64}">
				<input type="hidden" id="RaisePlan_PicName_default_1" name="RaisePlan_PicName_default_1" value="${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanPicName}">
			 	<div style="margin:10px 0px 0px 0px">${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanPicName}</div>
	        </div>
	        <div class="mb-3" id="previewPicDiv_1" style="margin-top:0px">
				<img style="width:250px" name="${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanPicName}" src="${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanPicBase64}">
			</div>
	        
	        <div class="mb-3">
	            <label for="RaisePlan_ADate_1" class="form-label"><b>回饋預計實現時間（一）</b></label><br>
	            <input type="date" id="RaisePlan_ADate_1" name="RaisePlan_ADate_1">
	        </div>
	        <div class="mb-3">
		        <label for="RaisePlan_Describe_1" class="form-label"><b>回饋選項內容說明（一）</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
		            <textarea class="form-control nBlank" id="RaisePlan_Describe_1" name="RaisePlan_Describe_1" style="height: 100px" required>${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanDescribe}</textarea>
		            <div id="PlanDescribeInfo_1" class="form-text">僅供審核，之後可增加、刪減、或修改。</div>
		        </div>
	        </div>
	        <div class="mb-3">
	            <label for="RaisePlan_Amount_2" class="form-label"><b>回饋選項金額（二）</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="RaisePlan_Amount_2" name="RaisePlan_Amount_2" aria-describedby="TargetInfo" placeholder="1000" value="${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanAmount}" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	        </div>
	         <div class="mb-3">
	            <label for="RaisePlan_PicName_2" class="form-label"><b>回饋選項照片（二）</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="RaisePlan_PicName_2" name="RaisePlan_PicName_2">
	        	<input type="hidden" id="RaisePlan_PicBase64_2" name="RaisePlan_PicBase64_2" value="${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanPicBase64}">
				<input type="hidden" id="RaisePlan_PicName_default_2" name="RaisePlan_PicName_default_2" value="${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanPicName}">
			 	<div style="margin:10px 0px 0px 0px">${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanPicName}</div>
	        </div>
	        <div class="mb-3" id="previewPicDiv_2" style="margin-top:0px">
				<img style="width:250px" name="${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanPicName}" src="${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanPicBase64}">
			</div>
	        
	        <div class="mb-3">
	            <label for="RaisePlan_ADate_2" class="form-label"><b>回饋預計實現時間（二）</b></label><br>
	            <input type="date" id="RaisePlan_ADate_2" name="RaisePlan_ADate_2">
	        </div>
	        <div class="mb-3">
		        <label for="RaisePlan_Describe_2" class="form-label"><b>回饋選項內容說明（二）</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
		            <textarea class="form-control nBlank" id="RaisePlan_Describe_2" name="RaisePlan_Describe_2" style="height: 100px" required>${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanDescribe}</textarea>
		            <div id="PlanDescribeInfo_2" class="form-text">僅供審核，之後可增加、刪減、或修改。</div>
		        </div>
	        </div>
			
			
			
			
			
			<br>

		<c:choose>
		    <c:when test="${param.donext=='RaiseReview'}">
		    </form>
			    <form action="raisereview.controller" method="POST" style="display:inline">
					<input type="hidden" name="rID" value="${raiseBean.raiseNo}">
					<input type="hidden" name="rComment" value="Approved">
			        <button type="submit" class="btn btn-success">審核通過</button> 
				</form>
				<form action="raisereview.controller" method="POST" style="display:inline">
					<input type="hidden" name="rID" value="${raiseBean.raiseNo}">
					<input type="hidden" name="rComment" value="Rejected">
			        <button type="submit" class="btn btn-danger">駁回</button> 
				</form>
		    </c:when>
		    <c:otherwise>
					<input type="hidden" name="rID" value="${raiseBean.raiseNo}">
					<input type="hidden" name="rpId1" value="${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanNo}">			
					<input type="hidden" name="rpId2" value="${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanNo}">			
					<button type="submit" class="btn btn-primary">確認修改</button>
				</form>
		    </c:otherwise>
		</c:choose>
		<br>
		<br>
		
	</div>
	<!-- 以下為script -->
	<script
	    src="https://code.jquery.com/jquery-3.6.0.js"
	    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	    crossorigin="anonymous">
	</script>
	<script>
		let theCategory="${raiseBean.raiseCategory}";
		let theSDate="${raiseBean.raiseSDate}";
		let theExpDate="${raiseBean.raiseExpDate}";
		let theADate1="${raiseBean.raisePlanBeanSet.toArray()[0].raisePlanADate}"; //回饋一預計實現日期
		let theADate2="${raiseBean.raisePlanBeanSet.toArray()[1].raisePlanADate}"; //回饋二預計實現日期

		if(theCategory != ""){
			$(`#Raise_Category option[value=\${theCategory}]`).remove(); //刪除Select中Value為選項的Option
			$("#Raise_Category").append(`<option selected='selected' value=\${theCategory}>\${theCategory}</option>`); //為Select追加一個Option(下拉項)
		}
		//限制頭尾日期
		let dayNow=new Date();
		let yy=dayNow.getFullYear();
		let mm=dayNow.getMonth()+1;
		mm = (mm < 10 ? '0' : '') + mm; //月份小於10則增加開頭為0並轉為字串
		let mm1=dayNow.getMonth()+1;
		mm1=(mm1+2)%12; //設定結束月份為當天增加二個月為預設月份
		mm1=(mm1 == 0 ? 12 : mm1); //若二個月後為12月，則經過12求餘數為0，將其手動改為12月份
		mm1=(mm1 <10 ? '0': '') + mm1;
		let dd=dayNow.getDate();
		dd = (dd < 10 ? '0' : '') + dd;
		let nowDate = `\${yy}-\${mm}-\${dd}`;
		if(theSDate < nowDate){
			$("#Raise_SDate").attr("min",theSDate);			
		}else{
			$("#Raise_SDate").attr("min",nowDate);
		}
		$("#Raise_SDate").attr("max",`\${yy+2}-12-31`);
		$("#Raise_SDate").attr("value",theSDate);
		$("#Raise_ExpDate").attr("min",nowDate);
		$("#Raise_ExpDate").attr("max",`\${yy+2}-12-31`);
		$("#Raise_ExpDate").attr("value",theExpDate);
		$("#RaisePlan_ADate_1").attr("min",nowDate);
		$("#RaisePlan_ADate_1").attr("max",`\${yy+5}-12-31`);
		$("#RaisePlan_ADate_1").attr("value",theADate1);
		$("#RaisePlan_ADate_2").attr("min",nowDate);
		$("#RaisePlan_ADate_2").attr("max",`\${yy+5}-12-31`);
		$("#RaisePlan_ADate_2").attr("value",theADate2);
		
		
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
			theImgs.next().next().attr("value",fileName);
			theImgs.siblings("div").remove(); //移除原本照片名稱
		}
		
		// 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
		$(".uploadImages").change(function(){
			$(this).closest("div").next().empty();
			previewFiles($(this)); // this即為<input>元素
		})
		
		
		
        
	</script>
</body>
</html>