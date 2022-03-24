<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.designerfamily.model.RaiseBean"%>
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
		<h3 style="margin-top:20px">募資提案</h3>
		<form action="RaiseServlet" method="POST">
	        <div class="mb-3">
	            <label for="Raise_Title" class="form-label"><b>計畫名稱</b>&emsp;<span style="color:red"></span></label>
	            <input type="text" class="form-control nBlank" id="Raise_Title" name="Raise_Title" required="required">
	        </div>
	        <div class="mb-3">
	            <label for="Raise_Breif" class="form-label"><b>計畫簡述</b>&emsp;<span style="color:red"></span></label>
	            <input type="text" class="form-control nBlank" id="Raise_Breif" name="Raise_Breif" aria-describedby="BreifInfo" required="required">
	            <div id="BreifInfo" class="form-text">請用簡短的兩三句話介紹這個計畫。</div>
	        </div>
	        <div class="mb-3">
	            <label for="Raise_Category" class="form-label"><b>計畫類別</b></label>
                   <select id="Raise_Category" name="Raise_Category" class="form-select" style="width:250px"
                       aria-label="Default select example" aria-describedby="CategoryInfo">
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
	            <label for="Raise_Target" class="form-label"><b>計畫目標資金</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="Raise_Target" name="Raise_Target" aria-describedby="TargetInfo" placeholder="100000" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	            <div id="TargetInfo" class="form-text">請根據你計畫的需求，估算你所需要募集的金額。</div>
	        </div>
	        
	        <div class="mb-3">
	            <label for="Raise_PicName" class="form-label"><b>封面照片</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="Raise_PicName" name="Raise_PicName" required="required">
	        	<input type="hidden" id="Raise_PicBase64" name="Raise_PicBase64" value="">
	        </div>
	        <div class="mb-3" id="previewPicDiv"></div>

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
	        <div class="mb-3">
		        <label for="Raise_Describe" class="form-label"><b>計畫說明</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
		            <textarea class="form-control nBlank" id="Raise_Describe" name="Raise_Describe" style="height: 200px" required></textarea>
		            <div id="DescribeInfo" class="form-text">請告訴我們關於你計畫的故事、為什麼大家應該支持你的計畫。</div>
		            <div id="DescribeInfo1" class="form-text">請注意：我們必須要有足夠的訊息才有辦法審核計畫，如果你所提供的資訊過少，或我們無法認證您計畫的真實性、可行性，計畫就會無法上架。</div>
		        </div>
	        </div>
	        <hr>
	        <div class="mb-3">
	            <label for="RaisePlan_Amount_1" class="form-label"><b>回饋選項金額（一）</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="RaisePlan_Amount_1" name="RaisePlan_Amount_1" aria-describedby="TargetInfo" placeholder="300" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	        </div>
	         <div class="mb-3">
	            <label for="RaisePlan_PicName_1" class="form-label"><b>回饋選項照片（一）</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="RaisePlan_PicName_1" name="RaisePlan_PicName_1" required="required">
	        	<input type="hidden" id="RaisePlan_PicBase64_1" name="RaisePlan_PicBase64_1" value="">
	        </div>
	        <div class="mb-3" id="previewPicDiv_1"></div>
	        
	        <div class="mb-3">
	            <label for="RaisePlan_ADate_1" class="form-label"><b>回饋預計實現時間（一）</b></label><br>
	            <input type="date" id="RaisePlan_ADate_1" name="RaisePlan_ADate_1">
	        </div>
	        <div class="mb-3">
		        <label for="RaisePlan_Describe_1" class="form-label"><b>回饋選項內容說明（一）</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
		            <textarea class="form-control nBlank" id="RaisePlan_Describe_1" name="RaisePlan_Describe_1" style="height: 100px" required></textarea>
		            <div id="PlanDescribeInfo_1" class="form-text">僅供審核，之後可增加、刪減、或修改。</div>
		        </div>
	        </div>
	        <div class="mb-3">
	            <label for="RaisePlan_Amount_2" class="form-label"><b>回饋選項金額（二）</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="RaisePlan_Amount_2" name="RaisePlan_Amount_2" aria-describedby="TargetInfo" placeholder="1000" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	        </div>
	         <div class="mb-3">
	            <label for="RaisePlan_PicName_2" class="form-label"><b>回饋選項照片（二）</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="RaisePlan_PicName_2" name="RaisePlan_PicName_2" required="required">
	        	<input type="hidden" id="RaisePlan_PicBase64_2" name="RaisePlan_PicBase64_2" value="">
	        </div>
	        <div class="mb-3" id="previewPicDiv_2"></div>
	        
	        <div class="mb-3">
	            <label for="RaisePlan_ADate_2" class="form-label"><b>回饋預計實現時間（二）</b></label><br>
	            <input type="date" id="RaisePlan_ADate_2" name="RaisePlan_ADate_2">
	        </div>
	        <div class="mb-3">
		        <label for="RaisePlan_Describe_2" class="form-label"><b>回饋選項內容說明（二）</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
		            <textarea class="form-control nBlank" id="RaisePlan_Describe_2" name="RaisePlan_Describe_2" style="height: 100px" required></textarea>
		            <div id="PlanDescribeInfo_2" class="form-text">僅供審核，之後可增加、刪減、或修改。</div>
		        </div>
	        </div>
	        
	        <br>
               <input type="hidden" name="donext" value="RaiseAdd">
               <button type="submit" class="btn btn-primary">Submit</button>
               <button type="button" id="idWriteAll" class="btn btn-secondary" onclick="writeAll()">一鍵輸入</button>
            <br>
            <br>
	    </form>    
	</div>
	
	<!-- 以下為script -->
	<script
	    src="https://code.jquery.com/jquery-3.6.0.js"
	    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	    crossorigin="anonymous">
	</script>
	<script>
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
		$("#Raise_SDate").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#Raise_SDate").attr("max",`\${yy+2}-12-31`);
		$("#Raise_SDate").attr("value",`\${yy}-\${mm}-\${dd}`);
		$("#Raise_ExpDate").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#Raise_ExpDate").attr("max",`\${yy+2}-12-31`);
		$("#Raise_ExpDate").attr("value",`\${yy}-\${mm1}-\${dd}`); //三個月後
		$("#RaisePlan_ADate_1").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#RaisePlan_ADate_1").attr("max",`\${yy+5}-12-31`);
		$("#RaisePlan_ADate_1").attr("value",`\${yy}-\${mm1}-\${dd}`);
		$("#RaisePlan_ADate_2").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#RaisePlan_ADate_2").attr("max",`\${yy+5}-12-31`);
		$("#RaisePlan_ADate_2").attr("value",`\${yy}-\${mm1}-\${dd}`);
		

		//必填欄位提醒
		$(".nBlank").blur(function(event){
			let theSpan = $(this).closest("div.mb-3").children("label").children("span");
			if($(this).val().length == 0){
				theSpan.text("必填");
			}else{
				theSpan.text("");
			}
		})
		
		//一鍵輸入
		function writeAll(){
			let rNum=Math.ceil(Math.random()*500);
			//$("#Raise_Title").prop("value",`計畫名稱\${rNum}`);
			$("#Raise_Title").attr("value",`計畫名稱\${rNum}`);
			$("#Raise_Breif").attr("value",`計畫簡述\${rNum}`);
			$("#Raise_Category option").removeAttr("selected");//若重複點選一鑑輸入，會導致超過一個被選取，因此先清空所有的selected
			$("#Raise_Category option").eq(Math.ceil(Math.random()*8)).attr("selected","selected");
			$("#Raise_Target").attr("value",Math.ceil(Math.random()*200000));
			$("#Raise_Describe").text(`計畫說明內容\${rNum}`);
			$("#RaisePlan_Amount_1").attr("value",Math.ceil(Math.random()*2000));
			$("#RaisePlan_Describe_1").text(`回饋選項內容說明\${rNum}`);
			$("#RaisePlan_Amount_2").attr("value",Math.ceil(Math.random()*2000));
			$("#RaisePlan_Describe_2").text(`回饋選項內容說明\${rNum}`);
		}
		
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
		
		/*拖曳功能留存，jQuery未增加跳脫字元
		// dragover事件：拖曳(滑鼠還沒鬆開)至放置區時，就要先防止瀏覽器進行開圖
		$("#dragArea").on("dragover", function(e) {
			e.preventDefault()
		})

		// 當拖曳區發生drop事件時，接受格式為image的資料
		$("#dragArea").on("drop", function(e){
			// 防止事件傳遞及預設事件發生
			e.stopPropagation()
			e.preventDefault()
			// 取得data type為image/*的資料
			e.originalEvent.dataTransfer.getData("image/*")
			let files = e.originalEvent.dataTransfer.files
			console.dir(files) // 看看File長什麼樣子
			$("#previewPicDiv").empty() // 清空當下預覽
			previewFiles(files)
		})
		*/
        
	</script>
</body>
</html>