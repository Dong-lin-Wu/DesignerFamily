package tw.designerfamily.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "forum")
@Component
public class ForumBean {
private static final long serialVersionUID = 1L;
	
	@Id	@Column(name = "FORUMID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int forumid;
	
	@Column(name = "FORUMSUBJECT")
	private String forumSubject;
	
	@Column(name = "FORUMDESCRIPTION")
	private String forumDescription;
	
	@Column(name = "FORUMCREATE_TIME")
	private String forumCreate_time;
	
	@Column(name = "FORUMUPDATE_TIME")
	private String forumUpdate_time;
	
	@Column(name = "FORUMACCOUNT")
	private String forumAccount;
	
	@Column(name = "FORUMCATEGORY")
	private String forumCategory;
	
	public ForumBean() {
	}
	//新增使用
	public ForumBean(String forumSubject, String forumDescription, String forumAccount,
			String forumCategory) {
		super();
		this.forumSubject = forumSubject;
		this.forumDescription = forumDescription;
		this.forumAccount = forumAccount;
		this.forumCategory = forumCategory;
		this.forumCreate_time = getTime();
		this.forumUpdate_time = getTime();
	}
	//修改使用
	public ForumBean(int forumid, String forumSubject, String forumDescription, String forumCreate_time, String forumUpdate_time,String forumAccount,
			String forumCategory) {
		super();
		this.forumid = forumid;
		this.forumSubject = forumSubject;
		this.forumDescription = forumDescription;
		this.forumCreate_time = forumCreate_time;
		this.forumUpdate_time = forumUpdate_time;
		this.forumAccount = forumAccount;
		this.forumCategory = forumCategory;
	}
	public int getForumid() {
		return forumid;
	}
	public void setForumid(int forumid) {
		this.forumid = forumid;
	}
	public String getForumSubject() {
		return forumSubject;
	}
	public void setForumSubject(String forumSubject) {
		this.forumSubject = forumSubject;
	}
	public String getForumDescription() {
		return forumDescription;
	}
	public void setForumDescription(String forumDescription) {
		this.forumDescription = forumDescription;
	}
	public String getForumCreate_time() {
		return forumCreate_time;
	}
	public void setForumCreate_time(String forumCreate_time) {
		this.forumCreate_time = forumCreate_time;
	}
	public String getForumUpdate_time() {
		return forumUpdate_time;
	}
	public void setForumUpdate_time(String forumUpdate_time) {
		this.forumUpdate_time = forumUpdate_time;
	}
	public String getForumAccount() {
		return forumAccount;
	}
	public void setForumAccount(String forumAccount) {
		this.forumAccount = forumAccount;
	}
	public String getForumCategory() {
		return forumCategory;
	}
	public void setForumCategory(String forumCategory) {
		this.forumCategory = forumCategory;
	}
	
	
	private String getTime(){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date now = new Date();
			return simpleDateFormat.format(now);		
	}

	

	
}

