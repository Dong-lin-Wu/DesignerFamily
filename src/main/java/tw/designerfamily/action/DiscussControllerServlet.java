package tw.designerfamily.action;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.designerfamily.model.ForumBean;
import tw.designerfamily.model.ForumDao;
import tw.designerfamily.model.IForumService;




@Controller
@SessionAttributes({ "disList",}) //設定@SessionAttributes可以跨多頁
public class DiscussControllerServlet {
	
	private String forumUpdate_time;
	
	@Autowired
	private IForumService iService;
	
	//顯示所有 方法
	public void redirectToForum(Model m) {
		List<ForumBean> flist = iService.selectAll();
		m.addAttribute("disList", flist);
	}
	
	//到首頁+顯示全部
	@RequestMapping(path = "/forum_backend.controller", method = RequestMethod.GET) 
	public String processMainAction(Model m) {
		redirectToForum(m);		
		return "Forum";		
	}
	//到新增頁面
		@RequestMapping(path = "/forum_backend_gotoinsert.controller", method = RequestMethod.POST) 
		public String processMainAction1(Model m) {	
			return "ForumAdd";		
		}
		
	//到修改頁面
		@RequestMapping(path = "/forum_backend_gotoedit.controller", method = RequestMethod.POST) 
		public String processMainAction2(Model m) {	
			return "ForumEdit";		
		}
		
	//到首頁+不顯示全部
		@RequestMapping(path = "/forum_backend_search.controller", method = RequestMethod.GET) 
		public String processMainAction3(Model m) {					
			return "Forum";		
		}
			
	
	//新增討論
	@RequestMapping(path = "/forum_backend_insert.controller", method = RequestMethod.POST)
	public String processInsert(
			@RequestParam("Dis_Title") String Dis_Title,
			@RequestParam("Dis_Descri") String Dis_Descri,
			@RequestParam("Dis_Category") String Dis_Category,
			Model m)
	{
		
//    String paccount = (String) request.getSession(true).getAttribute("login.account");    
//    Member m = (Member) model.getAttribute("login");
//    String forumAccount = m.getAccount();
//    String pName;
//	if (m != null) {
//		pName = m.getAccount();
//	} else {
//		pName = "Guest";
//	}
		
    String forumAccount = "qqq123";    
    ForumBean fBean =  new ForumBean(Dis_Title, Dis_Descri, forumAccount, Dis_Category);  
//    System.out.println(fBean);
//    System.out.println(fBean.getForumUpdate_time());
//    System.out.println(fBean.getForumCategory());

    iService.insert(fBean);
    redirectToForum(m);
    return "redirect: forum_backend.controller"; //redirect可以避免refresh後重複執行
	}
	
	
	
		  
	//刪除討論
	@RequestMapping(path = "/forum_backend_delete.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam("forumid") int forumid, Model m) {
		iService.selectById(forumid);
		iService.delete(forumid);
		System.out.println(forumid);
		redirectToForum(m);
	    return "redirect: forum_backend.controller";
	}
	
	
	//修改討論
	@RequestMapping(path = "/forum_backend_edit.controller", method = RequestMethod.POST)
	public String processUpdate(
//			@RequestParam("forumid") int forumid,
			@RequestParam("edit") int forumid,
			@RequestParam("Dis_Subject") String Dis_Subject,
			@RequestParam("Dis_Descri") String Dis_Descri,
			@RequestParam("Dis_Category") String Dis_Category,
			Model m,
			SessionStatus status){
	   
	    ForumBean oBean = iService.selectById(forumid);//先從原本的Bean取得ID，
	    String forumCreate_time = oBean.getForumCreate_time();//取得ForumCreate_time
	    String forumAccount = oBean.getForumAccount();//取得ForumAccount
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String forumUpdate_time = simpleDateFormat.format(now);
		System.out.println(forumUpdate_time);
	    
//		status.setComplete();
	    
	    ForumBean fBean = new ForumBean(forumid, Dis_Subject, Dis_Descri, forumCreate_time, forumUpdate_time, forumAccount, Dis_Category);
	    iService.update(fBean);
	    System.out.println("fBean:"+fBean.getForumid()+" "+fBean.getForumSubject());
	    redirectToForum(m);
	    return "redirect: forum_backend.controller";
	}
	
	
	
	//主題查詢
		@RequestMapping(path = "/forum_backend_gotosearch.controller", method = RequestMethod.POST)
		public String processSearch(@RequestParam("keyword") String forum_search, Model m) {
			
			List<ForumBean> flist = iService.selectBySubject(forum_search);
			m.addAttribute("disList", flist);
			return "redirect: forum_backend_search.controller";
		}
	
}      
	      
      
