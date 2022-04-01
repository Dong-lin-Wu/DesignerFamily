package tw.designerfamily.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.model.IRaiseBeanService;
import tw.designerfamily.model.RaiseBean;
import tw.designerfamily.model.RaiseBeanService;

@Controller
public class RaiseController {
	
	@Autowired
	private IRaiseBeanService rService;
	
	@RequestMapping(path = "/raiseindex.controller",method = RequestMethod.GET)
	public String processAction(Model m) {
		List<RaiseBean> rlist = rService.selectAll();
		m.addAttribute("raiseList",rlist);
		
		return "Raise.jsp";
//		return "redirect: actionResult"; sendredirect
	}
	
	@RequestMapping(path = "/raisedelete.controller",method = RequestMethod.POST)
	public String processDelete(@RequestParam("rID") int id,Model m) {
	    rService.deleteById(id);
	    System.out.println(id);
	    List<RaiseBean> rlist = rService.selectAll();
		m.addAttribute("raiseList",rlist);
	    return "Raise.jsp";
	}
}
