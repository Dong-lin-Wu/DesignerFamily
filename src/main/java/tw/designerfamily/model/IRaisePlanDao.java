package tw.designerfamily.model;

import java.util.List;

public interface IRaisePlanDao {

	void insert(RaisePlanBean tBean);

	List<RaisePlanBean> selectAll();

	RaisePlanBean selectById(int id);

	void update(RaisePlanBean tBean);

	void deleteById(int id);

}