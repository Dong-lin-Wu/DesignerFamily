package tw.designerfamily.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tw.designerfamily.model.Member;
import tw.designerfamily.model.MemberService;
import tw.designerfamily.model.Status;
import tw.designerfamily.util.HibernateUtil;

@WebServlet("/registerform")
public class Registerform extends HttpServlet {

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
		String passwordCheck = request.getParameter("passwordCheck");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String birthdayString = request.getParameter("birthday");
		String photo = request.getParameter("photoBase64");
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		String statusString = request.getParameter("statusId");
		String statusName = request.getParameter("statusName");

		Timestamp birthday = null;
		if (birthdayString.matches("^\\d{4}\\-\\d{2}\\-\\d{2}$")) {
			birthdayString = birthdayString + " 00:00:00";
			birthday = Timestamp.valueOf(birthdayString);
		}
		int statusId = Integer.valueOf(statusString);

		MemberService mService = new MemberService(session);
		List<Member> list = mService.selectRegister(phone, account, email);
		String page;
		if (list.isEmpty() && phone.matches("^09\\d{8}$") && password.equals(passwordCheck)) {
			Member m = new Member(account, password, name, email, phone, gender, birthday, photo, registerTime,
					statusId);
			Status s = new Status(statusId, statusName);

			m.setStatus(s);

			Set<Member> member = new HashSet<Member>();
			member.add(m);
			s.setMember(member);

			mService.insert(m, s);

			if (request.getSession(false) != null) {
				request.changeSessionId();
			}
			request.getSession().setAttribute("login", m);
			page = "admin";
			response.sendRedirect(page);
		} else {
			request.setAttribute("errors", Arrays.asList("註冊失敗"));
			page = "registerform.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

}
