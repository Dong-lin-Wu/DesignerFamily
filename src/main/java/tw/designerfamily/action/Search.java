package tw.designerfamily.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.model.Member;
import tw.designerfamily.model.MemberService;

@Controller
public class Search {

	@Autowired
	private MemberService mService;

	@RequestMapping(path = "/search", method = RequestMethod.POST)
	public String processMainAction() {
		return "redirect:/admin";
	}

	@RequestMapping(path = "/search.members", method = RequestMethod.POST)
	public String processMembersAction(@RequestParam("keyword") String keyword, Model m) {

		List<Member> list = mService.selectByPhoneAccountEmail(keyword);
		m.addAttribute("members", list);
		return "member_admin";
	}

}
