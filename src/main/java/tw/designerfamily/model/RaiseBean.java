package tw.designerfamily.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name = "raise") @DynamicInsert
@Component
public class RaiseBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id	@Column(name = "RAISENO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int raiseNo;
	
	@Column(name = "RAISENAME")
	private String raiseName;
	
	@Column(name = "RAISETITLE")
	private String raiseTitle;
	
	@Column(name = "RAISEBRIEF")
	private String raiseBrief;
	
	@Column(name = "RAISECATEGORY")
	private String raiseCategory;
	
	@Column(name = "RAISEPICNAME")
	private String raisePicName;
	
	@Column(name = "RAISEPICBASE64")
	private String raisePicBase64;
	
	@Column(name = "RAISETARGET")
	private int raiseTarget;
	
	@Column(name = "RAISESDATE")
	private String raiseSDate;
	
	@Column(name = "RAISEEXPDATE")
	private String raiseExpDate;
	
	@Column(name = "RAISEDESCRIBE")
	private String raiseDescribe;
	
	@Column(name = "RAISESTATUS",columnDefinition = "varchar(20) default 'Pending'")
	private String raiseStatus;
	
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "raiseBean")
	private Set<RaisePlanBean> raisePlanBeanSet =new LinkedHashSet<RaisePlanBean>(0);
	
	public RaiseBean() {		
	}
	//新增資料使用
	public RaiseBean(String raiseName, String raiseTitle, String raiseBrief, String raiseCategory, String raisePicName,String raisePicBase64,
			int raiseTarget, String raiseSDate, String raiseExpDate, String raiseDescribe) {
		this.raiseName = raiseName;
		this.raiseTitle = raiseTitle;
		this.raiseBrief = raiseBrief;
		this.raiseCategory = raiseCategory;
		this.raisePicName = raisePicName;
		this.raisePicBase64 = raisePicBase64;
		this.raiseTarget = raiseTarget;
		this.raiseSDate = raiseSDate;
		this.raiseExpDate = raiseExpDate;
		this.raiseDescribe = raiseDescribe;
	}
	//修改資料使用
	public RaiseBean(int raiseNo, String raiseName, String raiseTitle, String raiseBrief, String raiseCategory, String raisePicName,
			String raisePicBase64, int raiseTarget, String raiseSDate, String raiseExpDate, String raiseDescribe, String raiseStatus) {
		this.raiseNo = raiseNo;
		this.raiseName = raiseName;
		this.raiseTitle = raiseTitle;
		this.raiseBrief = raiseBrief;
		this.raiseCategory = raiseCategory;
		this.raisePicName = raisePicName;
		this.raisePicBase64 = raisePicBase64;
		this.raiseTarget = raiseTarget;
		this.raiseSDate = raiseSDate;
		this.raiseExpDate = raiseExpDate;
		this.raiseDescribe = raiseDescribe;
		this.raiseStatus = raiseStatus;
	}
	
	public int getRaiseNo() {
		return raiseNo;
	}

	
	public void setRaiseNo(int raiseNo) {
		this.raiseNo = raiseNo;
	}

	public String getRaiseName() {
		return raiseName;
	}

	public void setRaiseName(String raiseName) {
		this.raiseName = raiseName;
	}

	public String getRaiseTitle() {
		return raiseTitle;
	}

	public void setRaiseTitle(String raiseTitle) {
		this.raiseTitle = raiseTitle;
	}

	public String getRaiseBrief() {
		return raiseBrief;
	}

	public void setRaiseBreif(String raiseBrief) {
		this.raiseBrief = raiseBrief;
	}

	public String getRaiseCategory() {
		return raiseCategory;
	}

	public void setRaiseCategory(String raiseCategory) {
		this.raiseCategory = raiseCategory;
	}

	public String getRaisePicName() {
		return raisePicName;
	}

	public void setRaisePicName(String raisePicName) {
		this.raisePicName = raisePicName;
	}
	
	public String getRaisePicBase64() {
		return raisePicBase64;
	}

	public void setRaisePicBase64(String raisePicBase64) {
		this.raisePicBase64 = raisePicBase64;
	}

	public int getRaiseTarget() {
		return raiseTarget;
	}

	public void setRaiseTarget(int raiseTarget) {
		this.raiseTarget = raiseTarget;
	}

	public String getRaiseSDate() {
		return raiseSDate;
	}

	public void setRaiseSDate(String raiseSDate) {
		this.raiseSDate = raiseSDate;
	}

	public String getRaiseExpDate() {
		return raiseExpDate;
	}

	public void setRaiseExpDate(String raiseExpDate) {
		this.raiseExpDate = raiseExpDate;
	}

	public String getRaiseDescribe() {
		return raiseDescribe;
	}

	public void setRaiseDescribe(String raiseDescribe) {
		this.raiseDescribe = raiseDescribe;
	}
	
	public String getRaiseStatus() {
		return raiseStatus;
	}
	
	public void setRaiseStatus(String raiseStatus) {
		this.raiseStatus = raiseStatus;
	}
	public Set<RaisePlanBean> getRaisePlanBeanSet() {
		return raisePlanBeanSet;
	}
	public void setRaisePlanBeanSet(Set<RaisePlanBean> raisePlanBeanSet) {
		this.raisePlanBeanSet = raisePlanBeanSet;
	}
	
	
}
