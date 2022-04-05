package tw.designerfamily.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberDao mDao;

	public List<Member> selectAll() {
		return mDao.selectAll();
	}

	public Member selectById(int id) {
		return mDao.selectById(id);
	}

	public Status selectStatus(int statusId) {
		return mDao.selectStatus(statusId);
	}

	public List<Member> selectByPhoneAccountEmail(String keyword) {
		return mDao.selectByPhoneAccountEmail(keyword);
	}

	public Member selectLogin(String account, String password) {
		return mDao.selectLogin(account, password);
	}

	public Member selectRegister(String phone, String account, String email) {
		return mDao.selectRegister(phone, account, email);
	}

	public Member insert(Member m, Status s) {
		return mDao.insert(m, s);
	}

	public Member update(Member m) {
		return mDao.update(m);
	}

	public boolean delete(int id) {
		return mDao.delete(id);
	}

}
