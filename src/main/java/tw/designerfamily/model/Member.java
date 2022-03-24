package tw.designerfamily.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "member")
public class Member implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "ACCOUNT")
	private String account;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "PHONE")
	private String phone;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "BIRTHDAY")
	private Timestamp birthday;

	@Column(name = "PHOTO")
	private String photo;

	@Column(name = "REGISTERTIME")
	private Timestamp registerTime;

	@Transient
	private int statusId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "STATUSID")
	private Status status;

	@Column(name = "GOOGLEID")
	private String googleId;

	@Column(name = "FACEBOOKID")
	private String facebookId;

	public Member() {
	}

	public Member(int id, String account, String password, String name, String email, String phone, String gender,
			Timestamp birthday, String photo, Timestamp registerTime, int statusId) {
		this.id = id;
		this.account = account;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.registerTime = registerTime;
		this.statusId = statusId;
	}

	public Member(String account, String password, String name, String email, String phone, String gender,
			Timestamp birthday, String photo, Timestamp registerTime, int statusId) {
		this.account = account;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.registerTime = registerTime;
		this.statusId = statusId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Timestamp getBirthday() {
		return birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getGoogleId() {
		return googleId;
	}

	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}

	public String getFacebookId() {
		return facebookId;
	}

	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}

}
