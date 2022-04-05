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
public class MemberDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Member> selectAll() {
		Session session = sessionFactory.getCurrentSession();

		Query<Member> query = session.createQuery("from Member m order by m.id", Member.class);
		List<Member> list = query.list();

		return list;
	}

	public Member selectById(int id) {
		Session session = sessionFactory.getCurrentSession();

		Member member = session.get(Member.class, id);

		return member;
	}

	public Status selectStatus(int statusId) {
		Session session = sessionFactory.getCurrentSession();

		Status status = session.get(Status.class, statusId);

		return status;
	}

	public List<Member> selectByPhoneAccountEmail(String keyword) {
		Session session = sessionFactory.getCurrentSession();

		Query<Member> query = session.createQuery(
				"from Member m where m.phone like ?0 or m.account like ?0 or m.email like ?0 order by m.id",
				Member.class);
		query.setParameter(0, "%" + keyword + "%");
		List<Member> list = query.list();

		return list;
	}

	public Member selectLogin(String account, String password) {
		Session session = sessionFactory.getCurrentSession();

		Query<Member> query = session.createQuery(
				"from Member m where (m.phone = ?0 or m.account = ?0 or m.email = ?0) and m.password = ?1 order by m.id",
				Member.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		Member member = query.uniqueResult();

		return member;
	}

	public Member selectRegister(String phone, String account, String email) {
		Session session = sessionFactory.getCurrentSession();

		Query<Member> query = session.createQuery(
				"from Member m where m.phone = ?0 or m.account = ?1 or m.email = ?2 order by m.id", Member.class);
		query.setParameter(0, phone);
		query.setParameter(1, account);
		query.setParameter(2, email);
		Member member = query.uniqueResult();

		return member;
	}

	public Member insert(Member m, Status s) {
		Session session = sessionFactory.getCurrentSession();

		Status status = session.get(Status.class, s.getStatusId());

		if (status == null) {
			session.save(s);
		} else {
			session.save(m);
		}

		return m;
	}

	public Member update(Member m) {
		Session session = sessionFactory.getCurrentSession();

		Member member = session.get(Member.class, m.getId());

		if (member != null) {
			session.merge(m);

			return m;
		}

		return null;
	}

	public boolean delete(int id) {
		Session session = sessionFactory.getCurrentSession();

		Member member = session.get(Member.class, id);

		if (member != null) {
			session.delete(member);

			return true;
		}

		return false;
	}

}
