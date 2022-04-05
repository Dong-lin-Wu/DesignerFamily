package tw.designerfamily.model;

import java.util.List;


public interface IDesignerProductDao {
	
	public void insert(ProductBean p);
	public List<ProductBean> selectAll();
	public ProductBean selectById(int id);
	public void update(ProductBean p);
	public void deleteById(int id);
	public List<ProductBean> findByKeyword(String keyword);

}
