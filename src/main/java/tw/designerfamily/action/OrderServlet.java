package tw.designerfamily.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import tw.designerfamily.model.Order;
import tw.designerfamily.model.OrderDao;
import tw.designerfamily.util.HibernateUtil;



/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding(CHARSET_CODE);
		  response.setContentType(CONTENT_TYPE);
		 // To prevent caching 
		  response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
		  response.setHeader("Pragma","no-cache"); // HTTP 1.0
		  response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
		  
		  //判斷執行的action value是甚麼,呼叫對應方法執行
	      String action = request.getParameter("action");
	      if (action == null) {
		  showall(request, response);
	      }else if(action.equals("deleteorder")){
	    	  deleteorder(request, response);	   
	      }else if(action.equals("findorder")) {
	    	  findorder(request, response);
	      }else if(action.equals("reviseorder")) {
	    	  reviseorder(request, response);
	      }else if(action.equals("addorder")){
	    	  addorder(request, response);
	      }else if(action.equals("search")) {
	    	  search(request, response);
	      }

	}
	//show出目前所有訂單
	protected void showall(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		OrderDao od = new OrderDao(session);
		List<Order> list = od.selectAll();
		request.getSession(true).setAttribute("list", list);
		response.sendRedirect("ordermanage.jsp");
	}
	//刪除指定id訂單
	protected void deleteorder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		 request.setCharacterEncoding(CHARSET_CODE);
		  response.setContentType(CONTENT_TYPE);
		 // To prevent caching 
		  response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
		  response.setHeader("Pragma","no-cache"); // HTTP 1.0
		  response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
		  
		  String id = request.getParameter("orderNo");
			if(id != null && !id.equals("")) {
				OrderDao od = new OrderDao(session);
				od.deleteById(Integer.parseInt(id));	
			}
			//request.getRequestDispatcher("OrderServlet").forward(request, response);
			response.sendRedirect("OrderServlet");
			
	}
	 //找出指定id商品,顯示在修改jsp頁面
	 protected void findorder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
	    	//先做findybyid找出對應的資料,並forward給 orderrevise網頁
		 Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			String no = request.getParameter("orderNo");
			if(no !=null && !no.equals("")) {
				OrderDao od = new OrderDao(session);
				Order order = od.selectById(Integer.parseInt(no));
				request.setAttribute("order", order);
		  ArrayList<String> op = new ArrayList<String>();
		        op.add("待出貨");
		        op.add("已出貨");
		        op.add("訂單完成");
				request.setAttribute("option", op);
			}
			request.getRequestDispatcher("orderrevise.jsp").forward(request, response);
			
		}
	     //修改介面送出,在此處理送進sql
		protected void reviseorder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			 request.setCharacterEncoding(CHARSET_CODE);
			  response.setContentType(CONTENT_TYPE);
			 // To prevent caching 
			  response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
			  response.setHeader("Pragma","no-cache"); // HTTP 1.0
			  response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
			  
			  String orderqty = request.getParameter("orderqty");
			  String orderprice = request.getParameter("orderprice");
			  String orderstatus = request.getParameter("orderstatus");
			  String orderno = request.getParameter("orderno");
//			  
//			  Order order = new Order();
//			  order.setOrderStatus(orderstatus);
//			  order.setOrderNo(Integer.valueOf(orderno));
//			  try {
//				  order.setOrderQty(Integer.valueOf(orderqty));//轉型成int型態存入sql
//				  order.setOrderPrice(Integer.valueOf(orderprice));		
//				
//				} catch (Exception e) {
//					orderqty="";
//					orderprice="";
//				}	
//			  
//			  if(orderqty!=null && !(orderqty.equals("")) &&  Integer.valueOf(orderqty)>0 && orderprice!=null && !orderprice.equals("") && Integer.valueOf(orderprice)>0) {
//				  
				  OrderDao od = new OrderDao(session);
				  od.updateorder(Integer.valueOf(orderno),Integer.valueOf(orderqty),Integer.valueOf(orderprice),orderstatus);
			  
			  //request.getRequestDispatcher("OrderServlet").forward(request, response);
			  response.sendRedirect("OrderServlet");	 
		}

		//購買的商品確認後在此處理並送進sql
		protected void addorder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			request.setCharacterEncoding(CHARSET_CODE);
			  response.setContentType(CONTENT_TYPE);
			 // To prevent caching 
			  response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
			  response.setHeader("Pragma","no-cache"); // HTTP 1.0
			  response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
			  
			String ordername=request.getParameter("ordername1");
			String orderqty=request.getParameter("orderqty1");
			String orderprice=request.getParameter("orderprice1");
			String orderowner=request.getParameter("orderowner");
			String orderkey  = OrderKey();
			String orderstatus = OrderStatus();
			
			Order order = new Order();
			
			order.setOrderKey(orderkey);
		    try {
		    	order.setOrderPrice(Integer.valueOf(orderprice)*Integer.valueOf(orderqty));
		    	order.setOrderQty(Integer.valueOf(orderqty));	
			} catch (Exception e) {
				orderqty="";
				orderprice="";	
			}
			order.setOrderOwner(orderowner);
			order.setOrderName(ordername);
			order.setOrderStatus(orderstatus);
			if(orderqty!=null && !(orderqty.equals("")) && Integer.valueOf(orderqty)>0 && orderprice!=null && !orderprice.equals("")&& Integer.valueOf(orderprice)>0) {
				OrderDao od = new OrderDao(session);
				od.insert(order);
			}
			
			String ordername1=request.getParameter("ordername2");
			String orderqty1=request.getParameter("orderqty2");
			String orderprice1=request.getParameter("orderprice2");
			String orderowner1=request.getParameter("orderowner");
			String orderkey1  = OrderKey();
			String orderstatus1 = OrderStatus();
			
			Order order1 = new Order();
			
			order1.setOrderKey(orderkey1);
		    try {
		    	order1.setOrderPrice(Integer.valueOf(orderprice1)*Integer.valueOf(orderqty1));
		    	order1.setOrderQty(Integer.valueOf(orderqty1));	
			} catch (Exception e) {
				orderqty1="";
				orderprice1="";	
			}
			order1.setOrderOwner(orderowner1);
			order1.setOrderName(ordername1);
			order1.setOrderStatus(orderstatus1);
			if(orderqty1!=null && !(orderqty1.equals("")) && Integer.valueOf(orderqty1)>0 && orderprice1!=null && !orderprice1.equals("")&& Integer.valueOf(orderprice1)>0) {
				OrderDao od = new OrderDao(session);
				od.insert(order1);
			}
			String ordername2=request.getParameter("ordername3");
			String orderqty2=request.getParameter("orderqty3");
			String orderprice2=request.getParameter("orderprice3");
			String orderowner2=request.getParameter("orderowner");
			String orderkey2  = OrderKey();
			String orderstatus2 = OrderStatus();
			
			Order order2 = new Order();
			
			order2.setOrderKey(orderkey2);
		    try {
		    	order2.setOrderPrice(Integer.valueOf(orderprice2)*Integer.valueOf(orderqty2));
		    	order2.setOrderQty(Integer.valueOf(orderqty2));	
			} catch (Exception e) {
				orderqty2="";
				orderprice2="";	
			}
			order2.setOrderOwner(orderowner2);
			order2.setOrderName(ordername2);
			order2.setOrderStatus(orderstatus2);
			if(orderqty2!=null && !(orderqty2.equals("")) && Integer.valueOf(orderqty2)>0 && orderprice2!=null && !orderprice2.equals("")&& Integer.valueOf(orderprice2)>0) {
				OrderDao od = new OrderDao(session);
				od.insert(order2);
			}
			String ordername3=request.getParameter("ordername4");
			String orderqty3=request.getParameter("orderqty4");
			String orderprice3=request.getParameter("orderprice4");
			String orderowner3=request.getParameter("orderowner");
			String orderkey3  = OrderKey();
			String orderstatus3 = OrderStatus();
			
			Order order3 = new Order();
			
			order3.setOrderKey(orderkey3);
		    try {
		    	order3.setOrderPrice(Integer.valueOf(orderprice3)*Integer.valueOf(orderqty3));
		    	order3.setOrderQty(Integer.valueOf(orderqty3));	
			} catch (Exception e) {
				orderqty3="";
				orderprice3="";	
			}
			order3.setOrderOwner(orderowner3);
			order3.setOrderName(ordername3);
			order3.setOrderStatus(orderstatus3);
			if(orderqty3!=null && !(orderqty3.equals("")) && Integer.valueOf(orderqty3)>0 && orderprice3!=null && !orderprice3.equals("")&& Integer.valueOf(orderprice3)>0) {
				OrderDao od = new OrderDao(session);
				od.insert(order3);
			}
			String ordername4=request.getParameter("ordername5");
			String orderqty4=request.getParameter("orderqty5");
			String orderprice4=request.getParameter("orderprice5");
			String orderowner4=request.getParameter("orderowner");
			String orderkey4  = OrderKey();
			String orderstatus4 = OrderStatus();
			
			Order order4 = new Order();
			
			order4.setOrderKey(orderkey4);
		    try {
		    	order4.setOrderPrice(Integer.valueOf(orderprice4)*Integer.valueOf(orderqty4));
		    	order4.setOrderQty(Integer.valueOf(orderqty4));	
			} catch (Exception e) {
				orderqty4="";
				orderprice4="";	
			}
			order4.setOrderOwner(orderowner4);
			order4.setOrderName(ordername4);
			order4.setOrderStatus(orderstatus4);
			if(orderqty4!=null && !(orderqty4.equals("")) && Integer.valueOf(orderqty4)>0 && orderprice4!=null && !orderprice4.equals("")&& Integer.valueOf(orderprice4)>0) {
				OrderDao od = new OrderDao(session);
				od.insert(order4);
			}
			String ordername5=request.getParameter("ordername6");
			String orderqty5=request.getParameter("orderqty6");
			String orderprice5=request.getParameter("orderprice6");
			String orderowner5=request.getParameter("orderowner");
			String orderkey5  = OrderKey();
			String orderstatus5 = OrderStatus();
			
			Order order5 = new Order();
			
			order5.setOrderKey(orderkey5);
		    try {
		    	order5.setOrderPrice(Integer.valueOf(orderprice5)*Integer.valueOf(orderqty5));
		    	order5.setOrderQty(Integer.valueOf(orderqty5));	
			} catch (Exception e) {
				orderqty5="";
				orderprice5="";	
			}
			order5.setOrderOwner(orderowner5);
			order5.setOrderName(ordername5);
			order5.setOrderStatus(orderstatus5);
			if(orderqty5!=null && !(orderqty5.equals("")) && Integer.valueOf(orderqty5)>0 && orderprice5!=null && !orderprice5.equals("")&& Integer.valueOf(orderprice5)>0) {
				OrderDao od = new OrderDao(session);
				od.insert(order5);
			}
			//request.getRequestDispatcher("OrderServlet").forward(request, response);
			response.sendRedirect("OrderServlet");
		}
		
		 //找出搜尋之商品 by 訂單號碼 or 訂購商品
		 protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
		    	//先做findybyid找出對應的資料,並forward給 orderrevise網頁
			 Session session = HibernateUtil.getSessionFactory().getCurrentSession();
				String key = request.getParameter("orderkey");
				System.out.println(key);
				if(key !=null && !key.equals("")) {
					OrderDao od = new OrderDao(session);
					List<Order> order = od.search(key);
					request.setAttribute("list", order);
					request.getRequestDispatcher("ordermanage.jsp").forward(request, response);
				}else {
					response.sendRedirect("OrderServlet");
					
				}
				
			}
		 
//		//模擬購買介面,把購買資訊傳入頁面
//			protected void notbuy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//				// TODO Auto-generated method stub
//					request.setCharacterEncoding("UTF-8");
//				    response.setContentType("text/html;charset=utf-8");
//				    List<Order> list =(List<Order>) request.getAttribute("goods");
//				    int notbuy= Integer.parseInt(request.getParameter("notbuy"));//轉成數字
//				    int notbuy1= notbuy-1;
//				    System.out.println(notbuy1);
//				    list.remove(notbuy1);
//		            request.setAttribute("good", list);
//			        request.getRequestDispatcher("test.jsp").forward(request, response);
//
//			    }
		 
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

	
	}


