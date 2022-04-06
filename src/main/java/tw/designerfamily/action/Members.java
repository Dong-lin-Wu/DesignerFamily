package tw.designerfamily.action;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.model.Member;
import tw.designerfamily.model.MemberService;
import tw.designerfamily.model.Status;

@Controller
public class Members {

	@Autowired
	private MemberService mService;

	@RequestMapping(path = "/members", method = RequestMethod.GET)
	public String processMainAction(Model m) {

		List<Member> list = mService.selectAll();
		m.addAttribute("members", list);
		return "member_admin";
	}

	@RequestMapping(path = "/members.select", method = RequestMethod.POST)
	public String processSelectAction(@RequestParam("keyword") String keyword, Model m) {

		List<Member> list = mService.selectByPhoneAccountEmail(keyword);
		m.addAttribute("members", list);
		return "member_admin";
	}
	
	@RequestMapping(path = "/members.insert", method = RequestMethod.GET)
	public String processAction() {
		return "member_insert_admin";
	}

	@RequestMapping(path = "/members.checkinsert", method = RequestMethod.POST)
	public String processInsertAction(HttpServletRequest request, Model m) {

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

		if ((account != null && !account.isEmpty()) && (email != null && !email.isEmpty())
				&& (password != null && !password.isEmpty()) && (passwordCheck != null && !passwordCheck.isEmpty())
				&& (phone != null && !phone.isEmpty())) {
			try {
				Timestamp birthday = null;
				if (birthdayString != null && !birthdayString.isEmpty()) {
					String[] birthdayArray = birthdayString.split(" ");
					birthdayString = birthdayArray[2] + "-" + birthdayArray[1] + "-" + birthdayArray[0];
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MMMM-dd", Locale.US);
					Date date = dateFormat.parse(birthdayString);
					birthday = new Timestamp(date.getTime());
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
				} else {
					throw new SQLException();
				}
				return "redirect:/members";
			} catch (Exception e) {
				m.addAttribute("error", "新增失敗");
				return "member_insert_admin";
			}
		}else {
			m.addAttribute("error", "新增失敗");
			return "member_insert_admin";
		}
	}

	@RequestMapping(path = "/members.update", method = RequestMethod.POST)
	public String processUpdateAction(HttpServletRequest request, Model m) {

		int id = Integer.parseInt(request.getParameter("id"));
		String account = request.getParameter("account");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthdayString = request.getParameter("birthday");
		String photo = request.getParameter("photoBase64");
		String[] statusString = request.getParameter("statusId").split(",");

		if ((account != null && !account.isEmpty()) && (email != null && !email.isEmpty())
				&& (password != null && !password.isEmpty()) && (passwordCheck != null && !passwordCheck.isEmpty())
				&& (phone != null && !phone.isEmpty())) {
			Member mSQL = mService.selectById(id);

			if (!phone.matches("^09\\d{8}$")) {
				phone = mSQL.getPhone();
			}
			Timestamp birthday = null;
			if (birthdayString != null && !birthdayString.isEmpty()) {
				if (birthdayString.matches("^\\d{4}\\-\\d{2}\\-\\d{2}.*$")) {
					birthday = Timestamp.valueOf(birthdayString);
				} else {
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
			}
			if (photo == null || photo.isEmpty()) {
				photo = mSQL.getPhoto();
			}
			Timestamp registerTime = mSQL.getRegisterTime();
			int statusId = Integer.valueOf(statusString[0]);
			String statusName = statusString[1];

			if (password.equals(passwordCheck)) {
				Member m1 = new Member(id, account, password, name, email, phone, gender, birthday, photo, registerTime,
						statusId);
				Status s = new Status(statusId, statusName);

				m1.setStatus(s);

				mService.update(m1);
			}
		}
		return "redirect:/members";
	}

	@RequestMapping(path = "/members.delete", method = RequestMethod.POST)
	public String processDeleteAction(@RequestParam("id") String idString, Model m) {

		int id = Integer.parseInt(idString);

		mService.delete(id);

		return "redirect:/members";
	}

}
