package tw.designerfamily.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class RaisePlanBeanService implements IDesignerBeanService<RaisePlanBean> {
	
	@Autowired
	private IDesignerBeanDao<RaisePlanBean> rpDao;
	
	
	
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
