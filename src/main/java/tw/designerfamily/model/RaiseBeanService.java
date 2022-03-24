package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;

public class RaiseBeanService implements IDesignerBeanService<RaiseBean> {
	
	private RaiseDao rDao;
	
	public RaiseBeanService(Session session) {
		rDao = new RaiseDao(session);
	}

	@Override
	public void insert(RaiseBean tBean) {
		rDao.insert(tBean);
	}

	@Override
	public List<RaiseBean> selectAll() {
		return rDao.selectAll();
	}

	@Override
	public RaiseBean selectById(int id) {
		return rDao.selectById(id);
	}

	@Override
	public void update(RaiseBean tBean) {
		rDao.update(tBean);		
	}

	@Override
	public void deleteById(int id) {
		rDao.deleteById(id);
	}
	
	//介面之外的方法
	public List<RaiseBean> searchByKey(String key){
		return rDao.searchByKey(key);
	}
	
	public void updateStatus(int id, String status) {
		rDao.updateStatus(id, status);
	}
	

}
