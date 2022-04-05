package tw.designerfamily.action;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.designerfamily.model.Member;
import tw.designerfamily.model.MemberService;

@Controller
@SessionAttributes("login")
public class Login {

	@Autowired
	private MemberService mService;

	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String processMainAction() {
		return "login";
	}

	@RequestMapping(path = "/checklogin", method = RequestMethod.POST)
	public String processAction(HttpServletRequest request, @RequestParam("status") String statusString,
			@RequestParam("account") String account, @RequestParam("password") String password, Model m) {

		String[] status = statusString.split(",");

		if ((account != null && !account.isEmpty()) && (password != null && !password.isEmpty())) {
			Member mSQL = mService.selectLogin(account, password);
			if (mSQL != null) {
				Member m1 = new Member(mSQL.getAccount(), mSQL.getEmail(), mSQL.getPhone(), mSQL.getGender(),
						mSQL.getBirthday(), mSQL.getRegisterTime(), mSQL.getStatus());

				if (mSQL.getPassword().equals(password) && mSQL.getStatus().getStatusId() == Integer.valueOf(status[0])
						|| mSQL.getStatus().getStatusId() == Integer.valueOf(status[1])) {
					if (mSQL.getStatus().getStatusId() == 9 || mSQL.getStatus().getStatusId() == 8) {
						if (request.getSession(false) != null) {
							request.changeSessionId();
						}
						m.addAttribute("login", m1);
						return "redirect:/admin";
					} else {
						if (request.getSession(false) != null) {
							request.changeSessionId();
						}
						m.addAttribute("login", m1);
						return "redirect:/user";
					}
				} else {
					m.addAttribute("errors", Arrays.asList("身分錯誤"));
					return "login";
				}
			} else {
				m.addAttribute("errors", Arrays.asList("登入失敗"));
				return "login";
			}
		} else {
			m.addAttribute("errors", Arrays.asList("登入失敗"));
			return "login";
		}
	}

}
