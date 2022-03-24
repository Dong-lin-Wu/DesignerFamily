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
 * Servlet implementation class NewsSearchServlet
 */
@WebServlet("/NewsSearchServlet")
public class NewsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsSearchServlet() {
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
		
		String keyword = request.getParameter("keyword");
		NewsDao newsdao = new NewsDao(session);
        List<NewsBean> list = newsdao.searchByKey(keyword);
        request.setAttribute("list", list);
        request.getRequestDispatcher("NewsIndex.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
