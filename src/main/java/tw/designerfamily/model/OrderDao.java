package tw.designerfamily.model;

import java.io.Serializable;
import java.util.List;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@Repository
@Transactional
public class OrderDao implements IDesignerOrderDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
    @Override
	public void insert(Order o) {
		Session session = sessionFactory.getCurrentSession();
		Order resultBean = session.get(Order.class, o.getOrderNo());
		if(resultBean == null) {
			session.save(o);
		}else {
			System.out.println("資料庫已存在資料，未新增。");
		}

	}

	@Override
	public List<Order> selectAll() {
		Session session = sessionFactory.getCurrentSession();
        Query<Order> query = session.createQuery("from Order order by orderno desc",Order.class);
		if(query != null) {
			return query.list();	
		}else {
			System.out.println("查不到所有資料");
			return null;
		}
	}

	@Override
	public Order selectById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Order.class, id);
	}

	@Override
	public void update(Order o) {
		Session session = sessionFactory.getCurrentSession();
		session.update(o);
	}

	@Override
	public void deleteById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Order resultBean = session.get(Order.class, id);
		session.delete(resultBean);
	
		
	}
	
	@Override
	public List<Order> search(String key){
		Session session = sessionFactory.getCurrentSession();
		Query<Order> query = session.createQuery("from Order where orderKey like ?0 or orderowner like ?1  Order By orderno DESC", Order.class);
		query.setParameter(0, "%" + key + "%");
		query.setParameter(1, "%" + key + "%");
		return query.list();
		
	}
	
	@Override
	public Order updateorder(int orderNo, int orderQty, int orderPrice, String orderStatus ) {
		Session session = sessionFactory.getCurrentSession();
        Order resultBean = session.get(Order.class, orderNo);
		
		if(resultBean != null) {
			resultBean.setOrderPrice(orderPrice);
			resultBean.setOrderQty(orderQty);
			resultBean.setOrderStatus(orderStatus);
		}
		
		return resultBean;
	}

	@Override
	public List<Order> detail(int key) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr="from Order where orderNo = :key";
		Query<Order> query = session.createQuery(hqlstr,Order.class);
		query.setParameter("key", key);
		return query.list();
	}
	
	

}
