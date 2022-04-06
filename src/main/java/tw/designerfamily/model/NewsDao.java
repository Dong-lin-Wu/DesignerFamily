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
public class NewsDao implements INewsDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public NewsDao() {

	}


	@Override
	public void insert(NewsBean tBean) {
		Session session = sessionFactory.getCurrentSession();
		NewsBean resultBean = session.get(NewsBean.class, tBean.getNewsId());
		if (resultBean == null) {
			session.save(tBean);
		} else {
			System.out.println("資料庫已存在資料，未新增。");
		}
	}

	@Override
	public List<NewsBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<NewsBean> query = session.createQuery("from NewsBean Order By NewsId DESC", NewsBean.class);
		if (query != null) {
			return query.list();
		} else {
			System.out.println("查詢全部資料有誤");
			return null;
		}
	}

	@Override
	public NewsBean selectById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(NewsBean.class, id);
	}

	@Override
	public void update(NewsBean tBean) {
		Session session = sessionFactory.getCurrentSession();
		session.update(tBean);
	}

	@Override
	public void deleteById(int id) {
		Session session = sessionFactory.getCurrentSession();
		NewsBean resultBean = session.get(NewsBean.class, id);
		System.out.println("id= " + resultBean.getNewsId() + " delete= " + resultBean);
		session.delete(resultBean);
	}
	
	//關鍵字查詢(標題、副標題、活動內容)
	@Override
	public List<NewsBean> searchByKey(String key){
		Session session = sessionFactory.getCurrentSession();
		Query<NewsBean> query = session.createQuery("from NewsBean where NewsTitle like ?0 or NewsSubtitle like ?1 or NewsContent like ?2 Order By NewsID DESC", NewsBean.class);
		query.setParameter(0, "%" + key + "%");
		query.setParameter(1, "%" + key + "%");
		query.setParameter(2, "%" + key + "%");
		return query.list();
	}
	
	
}
