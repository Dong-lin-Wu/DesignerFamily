package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class RaiseDao implements IRaiseDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(RaiseBean tBean) {
		Session session = sessionFactory.getCurrentSession();
		RaiseBean resultBean = session.get(RaiseBean.class, tBean.getRaiseNo());
		if(resultBean == null) {
			session.save(tBean);
		}else {
			System.out.println("資料庫已存在資料，未新增。");
		}

	}

	@Override
	public List<RaiseBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<RaiseBean> query = session.createQuery("from RaiseBean Order By RaiseNo DESC", RaiseBean.class);
		if(query != null) {
			List<RaiseBean> qlist = query.list();
			return qlist;			
		}else {
			System.out.println("RaiseDao查不到所有資料");
			return null;
		}
		
	}

	@Override
	public RaiseBean selectById(int id) {
		Session session = sessionFactory.getCurrentSession();
		RaiseBean raiseBean = session.get(RaiseBean.class, id);
		return raiseBean;
	}


	@Override
	public void update(RaiseBean tBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(tBean);
	}

	@Override
	public void deleteById(int id) {
		Session session = sessionFactory.getCurrentSession();
		RaiseBean resultBean = session.get(RaiseBean.class, id);
//		System.out.println("id= "+resultBean.getRaiseNo()+" delete= "+ resultBean);
		session.delete(resultBean);
	}
	
	//共用介面之外的方法
	@Override
	public List<RaiseBean> searchByKey(String key){
		Session session = sessionFactory.getCurrentSession();
		Query<RaiseBean> query = session.createQuery("from RaiseBean where RaiseTitle like ?0 or RaiseBreif like ?1  Order By RaiseNo DESC", RaiseBean.class);
		query.setParameter(0, "%" + key + "%");
		query.setParameter(1, "%" + key + "%");
		List<RaiseBean> qlist = query.list();
		return qlist;
	}
	
	@Override
	public void updateStatus(int id, String status) {
		Session session = sessionFactory.getCurrentSession();
		RaiseBean resultBean = session.get(RaiseBean.class, id);
		if(resultBean != null) {
			resultBean.setRaiseStatus(status);
		} else {
			System.out.println("修改資料有誤");
		}
		
		
	}
	

}
