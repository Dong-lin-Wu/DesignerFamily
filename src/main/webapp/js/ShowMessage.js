/**
 * 
 <form action="" method="post"></form>
 編輯尚未完成
 */

setTimeout('window.location.reload()',10000);
msg_end.scrollIntoView({ block: "end" });
let right_texts=document.querySelectorAll(".sp_right_text");
for(let text of right_texts){
	text.addEventListener("dblclick",dblclick);
}
function dblclick(){
	let theID=$(this)[0].id.substring(10)
	if($(this).next().html() != null){
		$(this).next().empty();	
	}
	$(this).next().append(`<a href='' class='update${theID}'>編輯</a>`)
				  .append(`<a href='ChatDeleteServlet?id=${theID}'>收回</a>`)
				  .append(`<a href=''>取消</a>`);
	
}