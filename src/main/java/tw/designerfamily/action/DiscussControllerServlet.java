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

import org.hibernate.Session;


import tw.designerfamily.model.ForumBean;
import tw.designerfamily.model.ForumDao;
import tw.designerfamily.model.Member;
import tw.designerfamily.util.HibernateUtil;



@WebServlet("/DiscussControllerServlet")
public class DiscussControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";  
	
	DataSource ds;

	private String forumUpdate_time;
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {	//當servlet物件產生之後 先執行init(ServletConfig config)4-86		
		super.init(config);		
	}	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);  // Same as doGet()
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
	    
	    response.setHeader("Cache-Control","no-cache");
	    response.setHeader("Pragma","no-cache");
	    response.setDateHeader ("Expires", -1); 
	    String nextPage = "";
	    String nextto = request.getParameter("nextto");
	 
	      
	    	if (nextto == null) {
	         
	    	nextPage = "Forum.jsp";
	    	redirectForum(request, response);

	      } else if (nextto.equals("add")) {	    	  
	    	  nextPage = "ForumAdd.jsp";	
	    	  
	      }else if (nextto.equals("forum")) {   	  
	    	  nextPage = "Forum.jsp";
	    	  redirectForum(request, response);
	      }
	      else if (nextto.equals("Forumadd")) {   	  
	    	  nextPage = "Forum.jsp";
	    	  gotoAddForumProcess(request, response);
	    	  redirectForum(request, response);
	    	  
	      }else if (nextto.equals("ForumDelete")) {
			gotoForumDeleteProcess(request,response);
			nextPage = "Forum.jsp";
			redirectForum(request, response);
			
	      }else if (nextto.equals("ForumEdit")) {
	    	gotoEditForumProcess(request, response);
			nextPage = "Forum.jsp";
			redirectForum(request, response);
		    
	      }else if (nextto.equals("ForumSearch")) {
				nextPage = "Forum.jsp";
				gotosearchForumProcess(request, response);			    
	      }	    
	    	response.sendRedirect(nextPage);
	}
	
	public void redirectForum (HttpServletRequest request, HttpServletResponse response) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		ForumDao fDao = new ForumDao(session);
		List<ForumBean> dlist = fDao.selectAll();
		request.getSession(true).setAttribute("disList", dlist);
	}
	//新增討論
	public void gotoAddForumProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	  {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	    String forumSubject;
	    String forumDescription;
	    String forumCategory;	   
//	    String paccount = (String) request.getSession(true).getAttribute("login.account");
	    forumSubject = request.getParameter("Dis_Title").trim();	   
	    forumDescription = request.getParameter("Dis_Descri").trim();	    
	    Member m = (Member) request.getSession(true).getAttribute("login");
	    String forumAccount = m.getAccount();
//	    String forumAccount = "qqq123";
	    forumCategory = request.getParameter("Dis_Category");

	    
	    ForumBean fBean =  new ForumBean(forumSubject, forumDescription, forumAccount, forumCategory);
	    ForumDao fDao = new ForumDao(session);
	    fDao.insert(fBean);
	  }
	//刪除討論
	public void gotoForumDeleteProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();		
		String forumid = request.getParameter("id");
		ForumDao fDao = new ForumDao(session);
		fDao.delete(Integer.parseInt(forumid));	        										
	}
	
	//修改討論
	public void gotoEditForumProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();		
		int forumid = Integer.parseInt(request.getParameter("edit"));				
	    String forumSubject = request.getParameter("Dis_Subject");
	    String forumDescription = request.getParameter("Dis_Descri");
	    String forumCategory = request.getParameter("Dis_Category");
	    
	    ForumDao fDao = new ForumDao(session);
	    ForumBean oBean = fDao.selectById(forumid);//先從原本的Bean取得ID，
	    String forumCreate_time = oBean.getForumCreate_time();//取得ForumCreate_time
	    String forumAccount = oBean.getForumAccount();//取得ForumAccount
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String forumUpdate_time = simpleDateFormat.format(now);
	    
	    session.clear();
	    
	    ForumBean fBean = new ForumBean(forumid, forumSubject, forumDescription, forumCreate_time, forumUpdate_time, forumAccount, forumCategory);
	    fDao.update(fBean);

	}
	
	//主題查詢討論
	public void gotosearchForumProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();				
		String forumSubject = request.getParameter("search");	
		ForumDao fDao = new ForumDao(session);
		List<ForumBean> dlist = fDao.selectBySubject(forumSubject);
		request.getSession(true).setAttribute("disList", dlist);    										
	}		
	
}      
	      
      
