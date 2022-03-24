package tw.designerfamily.model;

import java.util.List;

public interface IMemberDao {
	public List<Member> selectAll();

	public Member selectById(int id);

	public Status selectStatus(int statusId);
	
	public List<Member> selectByPhoneAccountEmail(String keyword);

	public List<Member> selectLogin(String account, String password);

	public List<Member> selectRegister(String phone, String account, String email);

	public Member insert(Member m, Status s);

	public Member update(Member m);

	public boolean delete(int id);

}
