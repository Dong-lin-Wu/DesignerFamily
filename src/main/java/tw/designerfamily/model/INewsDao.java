package tw.designerfamily.model;

import java.util.List;

public interface INewsDao {
	
	public void insert(NewsBean nBean);
	
	public List<NewsBean> selectAll();
	
	public NewsBean selectById(int id);
	
	public void update(NewsBean nBean);
	
	public void deleteById(int id);
	
	public List<NewsBean> searchByKey(String key);
	
}
