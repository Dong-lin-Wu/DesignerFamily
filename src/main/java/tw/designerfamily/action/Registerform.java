package tw.designerfamily.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.designerfamily.model.Member;
import tw.designerfamily.model.MemberService;
import tw.designerfamily.model.Status;

@Controller
@SessionAttributes("login")
public class Registerform {

	@Autowired
	private MemberService mService;

	@RequestMapping(path = "/registerform", method = RequestMethod.GET)
	public String processMainAction() {
		return "registerform";
	}

	@RequestMapping(path = "/checkregisterform", method = RequestMethod.POST)
	public String processAction(HttpServletRequest request, Model m) {

		String account = request.getParameter("account");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthdayString = request.getParameter("birthday");
		String photo = request.getParameter("photoBase64");
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		String statusString = request.getParameter("statusId");
		String statusName = request.getParameter("statusName");
		String[] customCheck1 = request.getParameterValues("customCheck1");

		if ((account != null && !account.isEmpty()) && (email != null && !email.isEmpty())
				&& (password != null && !password.isEmpty()) && (passwordCheck != null && !passwordCheck.isEmpty())
				&& (phone != null && !phone.isEmpty()) && customCheck1[0].equals("checkbox")) {
			Timestamp birthday = null;
			if (birthdayString != null && !birthdayString.isEmpty()) {
				String[] birthdayArray = birthdayString.split(" ");
				birthdayString = birthdayArray[2] + "-" + birthdayArray[1] + "-" + birthdayArray[0];
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MMMM-dd", Locale.US);
				Date date = null;
				try {
					date = dateFormat.parse(birthdayString);
					birthday = new Timestamp(date.getTime());
				} catch (ParseException e) {
				}
			}
			int statusId = Integer.valueOf(statusString);

			Member mSQL = mService.selectRegister(phone, account, email);

			if (mSQL == null && phone.matches("^09\\d{8}$") && password.equals(passwordCheck)) {
				Member m1 = new Member(account, password, name, email, phone, gender, birthday, photo, registerTime,
						statusId);
				Status s = new Status(statusId, statusName);

				m1.setStatus(s);

				Set<Member> member = new HashSet<Member>();
				member.add(m1);
				s.setMember(member);

				mService.insert(m1, s);

				m1 = new Member(m1.getAccount(), m1.getEmail(), m1.getPhone(), m1.getGender(), m1.getBirthday(),
						m1.getRegisterTime(), m1.getStatus());

				if (request.getSession(false) != null) {
					request.changeSessionId();
				}
				m.addAttribute("login", m1);
				return "redirect:/user";
			} else {
				m.addAttribute("errors", Arrays.asList("註冊失敗"));
				return "registerform";
			}
		} else {
			m.addAttribute("errors", Arrays.asList("註冊失敗"));
			return "registerform";
		}
	}

}
