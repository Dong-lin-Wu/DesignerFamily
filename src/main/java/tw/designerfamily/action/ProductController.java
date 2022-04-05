package tw.designerfamily.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.time.Instant;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.designerfamily.model.IDesignerProductService;
import tw.designerfamily.model.ProductBean;

@Controller
@SessionAttributes("showall")
public class ProductController {
	
	@Autowired
	private IDesignerProductService service;
	
	@RequestMapping(path = "/product", method = RequestMethod.GET)
	public String processMainAction(Model m) {
		List<ProductBean> list = service.selectAll();
		m.addAttribute("productList", list);
		m.addAttribute("showall", list);
		return "Product";
	}
	
	@RequestMapping(path = "/product", method = RequestMethod.POST)
	public String processMainAction1(Model m) {
		List<ProductBean> list = service.selectAll();
		m.addAttribute("productList", list);
		
		return "Product";
	}
	
	@RequestMapping(path = "/deleteProduct", method = RequestMethod.POST)
	public String processAction(@RequestParam("commNo") int id) {
		service.selectById(id);
		service.deleteById(id);
		
		return "redirect:product";
	}
	
	@RequestMapping(path = "/searchProduct", method = RequestMethod.POST)
	public String processAction2(@RequestParam("search") String key, Model m) {
		List<ProductBean> product = service.findByKeyword(key);
		m.addAttribute("productList", product);
		
		return "Product";
	}
	
	@RequestMapping(path = "/reviseProduct", method = RequestMethod.POST)
	public String ProcessAction3(@RequestParam("commNo") int id,Model m) {
		ProductBean product = service.selectById(id);
		m.addAttribute("productList", product);
		
		return"ProductUpdate";	
	}
	
	//一般上傳檔案方法
//	@RequestMapping(path = "/checkP", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
//	public String processAction4(@RequestParam("commNo") int id,@RequestParam("commTitle")String title,@RequestParam("commDES") String des,
//			@RequestParam("commSPE") String spe,@RequestParam("category") String catgory,@RequestParam("designer")String designer,@RequestParam("commPrice")int price,
//			@RequestParam("commQuantity")int qty,@RequestParam("commImg") MultipartFile mf, HttpServletRequest request) throws IOException, ServletException {
//		      
//		    String Filename = mf.getOriginalFilename();
//		    String ext = Filename.substring(Filename.lastIndexOf('.'));
//			String img = String.format("%s%s", Instant.now().toEpochMilli(), ext);// 改寫檔名,用string img接住
//		    String path = request.getSession().getServletContext().getRealPath("/img");
//		    
//		    File save = new File(path + File.separator + img);
//		    
//		    try {
//		    	mf.transferTo(save);
//				
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		
//		service.update(new ProductBean(id, title, des, spe, path, designer, price, qty, img));
//		return "redirect:product";
//	}
	
	//Base64
	@RequestMapping(path = "/checkP", method = RequestMethod.POST)
	public String processAction5(@RequestParam("commNo") int id,@RequestParam("commTitle")String title,@RequestParam("commDES") String des,
			@RequestParam("commSPE") String spe,@RequestParam("category") String catgory,@RequestParam("designer")String designer,@RequestParam("commPrice")int price,
			@RequestParam("commQuantity")int qty,@RequestParam("product_PicBase64")String img){
		
		service.update(new ProductBean(id, title, des, spe, catgory, designer, price, qty, img));
		return "redirect:product";
	}
	
	@RequestMapping(path ="/addProduct", method = RequestMethod.POST)
	public String processAction6(@RequestParam("commTitle")String title,@RequestParam("commDES") String des,
			@RequestParam("commSPE") String spe,@RequestParam("category") String catgory,@RequestParam("designer")String designer,@RequestParam("commPrice")int price,
			@RequestParam("commQuantity")int qty,@RequestParam("product_PicBase64")String img) {
		
		service.insert(new ProductBean(title, des, spe, catgory, designer, price, qty, img));
		
		return"redirect:product";
	}
	
	//轉址
	@RequestMapping(path = "/transtoadd",method = RequestMethod.GET)
	public String processAction7() {
		return"ProductAdd";
	}
	
}
