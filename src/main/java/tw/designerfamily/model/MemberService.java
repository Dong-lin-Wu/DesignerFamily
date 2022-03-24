package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;

public class MemberService implements IMemberService {

	private MemberDao mDao;

	public MemberService(Session session) {
		mDao = new MemberDao(session);
	}

	@Override
	public List<Member> selectAll() {
		return mDao.selectAll();
	}

	@Override
	public Member selectById(int id) {
		return mDao.selectById(id);
	}

	@Override
	public Status selectStatus(int statusId) {
		return mDao.selectStatus(statusId);
	}

	@Override
	public List<Member> selectByPhoneAccountEmail(String keyword) {
		return mDao.selectByPhoneAccountEmail(keyword);
	}

	@Override
	public List<Member> selectLogin(String account, String password) {
		return mDao.selectLogin(account, password);
	}

	@Override
	public List<Member> selectRegister(String phone, String account, String email) {
		return mDao.selectRegister(phone, account, email);
	}

	@Override
	public Member insert(Member m, Status s) {
		return mDao.insert(m, s);
	}

	@Override
	public Member update(Member m) {
		return mDao.update(m);
	}

	@Override
	public boolean delete(int id) {
		return mDao.delete(id);
	}

}
