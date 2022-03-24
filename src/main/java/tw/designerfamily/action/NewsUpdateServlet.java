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
 * Servlet implementation class NewsUpdateServlet
 */
@WebServlet("/NewsUpdateServlet")
public class NewsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsUpdateServlet() {
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
		
		
		if(request.getParameter("donext")==null) {  
			
		}else if(request.getParameter("donext").equals("NewsUpdate")) {		//對應NewsIndex.jsp的 <form> --> <input> 第60行
			String id = request.getParameter("id");		//取得選取欄位的id值
			NewsDao dao1 = new NewsDao(session);
			NewsBean n = dao1.selectById(Integer.parseInt(id));	
			request.setAttribute("n", n);
			request.getRequestDispatcher("NewsUpdate.jsp").forward(request, response);		//匯入欄位資料至jsp表單
			
		}else if(request.getParameter("donext").equals("doUpdate")){	//對應NewsUpdate.jsp的 <form> --> <input> 第88行
			int NewsId = Integer.parseInt(request.getParameter("NewsId"));
			String NewsType = request.getParameter("NewsType");
			String NewsTitle = request.getParameter("NewsTitle");
			String NewsSubtitle = request.getParameter("NewsSubtitle");
			Timestamp NewsDate = new Timestamp(System.currentTimeMillis());
			String NewsContent=request.getParameter("NewsContent");
//			Part Image= request.getPart("NewsImagePath");
//			String ImagePath = path(Image);
			String NewsNote = request.getParameter("NewsNote");
			
			if(NewsTitle.equals("")||NewsContent.equals("")) {
				if(NewsTitle.equals("")) {
					request.getSession().setAttribute("NewsError1", "標題不能空白");
				}
				if(NewsContent.equals("")) {
					request.getSession().setAttribute("NewsError2", "內容不能空白");
				}
				request.getSession().setAttribute("NewsError", "修改失敗");
				response.sendRedirect("NewsUpdate.jsp");
//				request.getRequestDispatcher("NewsUpdate.jsp").forward(request, response);

				
			}else {
				NewsBean n=new NewsBean(NewsType,NewsTitle,NewsSubtitle,NewsDate,NewsContent,NewsNote);
				n.setNewsId(NewsId);
				NewsDao dao = new NewsDao(session);
				try {
					dao.update(n);
					response.sendRedirect("NewsServlet");
//					request.getRequestDispatcher("NewsUpdate.jsp").forward(request, response);
					
				}catch (Exception e) {
					request.getSession().setAttribute("NewsError", "修改失敗");
					response.sendRedirect("NewsUpdate.jsp");
//					request.getRequestDispatcher("NewsUpdate.jsp").forward(request, response);
					
				}
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
