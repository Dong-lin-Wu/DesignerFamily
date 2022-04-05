package tw.designerfamily.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductBeanService implements IDesignerProductService {
	
	@Autowired
	private IDesignerProductDao iDao;

	@Override
	public void insert(ProductBean p) {
		iDao.insert(p);
		
	}

	@Override
	public List<ProductBean> selectAll() {
		
		return iDao.selectAll();
	}

	@Override
	public ProductBean selectById(int id) {
		
		return iDao.selectById(id);
	}

	@Override
	public void update(ProductBean p) {
		iDao.update(p);
		
	}

	@Override
	public void deleteById(int id) {
		iDao.deleteById(id);
		
	}

	@Override
	public List<ProductBean> findByKeyword(String keyword) {
		
		return iDao.findByKeyword(keyword);
	}

}
