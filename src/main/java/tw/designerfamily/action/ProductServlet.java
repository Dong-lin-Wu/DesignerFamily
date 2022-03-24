package tw.designerfamily.action;

import java.io.IOException;
import java.io.UncheckedIOException;
import java.sql.SQLException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;


import tw.designerfamily.model.ProductBean;
import tw.designerfamily.model.ProductDao;
import tw.designerfamily.util.HibernateUtil;

/**
 * Servlet implementation class ProductAddServlet
 */
@MultipartConfig(location = "C:/DataSource/workspace/DesignerFamily/src/main/webapp/img") // 指定存取路徑
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";


	public ProductServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		// To prevent caching
		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1); // Prevents caching at the proxy server

		String nextPage = "";
		String donext = request.getParameter("donext");

		if (donext == null) {
			nextPage = "Product.jsp";
			redirectProduct(request, response);

		} else if (donext.equals("ProductAdd")) {

			try {
				gotoProductAddProcess(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			nextPage = "Product.jsp";
			redirectProduct(request, response);

		} else if (donext.equals("ProductUpdate")) {
			try {
				gotoProductUpdateProcess(request, response);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			nextPage = "Product.jsp";
			redirectProduct(request, response);
		}

		else if (donext.equals("ProductDelete")) {
			try {
				gotoProductDeleteProcess(request, response);
			} catch (NumberFormatException | SQLException e1) {
				e1.printStackTrace();
			}
			nextPage = "Product.jsp";
			redirectProduct(request, response);
		} else if (donext.equals("ProductSearchNo")) {

			gotoProductSearchNoProcess(request, response);
			nextPage = "Product.jsp";

		} else if (donext.equals("ProductSearch")) {

			gotoProductSearchProcess(request, response);

			nextPage = "Product.jsp";

		}
		response.sendRedirect(nextPage);

	}

	// SelectAll
	private void redirectProduct(HttpServletRequest request, HttpServletResponse response) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		ProductDao pdao = new ProductDao(session);
		List<ProductBean> plist = pdao.selectAll();
		request.getSession(true).setAttribute("productList", plist);
	}

	// 依編號搜尋
	private void gotoProductSearchNoProcess(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("search_no"));
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		ProductDao pDao = new ProductDao(session);
//		ProductBean plist = pDao.findByNo(no);
		ArrayList<ProductBean> plist = new ArrayList<ProductBean>();
		plist.add(pDao.findByNo(no));
		request.getSession(true).setAttribute("productList", plist);
	}

	// 搜尋關鍵字
	private void gotoProductSearchProcess(HttpServletRequest request, HttpServletResponse response) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		String keyword = request.getParameter("search_keyword");

		ProductDao pDao = new ProductDao(session);
		List<ProductBean> plist = pDao.findByKeyword(keyword);

		request.getSession(true).setAttribute("productList", plist);
	}

	// 新增
	private void gotoProductAddProcess(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		String cTitle = request.getParameter("commTitle").trim();
		String cDES = request.getParameter("commDES").trim();
		String cSPE = request.getParameter("commSPE").trim();
		String cCategory = request.getParameter("category").trim();
		String cDesigner = request.getParameter("designer").trim();
		int cPrice = Integer.parseInt(request.getParameter("commPrice").trim());
		int cQuantity = Integer.parseInt(request.getParameter("commQuantity").trim());
		Part part = request.getPart("photo");// 使用getpart方法取得part物件
		String a = write(part);
		String cimg = a;

		// 手動set 需要的參數
		ProductBean pBean = new ProductBean();
		pBean.setCommTitle(cTitle);
		pBean.setCommDES(cDES);
		pBean.setCommSPE(cSPE);
		pBean.setCategory(cCategory);
		pBean.setDesigner(cDesigner);
		pBean.setCommPrice(cPrice);
		pBean.setCommQuantity(cQuantity);
		pBean.setCommImg(cimg);
		ProductDao pDao = new ProductDao(session);
		pDao.addProduct(pBean);
	}

	// write方法(改寫上傳圖片名稱,並寫入存取路徑)
	private String write(Part part) {
		String submittedFile = part.getSubmittedFileName();// 取得上傳文件名稱
		String ext = submittedFile.substring(submittedFile.lastIndexOf('.'));
		String img = String.format("%s%s", Instant.now().toEpochMilli(), ext);// 改寫檔名,用string img接住

		try {
			part.write(img);
			System.out.println(img);

		} catch (IOException e) {
			throw new UncheckedIOException(e);
		}
		return img;
	}

	// 修改
	private void gotoProductUpdateProcess(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int cNo = Integer.parseInt(request.getParameter("commNo"));
		String cTitle = request.getParameter("commTitle").trim();
		String cDES = request.getParameter("commDES").trim();
		String cSPE = request.getParameter("commSPE").trim();
		String cCategory = request.getParameter("category").trim();
		String cDesigner= request.getParameter("designer").trim();
		int cPrice = Integer.parseInt(request.getParameter("commPrice").trim());
		int cQuantity = Integer.parseInt(request.getParameter("commQuantity").trim());
		Part part = request.getPart("photo");// 使用getpart方法取得part物件
		String a = write2(part);
		String cimg = a;

		ProductBean pBean = new ProductBean();
		pBean.setCommNo(cNo);
		pBean.setCommTitle(cTitle);
		pBean.setCommDES(cDES);
		pBean.setCommSPE(cSPE);
		pBean.setCategory(cCategory);
		pBean.setDesigner(cDesigner);
		pBean.setCommPrice(cPrice);
		pBean.setCommQuantity(cQuantity);
		pBean.setCommImg(cimg);

		ProductDao pDao = new ProductDao(session);
		pDao.update(pBean);
	}

	private String write2(Part part) {
		String submittedFile = part.getSubmittedFileName();
		String ext = submittedFile.substring(submittedFile.lastIndexOf('.'));
		String img = String.format("%s%s", Instant.now().toEpochMilli(), ext);

		try {
			part.write(img);

		} catch (IOException e) {
			throw new UncheckedIOException(e);
		}
		return img;
	}

	// 刪除
	private void gotoProductDeleteProcess(HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		String delete = request.getParameter("delete");

		ProductDao dao = new ProductDao(session);
		if (delete.length() > 0) {
			dao.deleteByCOMM_No(Integer.parseInt(delete));
		}

	}

}
