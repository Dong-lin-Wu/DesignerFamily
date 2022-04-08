<%@page import="tw.designerfamily.model.ForumBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,  tw.designerfamily.model.ForumBean  "  %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Update Forum</title>
<style>
span {
            font-size: 13px;
            
            font-style: italic;
        }
        </style>
</head>
<body>
<div class='container'>
<h2 style="margin-top:20px"></h2>
	
	 <form name="homepage" action="forum_backend.controller" method="get">
         <input type="hidden" name="nextto" value="forum">         
         <input type="submit" class="btn btn-info" value="回討論區首頁">
      </form>
      
      <hr />
	<h3 style="margin-top:20px">修改討論</h3>
				<form action="forum_backend_edit.controller" method="POST">
				
				<div class="mb-3">
					  <label for="Dis_Category" class="form-label">類別</label>
					  <select id="Dis_Category" name="Dis_Category" class="form-select" aria-label="Default select example" aria-describedby="CategoryInfo">
						  <option ${disList[param.id].forumCategory == '音樂' ? 'selected' : ''}>音樂</option>
						  <option ${disList[param.id].forumCategory == '攝影' ? 'selected' : ''}>攝影</option>
						  <option ${disList[param.id].forumCategory == '時尚' ? 'selected' : ''}>時尚</option>
						  <option ${disList[param.id].forumCategory == '設計' ? 'selected' : ''}>設計</option>	
						  <option ${disList[param.id].forumCategory == '遊戲' ? 'selected' : ''}>遊戲</option>
						  <option ${disList[param.id].forumCategory == '飲食' ? 'selected' : ''}>飲食</option>
						  <option ${disList[param.id].forumCategory == '教育' ? 'selected' : ''}>教育</option>
						  <option ${disList[param.id].forumCategory == '科技' ? 'selected' : ''}>科技</option>
						  <option ${disList[param.id].forumCategory == '藝術' ? 'selected' : ''}>藝術</option>
					  </select>
					  <div id="CategoryInfo" class="form-text">請選擇類別。</div>
				  </div>
				
				  <div class="mb-3">
				      <label for="Dis_Title" class="form-label">主題</label>
				      <input type="text" class="form-control" id="Dis_Title" name="Dis_Subject" value="${disList[param.id].forumSubject}" required="required">
				      <span id="idspn"></span>				      
				  </div>
				  
				  <div class="mb-3">
				      <label for="Dis_Descri" class="form-label">內容</label>
				      <textarea class="form-control" id="Dis_Descri" name="Dis_Descri"rows="10" required>${disList[param.id].forumDescription}</textarea>
				      <span id="idspd"></span><br/>
				  </div>
			  
				  <input type="hidden" name="nextto" value="ForumEdit">
				  <input type="hidden" name="edit" value="${disList[param.id].forumid}">
				 
				  <button type="submit" class="btn btn-primary">提交</button>
				</form>
			</div> 
     
<script src="js/DiscussAdd.js"></script> 
</body>
</html>