package tw.designerfamily.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class MemberDao implements IMemberDao {

	private Session session;

	public MemberDao() {
	}

	public MemberDao(Session session) {
		this.session = session;
	}

	@Override
	public List<Member> selectAll() {
		Query<Member> query = session.createQuery("from Member m order by m.id", Member.class);
		return query.list();
	}

	@Override
	public Member selectById(int id) {
		return session.get(Member.class, id);
	}

	@Override
	public Status selectStatus(int statusId) {
		return session.get(Status.class, statusId);
	}

	@Override
	public List<Member> selectByPhoneAccountEmail(String keyword) {
		Query<Member> query = session.createQuery(
				"from Member m where m.phone like ?0 or m.account like ?0 or m.email like ?0 order by m.id",
				Member.class);
		query.setParameter(0, "%" + keyword + "%");
		return query.list();
	}

	@Override
	public List<Member> selectLogin(String account, String password) {
		Query<Member> query = session.createQuery(
				"from Member m where (m.phone = ?0 or m.account = ?0 or m.email = ?0) and m.password = ?1 order by m.id",
				Member.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		return query.list();
	}

	@Override
	public List<Member> selectRegister(String phone, String account, String email) {
		Query<Member> query = session.createQuery(
				"from Member m where m.phone = ?0 or m.account = ?1 or m.email = ?2 order by m.id", Member.class);
		query.setParameter(0, phone);
		query.setParameter(1, account);
		query.setParameter(2, email);
		return query.list();
	}

	@Override
	public Member insert(Member m, Status s) {
		MemberService mService = new MemberService(session);
		List<Member> list = mService.selectRegister(m.getPhone(), m.getAccount(), m.getEmail());
		Status status = session.get(Status.class, s.getStatusId());

		if (list.isEmpty()) {
			if (status == null) {
				session.save(s);
			} else {
				session.save(m);
			}

			return m;
		}

		return null;
	}

	@Override
	public Member update(Member m) {
		Member member = session.get(Member.class, m.getId());

		if (member != null) {
			session.merge(m);
			return m;
		}

		return null;
	}

	@Override
	public boolean delete(int id) {
		Member member = session.get(Member.class, id);

		if (member != null) {
			session.delete(member);
			return true;
		}

		return false;
	}

}
