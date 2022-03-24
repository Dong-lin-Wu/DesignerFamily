package tw.designerfamily.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.designerfamily.model.Member;
import tw.designerfamily.model.MemberService;
import tw.designerfamily.util.HibernateUtil;

@WebServlet("/login")
public class Login extends HttpServlet {

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

		String account = request.getParameter("account");
		String password = request.getParameter("password");

		MemberService mService = new MemberService(session);
		List<Member> list = mService.selectLogin(account, password);
		String page;
		if (!list.isEmpty()) {
			Member m = list.get(0);
			if (password.equals(m.getPassword()) && m.getStatus().getStatusId() == 9) {
				if (request.getSession(false) != null) {
					request.changeSessionId();
				}
				request.getSession().setAttribute("login", m);
				page = "admin";
				response.sendRedirect(page);
			} else if (password.equals(m.getPassword()) && m.getStatus().getStatusId() == 8) {
				if (request.getSession(false) != null) {
					request.changeSessionId();
				}
				request.getSession().setAttribute("login", m);
				page = "admin";
				response.sendRedirect(page);
			}
		} else {
			request.setAttribute("errors", Arrays.asList("登入失敗"));
			page = "login.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

}
