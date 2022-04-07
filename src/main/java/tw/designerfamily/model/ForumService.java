package tw.designerfamily.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ForumService implements IForumService {
	
	@Autowired
	private IForumDao fDao;
	
	@Override
	public ForumBean insert(ForumBean fBean) {
		return fDao.insert(fBean);
	}

	@Override
	public ForumBean selectById(int forumid) {
		return fDao.selectById(forumid);
	}

	@Override
	public List<ForumBean> selectBySubject(String forumSubject) {
		return fDao.selectBySubject(forumSubject);
	}

	@Override
	public List<ForumBean> selectAll() {
		return fDao.selectAll();
	}

	@Override
	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time,
			String forumAccount, String forumCategory) {
		return fDao.update(forumid, forumSubject, forumDescription, forumCreate_time, forumAccount, forumCategory) ;
	}

	@Override
	public boolean delete(int forumid) {
		return fDao.delete(forumid);
	}

	@Override
	public ForumBean update(int forumid, String forumSubject, String forumDescription, String forumCreate_time,
			String forumUptate_time, String forumAccount, String forumCategory) {
		return fDao.update(forumid, forumSubject, forumDescription, forumCreate_time, forumUptate_time, forumAccount, forumCategory);
	}

	@Override
	public ForumBean update(ForumBean fBean) {
		
		return fDao.update(fBean);
	}
	
	
	

}
