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
public class ForumDao implements IForumDao{
	
	@Autowired
    private SessionFactory sessionFactory;
    
	//新增
    @Override
    public ForumBean insert(ForumBean fBean) {
    	Session session = sessionFactory.getCurrentSession();
    	ForumBean resultBean = session.get(ForumBean.class, fBean.getForumid());
    	
    	if(resultBean==null) {
			session.save(fBean);
		}		
		
		return fBean;
	}
    
    //查詢全部
    @Override
    public List<ForumBean> selectAll(){
    	Session session = sessionFactory.getCurrentSession();
    	Query<ForumBean> query = session.createQuery("from ForumBean Order By forumid DESC", ForumBean.class);
    	List<ForumBean> qlist = query.list();
    	
    	return qlist;
    	
    }
    
    //更新
	@Override
    public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time, String forumUpdate_time,String forumAccount,
			String forumCategory){
		Session session = sessionFactory.getCurrentSession();
    	ForumBean resultBean = session.get(ForumBean.class, forumid);
		if (resultBean != null) {
			resultBean.setForumSubject(forumSubject);
			resultBean.setForumDescription(forumDescription);
			resultBean.setForumCreate_time(forumCreate_time);
			resultBean.setForumUpdate_time(forumUpdate_time);
			resultBean.setForumAccount(forumAccount);
			resultBean.setForumCategory(forumCategory);
		}
		
		return resultBean;		  	
    }
	
	//刪除
    @Override
    public boolean delete(int forumid) {
    	Session session = sessionFactory.getCurrentSession();
    	ForumBean resultBean = session.get(ForumBean.class, forumid);
		if (resultBean != null) {
			session.delete(resultBean);
			session.flush();
    		
			return true;
		}
		
		return false;		  	
    }

    
    
    //由主題查詢
	@Override
	public List<ForumBean> selectBySubject(String forumSubject){
		Session session = sessionFactory.getCurrentSession();
		Query<ForumBean> query = session.createQuery("from ForumBean where forumsubject like ?0  Order By forumid DESC", ForumBean.class);
		query.setParameter(0, "%" + forumSubject + "%");
		
		return query.list();
	}

	@Override
	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time,
			String forumAccount, String forumCategory) {
		
		return null;
	}
	
	//由id查詢 先不用
		@Override
		public ForumBean selectById(int forumid) {
			Session session = sessionFactory.getCurrentSession();
			return session.get(ForumBean.class, forumid);
		}

		@Override
		public ForumBean update(ForumBean fBean) {
			Session session = sessionFactory.getCurrentSession();
			session.update(fBean);
			return fBean;
		}

	}

//	@Override
//	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time,
//			String forumAccount, String forumCategory) {
//		// TODO Auto-generated method stub
//		return null;
//	}

