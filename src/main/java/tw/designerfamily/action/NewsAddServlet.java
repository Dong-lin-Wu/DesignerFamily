package tw.designerfamily.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import tw.designerfamily.model.NewsBean;
import tw.designerfamily.model.NewsDao;
import tw.designerfamily.util.HibernateUtil;

/**
 * Servlet implementation class NewsAddServlet
 */
@WebServlet("/NewsAddServlet")
public class NewsAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsAddServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
			
		String NewsType=request.getParameter("NewsType");
		String NewsTitle=request.getParameter("NewsTitle");
		String NewsSubtitle=request.getParameter("NewsSubtitle");
		Timestamp NewsDate = new Timestamp(System.currentTimeMillis());
		String NewsContent=request.getParameter("NewsContent");
//		Part Image= request.getPart("NewsImagePath");
//		String ImagePath = path(Image);
//		String NewsImagePath=request.getParameter("NewsImagePath");  錯誤寫法
		String NewsNote=request.getParameter("NewsNote");
		
		if(NewsTitle.equals("")||NewsContent.equals("")) {
			if(NewsTitle.equals("")) {
				request.getSession().setAttribute("NewsError1", "標題不能空白");
			}
			if(NewsContent.equals("")) {
				request.getSession().setAttribute("NewsError2", "內容不能空白");
			}
			request.getSession().setAttribute("NewsError", "新增失敗");
			response.sendRedirect("NewsAdd.jsp");
		}else {
			NewsBean news=new NewsBean(NewsType,NewsTitle,NewsSubtitle,NewsDate,NewsContent,NewsNote);
			NewsDao newsDao = new NewsDao(session);
			try {
				newsDao.insert(news);
				response.sendRedirect("NewsServlet");		
				
			}catch(Exception e) {
				request.getSession().setAttribute("NewsError", "新增失敗");
				response.sendRedirect("NewsServlet");	
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
//	圖片處理
//	private String path(Part photo) {
//		try {
//			String submittedFileName = photo.getSubmittedFileName();
//			String ext = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
//			String filename = String.format("%s%s", Instant.now().toEpochMilli(), ext);
//			photo.write(filename);
//			return filename;
//		} catch (Exception e) {
//			return null;
//		}	
//	}


}
