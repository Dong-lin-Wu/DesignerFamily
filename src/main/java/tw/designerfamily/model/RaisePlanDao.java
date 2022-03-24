package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class RaisePlanDao implements IDesignerBeanDao<RaisePlanBean> {
	
	private Session session;
	
	public RaisePlanDao() {
	}
	
	public RaisePlanDao(Session session) {
		this.session = session;
	}
	
	@Override
	public void insert(RaisePlanBean tBean) {
		session.save(tBean);
	}

	@Override
	public List<RaisePlanBean> selectAll() {
		Query<RaisePlanBean> query = session.createQuery("from RaisePlanBean", RaisePlanBean.class);
		if(query != null) {
			return query.list();
		}else {
			System.out.println("RaisePlanDao查不到所有資料");
			return null;
		}
	}

	@Override
	public RaisePlanBean selectById(int id) {
		return session.get(RaisePlanBean.class, id);
	}

	@Override
	public void update(RaisePlanBean tBean) {
		session.update(tBean);		
	}

	@Override
	public void deleteById(int id) {
		RaisePlanBean resultBean = session.get(RaisePlanBean.class, id);
		session.delete(resultBean);
	}
	


}
