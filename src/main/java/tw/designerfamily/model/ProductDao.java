package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class ProductDao {

	private Session session;

	public ProductDao() {
	}

	public ProductDao(Session session) {
		this.session = session;
	}

	// 新增商品
	public void addProduct(ProductBean pBean){
		ProductBean resultBean = session.get(ProductBean.class, pBean.getCommNo());
		
		if(resultBean == null) {
			session.save(pBean);
		}else {
			System.out.println("資料庫已存在資料，未新增。");
		}
		
	}

	// 依商品編號刪除商品
	public void deleteByCOMM_No(int commNo) {
	 	ProductBean resultBean = session.get(ProductBean.class, commNo);
	 	
	 	if (resultBean != null) {
			session.delete(resultBean);
			System.out.println("commNo= " + resultBean.getCommNo() + "delete= "+ resultBean);
		}
	}

	// 修改商品資料
	public void update(ProductBean pBean) {
		session.update(pBean);
	}

	// 檢視所有商品
	public List<ProductBean> selectAll() {
		Query<ProductBean> query = session.createQuery("from ProductBean", ProductBean.class);
		return query.list();
	}

	// 依商品編號查詢
	public ProductBean findByNo(int commNo) {
		return session.get(ProductBean.class, commNo);
	}

	// 關鍵字查詢
	public List<ProductBean> findByKeyword(String keyword) {
		Query<ProductBean> query = session.createQuery("from ProductBean where commTitle like ?0 or category like ?1 or designer like ?2 or commDES like ?3", ProductBean.class);
		query.setParameter(0, "%" + keyword + "%");
		query.setParameter(1, "%" + keyword + "%");
		query.setParameter(2, "%" + keyword + "%");
		query.setParameter(3, "%" + keyword + "%");
		return query.list();
	}

}
