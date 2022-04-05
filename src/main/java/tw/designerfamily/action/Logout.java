package tw.designerfamily.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Logout {

	@RequestMapping(path = "/logout", method = RequestMethod.GET)
	public String processMainAction() {
		return "redirect:/login";
	}

}
