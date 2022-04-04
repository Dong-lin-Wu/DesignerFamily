package tw.designerfamily.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class RaisePlanDao implements IDesignerBeanDao<RaisePlanBean> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	

	@Override
	public void insert(RaisePlanBean tBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(tBean);
	}


	@Override
	public List<RaisePlanBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<RaisePlanBean> query = session.createQuery("from RaisePlanBean", RaisePlanBean.class);
		if(query != null) {
			List<RaisePlanBean> list = query.list();
			return list;
		}else {
			System.out.println("RaisePlanDao查不到所有資料");
			return null;
		}
	}


	@Override
	public RaisePlanBean selectById(int id) {
		Session session = sessionFactory.getCurrentSession();
		RaisePlanBean rpBean = session.get(RaisePlanBean.class, id);
		return rpBean;
	}


	@Override
	public void update(RaisePlanBean tBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(tBean);
	}


	@Override
	public void deleteById(int id) {
		Session session = sessionFactory.getCurrentSession();
		RaisePlanBean resultBean = session.get(RaisePlanBean.class, id);
		session.delete(resultBean);
	}
	


}
