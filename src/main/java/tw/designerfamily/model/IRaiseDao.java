package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public interface IRaiseDao {
	public void insert(RaiseBean tBean);
	public List<RaiseBean> selectAll();
	public RaiseBean selectById(int id);
	public void update(RaiseBean tBean);
	public void deleteById(int id);
	public List<RaiseBean> searchByKey(String key);
	public void updateStatus(int id, String status);
}
