package tw.designerfamily.model;

import java.io.Serializable;
import java.util.List;
import org.hibernate.query.Query;

import org.hibernate.Session;

public class OrderDao implements IDesignerBeanDao<Order> {
	
	private Session session;
	
    public OrderDao() {
		
	}
    
    public OrderDao(Session session) {
    	this.session=session;
    }


	public void insert(Order tBean) {
		Order resultBean = session.get(Order.class, tBean.getOrderNo());
		if(resultBean == null) {
			session.save(tBean);
		}else {
			System.out.println("資料庫已存在資料，未新增。");
		}
		
	}

	@Override
	public List<Order> selectAll() {
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
		return session.get(Order.class, id);
	}

	@Override
	public void update(Order tBean) {
		session.update(tBean);
	}

	@Override
	public void deleteById(int id) {
		Order resultBean = session.get(Order.class, id);
		session.delete(resultBean);
	
		
	}
	
	public List<Order> search(String key){
		Query<Order> query = session.createQuery("from Order where orderKey like ?0 or orderowner like ?1 or ordername like ?2  Order By orderno DESC", Order.class);
		query.setParameter(0, "%" + key + "%");
		query.setParameter(1, "%" + key + "%");
		query.setParameter(2, "%" + key + "%");
		return query.list();
		
	}
	
	public Order updateorder(int orderNo, int orderQty, int orderPrice, String orderStatus ) {
		
        Order resultBean = session.get(Order.class, orderNo);
		
		if(resultBean != null) {
			resultBean.setOrderPrice(orderPrice);
			resultBean.setOrderQty(orderQty);
			resultBean.setOrderStatus(orderStatus);
		}
		
		return resultBean;
	}
	

}
