package tw.designerfamily.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.designerfamily.util.HibernateUtil;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();

		request.setCharacterEncoding("UTF-8");
		response.setContentType(CONTENT_TYPE);

		String page;
		String todo = request.getParameter("todo");
		if (todo == null) {
			page = "index_admin.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		} else if (todo.equals("index")) {
			page = "index_admin.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		} else if (todo.equals("member")) {
			page = "member";
			response.sendRedirect(page);
		} else if (todo.equals("product")) {
			page = "ProductServlet"; // 之後換成commodity_admin.jsp
			request.getRequestDispatcher(page).forward(request, response);
		} else if (todo.equals("order")) {
			page = "OrderServlet"; // 之後換成order_admin.jsp
			request.getRequestDispatcher(page).forward(request, response);
		} else if (todo.equals("news")) {
			page = "NewsServlet"; // 之後換成coupon_admin.jsp
			request.getRequestDispatcher(page).forward(request, response);
		} else if (todo.equals("forum")) {
			page = "DiscussControllerServlet"; // 之後換成客服_admin.jsp
			request.getRequestDispatcher(page).forward(request, response);
		} else if (todo.equals("raise")) {
			page = "RaiseServlet"; // 之後換成raise_admin.jsp
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			page = "index_admin.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

}
