package tw.designerfamily.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RaiseBeanService implements IRaiseBeanService {
	
	@Autowired
	private IRaiseDao rDao;

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
	
	//共用介面之外的方法
	@Override
	public List<RaiseBean> searchByKey(String key){
		return rDao.searchByKey(key);
	}
	
	@Override
	public void updateStatus(int id, String status) {
		rDao.updateStatus(id, status);
	}
	

}
