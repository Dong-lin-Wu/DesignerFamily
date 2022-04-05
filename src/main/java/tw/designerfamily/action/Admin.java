package tw.designerfamily.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Admin {

	@RequestMapping(path = "/admin", method = RequestMethod.GET)
	public String processMainAction() {
		return "index_admin";
	}

}
