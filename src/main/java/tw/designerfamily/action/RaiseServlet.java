package tw.designerfamily.action;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import tw.designerfamily.model.IRaiseBeanService;
import tw.designerfamily.model.Member;
import tw.designerfamily.model.RaiseBean;
import tw.designerfamily.model.RaiseBeanService;
import tw.designerfamily.model.RaisePlanBean;
import tw.designerfamily.util.HibernateUtil;



/**
 * @ClassName: RaiseServlet
 * @Author: Donglin
 * @Description:
 * @Date: 2022/3/17
 */
//@WebServlet("/RaiseServlet")
public class RaiseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		
		// To prevent caching
		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
		
		String nextPage = "";
		String donext = request.getParameter("donext");
		if (donext==null){
			nextPage = "Raise.jsp";
			redirectRaise(request, response);
		} else if (donext.equals("RaiseAdd")) {
			gotoRaiseAddProcess(request, response);
			nextPage = "RaiseServlet";
		} else if (donext.equals("RaiseReview")) {
			gotoRaiseReviewProcess(request, response);
			nextPage = "RaiseServlet";
		} else if (donext.equals("RaiseUpdate")) {
			gotoRaiseUpdateProcess(request, response);
			nextPage = "RaiseServlet";
		} else if (donext.equals("RaiseSearch")) {
			gotoRaiseSearchProcess(request, response);
			nextPage = "Raise.jsp";//查詢已有list放入Session
		} else if (donext.equals("RaiseDelete")) {
			gotoRaiseDeleteProcess(request,response);
			nextPage = "RaiseServlet";
		}

		response.sendRedirect(nextPage);
	}
	@Autowired
	private IRaiseBeanService rService;
	
	public void redirectRaise(HttpServletRequest request, HttpServletResponse response) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		RaiseBeanService rService = new RaiseBeanService();
		List<RaiseBean> rlist = rService.selectAll();
		request.getSession(true).setAttribute("raiseList", rlist);
	}
	
	public void gotoRaiseAddProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Member m = (Member) request.getSession(true).getAttribute("login");
		String pName;
		if(m != null) {
			pName = m.getAccount();	
		}else {
			pName = "吳東霖";
		}
		String pTitle = request.getParameter("Raise_Title").trim();
		String pBreif = request.getParameter("Raise_Breif").trim();
		String pCategory = request.getParameter("Raise_Category").trim();
		String pPicName = request.getParameter("Raise_PicName");
		String pPicBase64 = request.getParameter("Raise_PicBase64");
		int pTarget;
		try {
			pTarget = Integer.parseInt(request.getParameter("Raise_Target"));
		} catch (NumberFormatException e) {
			pTarget=0;
			System.out.println("新增資料時，目標金額轉換INT有誤!");
		}
		String pSDate = request.getParameter("Raise_SDate");
		String pExpDate = request.getParameter("Raise_ExpDate");
		String pDescribe = request.getParameter("Raise_Describe");
		//回饋項目
		int pAmount1;
		try {
			pAmount1 = Integer.parseInt(request.getParameter("RaisePlan_Amount_1"));
		} catch (NumberFormatException e) {
			pAmount1=0;
			System.out.println("新增資料時，回饋項目一金額轉換INT有誤!");
		}
		String pPicName1 = request.getParameter("RaisePlan_PicName_1");
		String pPicBase64_1 = request.getParameter("RaisePlan_PicBase64_1");
		String pADate1 = request.getParameter("RaisePlan_ADate_1");
		String pDescribe1 = request.getParameter("RaisePlan_Describe_1");
		
		int pAmount2;
		try {
			pAmount2 = Integer.parseInt(request.getParameter("RaisePlan_Amount_2"));
		} catch (NumberFormatException e) {
			pAmount2=0;
			System.out.println("新增資料時，回饋項目一金額轉換INT有誤!");
		}
		String pPicName2 = request.getParameter("RaisePlan_PicName_2");
		String pPicBase64_2 = request.getParameter("RaisePlan_PicBase64_2");
		String pADate2 = request.getParameter("RaisePlan_ADate_2");
		String pDescribe2 = request.getParameter("RaisePlan_Describe_2");		
		
		RaiseBean rBean = new RaiseBean(pName, pTitle, pBreif, pCategory, pPicName, pPicBase64, pTarget, pSDate, pExpDate, pDescribe);
		RaisePlanBean rPBean1 = new RaisePlanBean(pPicName1, pPicBase64_1, pAmount1, pADate1, pDescribe1);
		rPBean1.setRaiseBean(rBean);
		RaisePlanBean rPBean2 = new RaisePlanBean(pPicName2, pPicBase64_2, pAmount2, pADate2, pDescribe2);
		rPBean2.setRaiseBean(rBean);
		
		Set<RaisePlanBean> rpBeans = new LinkedHashSet<RaisePlanBean>();
		rpBeans.add(rPBean1);
		rpBeans.add(rPBean2);
		
		rBean.setRaisePlanBeanSet(rpBeans);
		
		RaiseBeanService rService = new RaiseBeanService();
		rService.insert(rBean);			
	}
	
	public void gotoRaiseReviewProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int pId = Integer.parseInt(request.getParameter("rID"));
		String pTitle = request.getParameter("rComment");
		RaiseBeanService rService = new RaiseBeanService();
		rService.updateStatus(pId, pTitle);
	}
	
	public void gotoRaiseUpdateProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int pId = Integer.parseInt(request.getParameter("rID"));
		Member m = (Member) request.getSession(true).getAttribute("login");
		String pName;
		if(m != null) {
			pName = m.getAccount();	
		}else {
			pName = "吳東霖";
		}
		String pTitle = request.getParameter("Raise_Title").trim();
		String pBreif = request.getParameter("Raise_Breif").trim();
		String pCategory = request.getParameter("Raise_Category").trim();
		String pPicName = request.getParameter("Raise_PicName_default");
		System.out.println("picname= "+pPicName);
		String pPicBase64 = request.getParameter("Raise_PicBase64");
		int pTarget;
		try {
			pTarget = Integer.parseInt(request.getParameter("Raise_Target"));
		} catch (NumberFormatException e) {
			pTarget=0;
			System.out.println("修改資料時，目標金額轉換INT有誤!");
		}
		String pSDate = request.getParameter("Raise_SDate");
		String pExpDate = request.getParameter("Raise_ExpDate");
		String pDescribe = request.getParameter("Raise_Describe");
		RaiseBeanService rService = new RaiseBeanService();
		RaiseBean oBean = rService.selectById(pId);
//		RaiseBean oBean = session.get(RaiseBean.class, pId);
		String pStatus = oBean.getRaiseStatus();
		
//		session.clear(); 沒有clear應該會出問題!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		RaiseBean rBean = new RaiseBean(pId, pName, pTitle, pBreif, pCategory, pPicName, pPicBase64, pTarget, pSDate, pExpDate, pDescribe, pStatus);
		
		//回饋項目
		int pId1 = Integer.parseInt(request.getParameter("rpId1"));
		int pAmount1;
		try {
			pAmount1 = Integer.parseInt(request.getParameter("RaisePlan_Amount_1"));
		} catch (NumberFormatException e) {
			pAmount1=0;
			System.out.println("新增資料時，回饋項目一金額轉換INT有誤!");
		}
		String pPicName1 = request.getParameter("Raise_PicName_default_1");
		String pPicBase64_1 = request.getParameter("RaisePlan_PicBase64_1");
		String pADate1 = request.getParameter("RaisePlan_ADate_1");
		String pDescribe1 = request.getParameter("RaisePlan_Describe_1");
		
		int pId2 = Integer.parseInt(request.getParameter("rpId2"));
		int pAmount2;
		try {
			pAmount2 = Integer.parseInt(request.getParameter("RaisePlan_Amount_2"));
		} catch (NumberFormatException e) {
			pAmount2=0;
			System.out.println("新增資料時，回饋項目一金額轉換INT有誤!");
		}
		String pPicName2 = request.getParameter("RaisePlan_PicName_default_2");
		String pPicBase64_2 = request.getParameter("RaisePlan_PicBase64_2");
		String pADate2 = request.getParameter("RaisePlan_ADate_2");
		String pDescribe2 = request.getParameter("RaisePlan_Describe_2");		
		
		RaisePlanBean rPBean1 = new RaisePlanBean(pId1, pPicName1, pPicBase64_1, pAmount1, pADate1, pDescribe1);
		rPBean1.setRaiseBean(rBean);
		RaisePlanBean rPBean2 = new RaisePlanBean(pId2, pPicName2, pPicBase64_2, pAmount2, pADate2, pDescribe2);
		rPBean2.setRaiseBean(rBean);
		
		Set<RaisePlanBean> rpBeans = new LinkedHashSet<RaisePlanBean>();
		rpBeans.add(rPBean1);
		rpBeans.add(rPBean2);
		
		rBean.setRaisePlanBeanSet(rpBeans);
		
//		RaiseBeanService rService = new RaiseBeanService(session);
		rService.update(rBean);		
	}
	
	public void gotoRaiseSearchProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		String key = request.getParameter("Raise_Search");
		RaiseBeanService rService = new RaiseBeanService();
	    List<RaiseBean> rlist = rService.searchByKey(key);
	    request.getSession(true).setAttribute("raiseList", rlist);								
	}
	
	public void gotoRaiseDeleteProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		String id = request.getParameter("rID");
		RaiseBeanService rService = new RaiseBeanService();
	    rService.deleteById(Integer.parseInt(id));
										
	}
	
	
	
	
}
