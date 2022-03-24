package tw.designerfamily.model;

import java.util.List;

public interface IForumDao {
	public ForumBean insert(ForumBean fBean);
	public ForumBean selectById(int forumid);
	public List<ForumBean> selectBySubject(String forumSubject);
	public List<ForumBean> selectAll();
	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time, String forumAccount,
			String forumCategory);
	public boolean delete(int forumid);
	
	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time,
			String forumUptate_time, String forumAccount, String forumCategory);
	 
	 

}
