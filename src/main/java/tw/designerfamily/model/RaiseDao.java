package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class RaiseDao implements IDesignerBeanDao<RaiseBean> {
	
	private Session session;
	
	public RaiseDao() {
	}
	
	public RaiseDao(Session session) {
		this.session = session;
	}

	@Override
	public void insert(RaiseBean tBean) {
		RaiseBean resultBean = session.get(RaiseBean.class, tBean.getRaiseNo());
		if(resultBean == null) {
			session.save(tBean);
		}else {
			System.out.println("資料庫已存在資料，未新增。");
		}
	}

	@Override
	public List<RaiseBean> selectAll() {
		Query<RaiseBean> query = session.createQuery("from RaiseBean Order By RaiseNo DESC", RaiseBean.class);
		if(query != null) {
			return query.list();			
		}else {
			System.out.println("RaiseDao查不到所有資料");
			return null;
			
		}
	}

	@Override
	public RaiseBean selectById(int id) {
		return session.get(RaiseBean.class, id);
	}


	@Override
	public void update(RaiseBean tBean) {
		session.update(tBean);		
	}

	@Override
	public void deleteById(int id) {
		RaiseBean resultBean = session.get(RaiseBean.class, id);
//		System.out.println("id= "+resultBean.getRaiseNo()+" delete= "+ resultBean);
		session.delete(resultBean);
	}
	
	//介面之外的方法
	public List<RaiseBean> searchByKey(String key){
		Query<RaiseBean> query = session.createQuery("from RaiseBean where RaiseTitle like ?0 or RaiseBreif like ?1  Order By RaiseNo DESC", RaiseBean.class);
		query.setParameter(0, "%" + key + "%");
		query.setParameter(1, "%" + key + "%");
		return query.list();
	}
	
	public void updateStatus(int id, String status) {
		RaiseBean resultBean = session.get(RaiseBean.class, id);
		if(resultBean != null) {
			resultBean.setRaiseStatus(status);
		} else {
			System.out.println("修改資料有誤");
		}
		
		
	}
	

}
