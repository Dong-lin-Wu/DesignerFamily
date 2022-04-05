package tw.designerfamily.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.designerfamily.model.CartItem;
import tw.designerfamily.model.IDesignerOrderService;
import tw.designerfamily.model.IDesignerProductService;
import tw.designerfamily.model.Order;
import tw.designerfamily.model.ProductBean;

@SessionAttributes("carts")
@Controller
public class OrderController {
	
	@Autowired
	private IDesignerOrderService service;
	
	@Autowired
	private IDesignerProductService service1;

	@RequestMapping(path = "/showorder", method = RequestMethod.GET)
	public String processMainAction(Model m) {
		List<Order> list = service.selectAll();
		m.addAttribute("list", list);
		return "orderDetail";
		
	}
	
	@RequestMapping(path ="/deleteorder", method = RequestMethod.POST)
	public String processAction2(@RequestParam("orderNo") int id) {
		service.selectById(id);
		service.deleteById(id);
		return "redirect:showorder";
		
	}
	
	@RequestMapping(path="/searchorder", method = RequestMethod.POST)
	public String processAction3(@RequestParam("search") String key,Model m) {
		List<Order> order = service.search(key);
		m.addAttribute("list",order);
		return "orderDetail";
	}
	
	@RequestMapping(path = "/reviseorder", method = RequestMethod.POST)
	public String processAction4(@RequestParam("orderNo") int id,Model m) {
		Order order = service.selectById(id);
		m.addAttribute("order", order);
		
		ArrayList<String> op = new ArrayList<String>();
        op.add("待出貨");
        op.add("已出貨");
        op.add("訂單完成");
        m.addAttribute("option", op);
        
		return "orderrevise";
	}
	
	@RequestMapping(path = "/checkO", method = RequestMethod.POST)
	public String processAction5(@RequestParam("orderNo") int id,@RequestParam("orderQty") int qty,
			@RequestParam("orderPrice") int p,@RequestParam("orderStatus") String status) {

		service.updateorder(id, qty, p, status);
		
		return "redirect:showorder";

	}
	
	@RequestMapping(path = "/buy",method = RequestMethod.POST)
	public String processAction6() {
		return "BuyGoods";
	}
	
	//購物車(可以修改成Hashmap)
	@RequestMapping(path = "/cartItem",method = RequestMethod.POST,produces ="text/plain;charset=utf-8")
	public String processAction7(@RequestParam("commNo")int id,Model m,HttpServletRequest request ) {
		
//		 Map<ProductBean, Integer> cart = (Map<ProductBean, Integer>) session.getAttribute("cart");
//		 ProductBean good = service1.selectById(id);
//		 
//		 if(cart==null) {//如果購物車為空,建立一個購物車
//			 cart = new HashMap<ProductBean, Integer>();
//			 cart.put(good, 1);
//			 m.addAttribute("cart", cart);  
//		 }else {
//			 Integer n = cart.get(good);
//			 if(n== null) {
//				 cart.put(good, 1);
//			 }else {
//				 cart.put(good, n+1);
//			 }
//		 }
		ProductBean goods = service1.selectById(id);
		CartItem od = new CartItem(goods, 1, goods.getCommPrice());
		if(request.getSession().getAttribute("carts")==null) {
			List<CartItem> list = new ArrayList<CartItem>();
			list.add(od);
			m.addAttribute("carts", list);
		}else {
			@SuppressWarnings("unchecked")
			List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");
			boolean found = false;
			Iterator<CartItem> it = list.iterator();
			while(!found && it.hasNext()) {
				CartItem aod = it.next();
				if(aod.getProduct().getCommNo()==od.getProduct().getCommNo()) {
					aod.setQty(aod.getQty()+1);
					aod.setTotalprice(aod.getTotalprice()+od.getTotalprice());
					found = true;
				}
			}
			if(!found) {
				list.add(od);
			}
			
		}
		return "Cart";
	}
	
	//購物車(接受GET方法redirect轉址)
	@RequestMapping(path = "/cartItem",method = RequestMethod.GET,produces ="text/plain;charset=utf-8")
	public String processActionGet() {
		return "Cart";
	}
	
	
	@RequestMapping(path = "/removeCart",method = RequestMethod.POST)
	public String processAction8(@RequestParam("commNo") int id,HttpServletRequest request,Model m) {
		
		@SuppressWarnings("unchecked")
		List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");
		Iterator<CartItem> it = list.iterator();
		while(it.hasNext()) {
			CartItem aod = it.next();
			if(aod.getProduct().getCommNo()==id) {
					it.remove();
				}
			}
		
		return "redirect:cartItem";
	}
	
	@RequestMapping(path = "/checkout",method = RequestMethod.POST)
	public String processAction9(HttpServletRequest request,Model m,HttpSession session) {
		@SuppressWarnings("unchecked")
		List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");
		m.addAttribute("check", list);
		return "Pay";
	}

	@RequestMapping(path = "/generatedorder",method = RequestMethod.POST)
	public String processAction10(HttpServletRequest request, HttpSession session,SessionStatus sessionStatus) {
		@SuppressWarnings("unchecked")
		List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");
		Iterator<CartItem> it = list.iterator();
		while(it.hasNext()) {
			CartItem aod = it.next();
			String name = aod.getProduct().getCommTitle();
			int qty = aod.getQty();
			int totalprice = aod.getTotalprice();
			service.insert(new Order(buyer(), name, qty, totalprice, OrderStatus(), OrderKey()));
			}
		
		session.removeAttribute("carts");
		sessionStatus.setComplete();//清除session,讓購物車清空,當完成訂單時
		
		return "redirect:showorder";
	}
	
	
	
	public  String OrderKey() {
	    DateFormat format = new SimpleDateFormat("yyMMdd");
	    Date date = new Date();
	    StringBuffer buffer = new StringBuffer();
	    buffer.append(format.format(date));
	    buffer.append((date.getTime() + "").substring(9));
	    buffer.append(getRandNum(4));
	    return buffer.toString();
	}
	 public String getRandNum(int leng){
	        Random random = new Random();
	        StringBuffer result = new StringBuffer();
	        for (int i = 0; i < leng; i++) {
	            result.append(random.nextInt(10));
	        }
	        if(result.length()>0){
	            return result.toString();
	        }
	        return null;
	    }
	 
	 public  String OrderStatus() {
		   String status ="待出貨";
		   return status;
		}
	 public  String buyer() {
		   String status ="吳東霖";
		   return status;
		}

}
