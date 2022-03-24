package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;

public class RaisePlanBeanService implements IDesignerBeanService<RaisePlanBean>{
	
	private RaisePlanDao rpDao;
	
	public RaisePlanBeanService(Session session) {
		rpDao = new RaisePlanDao(session);
	}
	
	@Override
	public void insert(RaisePlanBean tBean) {
		rpDao.insert(tBean);		
	}

	@Override
	public List<RaisePlanBean> selectAll() {
		return rpDao.selectAll();
	}

	@Override
	public RaisePlanBean selectById(int id) {
		return rpDao.selectById(id);
	}

	@Override
	public void update(RaisePlanBean tBean) {
		rpDao.update(tBean);
	}

	@Override
	public void deleteById(int id) {
		rpDao.deleteById(id);		
	}

}
