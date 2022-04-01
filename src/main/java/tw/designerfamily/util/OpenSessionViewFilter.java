package tw.designerfamily.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

//@WebFilter(urlPatterns = {"/*"})
public class OpenSessionViewFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		if (request instanceof HttpServletRequest) {
			String url = ((HttpServletRequest)request).getRequestURL().toString();
			if(url.contains(".jsp")) {
//				System.out.println("為jsp檔");
				chain.doFilter(request, response);
			}else {
				try {
					session.beginTransaction();
					System.out.println("Transaction Begin.");
					
					
					chain.doFilter(request, response);
					
					session.getTransaction().commit();
					System.out.println("Transaction Commit.");
				} catch (Exception e) {
					session.getTransaction().rollback();
					System.out.println("Transaction RollBack.");
					e.printStackTrace();
				} finally {
					System.out.println("Session closed.");
				}
				
			}
			
		}
		
		

	}

}
