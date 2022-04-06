package tw.designerfamily.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import tw.designerfamily.model.INewsService;
import tw.designerfamily.model.NewsBean;
import tw.designerfamily.model.NewsDao;

@Controller
public class NewsController {
	
	@Autowired
	private INewsService newsService;
	
	
	@RequestMapping(path = "/newsIndex",method = RequestMethod.GET)
	public String showNewsIndex(Model m) {
		List<NewsBean> list = newsService.selectAll();
		m.addAttribute("list", list);
		
		return "NewsIndex";
	}
	
	
	@RequestMapping(path = "/newsIndex",method = RequestMethod.POST)
	public String searchNewsByKey(@RequestParam("keyword") String key, Model m) {
			List<NewsBean> news = newsService.searchByKey(key);
			m.addAttribute("list", news);
		
		return "NewsIndex";
	}
	
	@RequestMapping(path = "/newsDelete",method = RequestMethod.POST)
	public String deleteNews(@RequestParam("id") int id) {
		newsService.deleteById(id);
		
		return "redirect:newsIndex";
	}
	
	@RequestMapping(path = "/newsAdd",method = RequestMethod.GET)
	public String addNews(Model m) {
		NewsBean news = new NewsBean();
		m.addAttribute("addList", news);
		return "NewsAdd";
	}
	
	@RequestMapping(path = "/newsAdd",method = RequestMethod.POST)
	public String addNews2(@ModelAttribute("addList") NewsBean newsBean) {
		newsService.insert(newsBean);
		return "redirect:newsIndex";
	}
	
		
	@RequestMapping(path = "/newsUpdate",method = RequestMethod.GET)
	public String showNewsUpdateForm(@RequestParam("id") int id,Model m) {
		NewsBean news = newsService.selectById(id);
		m.addAttribute("updateList", news);
		return "NewsUpdate";
	}
	
	@RequestMapping(path = "/newsUpdate",method = RequestMethod.POST)
	public String updateNews(@ModelAttribute("updateList") NewsBean newsBean) {
		newsService.update(newsBean);
		return "redirect:newsIndex";
	}
	
}
