package tw.designerfamily.model;

import java.util.List;


public interface IDesignerBeanService<T> {
	public void insert(T tBean);
	public List<T> selectAll();
	public T selectById(int id);
	public void update(T tBean);
	public void deleteById(int id);
}
