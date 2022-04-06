package tw.designerfamily.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OrderService implements IDesignerOrderService {
	
	@Autowired
	private IDesignerOrderDao oDao;

	@Override
	public void insert(Order o) {
		oDao.insert(o);
		
	}

	@Override
	public List<Order> selectAll() {
		return oDao.selectAll();
	}

	@Override
	public Order selectById(int id) {
		return oDao.selectById(id);
	}

	@Override
	public void update(Order o) {
		oDao.update(o);
		
	}

	@Override
	public void deleteById(int id) {
		oDao.deleteById(id);
		
	}

	@Override
	public List<Order> search(String key) {
		return oDao.search(key);
	}

	@Override
	public Order updateorder(int orderNo, int orderQty, int orderPrice, String orderStatus) {
		return oDao.updateorder(orderNo, orderQty, orderPrice, orderStatus);
	}

	@Override
	public List<Order> detail(int key) {
		
		return oDao.detail(key);
	}
	
	


}
