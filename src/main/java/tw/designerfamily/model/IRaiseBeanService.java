package tw.designerfamily.model;

import java.util.List;

public interface IRaiseBeanService {
	public void insert(RaiseBean tBean);
	public List<RaiseBean> selectAll();
	public RaiseBean selectById(int id);
	public void update(RaiseBean tBean);
	public void deleteById(int id);
}
