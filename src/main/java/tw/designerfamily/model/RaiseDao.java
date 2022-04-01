package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
		Session session = sessionFactory.openSession();
		RaiseBean resultBean = session.get(RaiseBean.class, tBean.getRaiseNo());
		if(resultBean == null) {
			session.save(tBean);
		}else {
			System.out.println("資料庫已存在資料，未新增。");
		}
		
		session.close();

	}

	@Override
	public List<RaiseBean> selectAll() {
		Session session = sessionFactory.openSession();
		Query<RaiseBean> query = session.createQuery("from RaiseBean Order By RaiseNo DESC", RaiseBean.class);
		if(query != null) {
			List<RaiseBean> qlist = query.list();
			session.close();
			return qlist;			
		}else {
			System.out.println("RaiseDao查不到所有資料");
			session.close();
			return null;
		}
		
	}

	@Override
	public RaiseBean selectById(int id) {
		Session session = sessionFactory.openSession();
		RaiseBean raiseBean = session.get(RaiseBean.class, id);
		session.close();
		return raiseBean;
	}


	@Override
	public void update(RaiseBean tBean) {
		Session session = sessionFactory.openSession();
		session.update(tBean);
		session.close();
	}

	@Override
	public void deleteById(int id) {
		Session session = sessionFactory.openSession();
		RaiseBean resultBean = session.get(RaiseBean.class, id);
		System.out.println("id= "+resultBean.getRaiseNo()+" delete= "+ resultBean);
		session.delete(resultBean);
		session.close();
	}
	
	//介面之外的方法
	public List<RaiseBean> searchByKey(String key){
		Session session = sessionFactory.openSession();
		Query<RaiseBean> query = session.createQuery("from RaiseBean where RaiseTitle like ?0 or RaiseBreif like ?1  Order By RaiseNo DESC", RaiseBean.class);
		query.setParameter(0, "%" + key + "%");
		query.setParameter(1, "%" + key + "%");
		List<RaiseBean> qlist = query.list();
		session.close();
		return qlist;
	}
	
	public void updateStatus(int id, String status) {
		Session session = sessionFactory.openSession();
		RaiseBean resultBean = session.get(RaiseBean.class, id);
		if(resultBean != null) {
			resultBean.setRaiseStatus(status);
			session.close();
		} else {
			System.out.println("修改資料有誤");
			session.close();
		}
		
		
	}
	

}
