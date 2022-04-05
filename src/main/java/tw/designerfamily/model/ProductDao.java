package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class ProductDao implements IDesignerProductDao{
	
    @Autowired
	private SessionFactory sessionFactory;

	@Override
	public void insert(ProductBean pBean){
		Session session = sessionFactory.getCurrentSession();
		ProductBean resultBean = session.get(ProductBean.class, pBean.getCommNo());
		
		if(resultBean == null) {
			session.save(pBean);
		}else {
			System.out.println("資料庫已存在資料，未新增。");
		}
		
	}

	@Override
	public void deleteById(int id) {
		Session session = sessionFactory.getCurrentSession();
	 	ProductBean resultBean = session.get(ProductBean.class, id);
	 	
	 	if (resultBean != null) {
			session.delete(resultBean);
			System.out.println("commNo= " + resultBean.getCommNo() + "delete= "+ resultBean);
		}
	}

	@Override
	public void update(ProductBean p) {
		Session session = sessionFactory.getCurrentSession();
		session.update(p);
	}

	@Override
	public List<ProductBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<ProductBean> query = session.createQuery("from ProductBean", ProductBean.class);
		return query.list();
	}

	@Override
	public ProductBean selectById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(ProductBean.class, id);
	}

	@Override
	public List<ProductBean> findByKeyword(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		Query<ProductBean> query = session.createQuery("from ProductBean where commTitle like ?0 or category like ?1 or designer like ?2 or commDES like ?3", ProductBean.class);
		query.setParameter(0, "%" + keyword + "%");
		query.setParameter(1, "%" + keyword + "%");
		query.setParameter(2, "%" + keyword + "%");
		query.setParameter(3, "%" + keyword + "%");
		return query.list();
	}

}
