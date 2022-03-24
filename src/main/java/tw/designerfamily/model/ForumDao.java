package tw.designerfamily.model;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.query.Query;




public class ForumDao implements IForumDao{
	
    private Session session;
    
    public ForumDao() {    	
    }
    
    public ForumDao(Session session) {
    	this.session = session;
    }
    @Override
    public ForumBean insert(ForumBean fBean) {
    		session.save(fBean);
    		return fBean;

    }
//    @Override
//    public ForumBean selectBySubject(String forumSubject) {
//		return session.get(ForumBean.class, forumSubject);//get改用query 97
//    	
//    }
    @Override
    public List<ForumBean> selectAll(){
    	//Query<ForumBean> query = session.createQuery("from ForumBean",ForumBean.class);
    	Query<ForumBean> query = session.createQuery("from ForumBean Order By forumid DESC", ForumBean.class);
    	return query.list();
    	
    }
    
	@Override
    public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time, String forumUpdate_time,String forumAccount,
			String forumCategory){
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
    @Override
    public boolean delete(int forumid) {
    	ForumBean resultBean = session.get(ForumBean.class, forumid);
		if (resultBean != null) {
			session.delete(resultBean);
			return true;
		}
		return false;		  	
    }

	@Override
	public ForumBean selectById(int forumid) {
		
		return session.get(ForumBean.class, forumid);
	}

//	public void update(ForumBean fBean) {
//		session.update(fBean);
		
//	}
	public List<ForumBean> selectBySubject(String forumSubject){
		Query<ForumBean> query = session.createQuery("from ForumBean where forumsubject like ?0  Order By forumid DESC", ForumBean.class);
		query.setParameter(0, "%" + forumSubject + "%");		
		return query.list();
	}

	@Override
	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time,
			String forumAccount, String forumCategory) {
		
		return null;
	}

	public void update(ForumBean fBean) {
		session.update(fBean);
		
	}

//	@Override
//	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time,
//			String forumAccount, String forumCategory) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	
	
}

