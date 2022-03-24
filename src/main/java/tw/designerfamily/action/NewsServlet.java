package tw.designerfamily.action;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class NewsServlet
 */
@WebServlet("/NewsServlet")


public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		NewsDao dao= new NewsDao(session);
		List<NewsBean> list = dao.selectAll();
		request.getSession(true).setAttribute("list", list);
		response.sendRedirect("NewsIndex.jsp");		
	}
		
}
