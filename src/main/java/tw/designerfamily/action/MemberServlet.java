package tw.designerfamily.action;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
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

@WebServlet("/member")
public class MemberServlet extends HttpServlet {

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

		MemberService mService = new MemberService(session);
		String todo = request.getParameter("todo");
		if (todo == null) {
			List<Member> list = mService.selectAll();

			request.setAttribute("members", list);
			request.getRequestDispatcher("member_admin.jsp").forward(request, response);
		} else if (todo.equals("select")) {
			String keyword = request.getParameter("keyword");
			List<Member> list = mService.selectByPhoneAccountEmail(keyword);

			request.setAttribute("members", list);
			request.getRequestDispatcher("member_admin.jsp").forward(request, response);
		} else if (todo.equals("insert")) {
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
			String[] statusString = request.getParameter("statusId").split(",");

			Timestamp birthday = null;
			if (birthdayString.matches("^\\d{4}\\-\\d{2}\\-\\d{2}$")) {
				birthdayString = birthdayString + " 00:00:00";
				birthday = Timestamp.valueOf(birthdayString);
			}
			int statusId = Integer.valueOf(statusString[0]);
			String statusName = statusString[1];

			List<Member> list = mService.selectRegister(phone, account, email);

			try {
				if (list.isEmpty() && phone.matches("^09\\d{8}$") && password.equals(passwordCheck)) {
					Member m = new Member(account, password, name, email, phone, gender, birthday, photo, registerTime,
							statusId);
					Status s = new Status(statusId, statusName);

					m.setStatus(s);

					Set<Member> member = new HashSet<Member>();
					member.add(m);
					s.setMember(member);

					mService.insert(m, s);
				} else {
					throw new SQLException();
				}
			} catch (Exception e) {
				request.getSession().setAttribute("error", "新增失敗");
			}
			response.sendRedirect("admin?todo=member");
		} else if (todo.equals("update")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String passwordCheck = request.getParameter("passwordCheck");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String birthdayString = request.getParameter("birthday");
			String photo = request.getParameter("photoBase64");
			String[] statusString = request.getParameter("statusId").split(",");

			Member mSQL = mService.selectById(id);

			if (!phone.matches("^09\\d{8}$")) {
				phone = mSQL.getPhone();
			}
			Timestamp birthday = null;
			if (birthdayString.matches("^\\d{4}\\-\\d{2}\\-\\d{2}$")) {
				birthdayString = birthdayString + " 00:00:00";
				birthday = Timestamp.valueOf(birthdayString);
			}
			if (photo == null || photo.isEmpty()) {
				photo = mSQL.getPhoto();
			}
			Timestamp registerTime = mSQL.getRegisterTime();
			int statusId = Integer.valueOf(statusString[0]);
			String statusName = statusString[1];

			if (password.equals(passwordCheck)) {
				Member m = new Member(id, account, password, name, email, phone, gender, birthday, photo, registerTime,
						statusId);
				Status s = new Status(statusId, statusName);

				m.setStatus(s);

				mService.update(m);
			}
			response.sendRedirect("admin?todo=member");
		} else if (todo.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));

			mService.delete(id);

			response.sendRedirect("admin?todo=member");
		}
	}

}
