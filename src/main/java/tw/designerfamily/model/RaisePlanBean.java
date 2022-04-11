package tw.designerfamily.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity @Table(name = "raiseplan")
@Component
public class RaisePlanBean implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id @Column(name = "RAISEPLANNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int raisePlanNo;
	

	@Column(name = "RAISEPLANPICNAME")
	private String raisePlanPicName;
	
	@Column(name = "RAISEPLANPICBASE64")
	private String raisePlanPicBase64;
	
	@Column(name = "RAISEPLANAMOUNT")
	private int raisePlanAmount;
	
	@Column(name = "RAISEPLANADATE")
	private String raisePlanADate;
	
	@Column(name = "RAISEPLANDESCRIBE")
	private String raisePlanDescribe;
	
	@JsonIgnoreProperties(value = "raisePlanBeanSet")
	@ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name = "RAISENO")
	private RaiseBean raiseBean;
	
	public RaisePlanBean() {
	}

	//新增資料使用
	public RaisePlanBean(String raisePlanPicName, String raisePlanPicBase64, int raisePlanAmount, String raisePlanADate,
			String raisePlanDescribe) {
		this.raisePlanPicName = raisePlanPicName;
		this.raisePlanPicBase64 = raisePlanPicBase64;
		this.raisePlanAmount = raisePlanAmount;
		this.raisePlanADate = raisePlanADate;
		this.raisePlanDescribe = raisePlanDescribe;
	}
	
	//修改資料使用
	public RaisePlanBean(int raisePlanNo, String raisePlanPicName, String raisePlanPicBase64, int raisePlanAmount,
			String raisePlanADate, String raisePlanDescribe) {
		super();
		this.raisePlanNo = raisePlanNo;
		this.raisePlanPicName = raisePlanPicName;
		this.raisePlanPicBase64 = raisePlanPicBase64;
		this.raisePlanAmount = raisePlanAmount;
		this.raisePlanADate = raisePlanADate;
		this.raisePlanDescribe = raisePlanDescribe;
	}
	
	public int getRaisePlanNo() {
		return raisePlanNo;
	}


	public void setRaisePlanNo(int raisePlanNo) {
		this.raisePlanNo = raisePlanNo;
	}

	public String getRaisePlanPicName() {
		return raisePlanPicName;
	}

	public void setRaisePlanPicName(String raisePlanPicName) {
		this.raisePlanPicName = raisePlanPicName;
	}

	public String getRaisePlanPicBase64() {
		return raisePlanPicBase64;
	}

	public void setRaisePlanPicBase64(String raisePlanPicBase64) {
		this.raisePlanPicBase64 = raisePlanPicBase64;
	}

	public int getRaisePlanAmount() {
		return raisePlanAmount;
	}

	public void setRaisePlanAmount(int raisePlanAmount) {
		this.raisePlanAmount = raisePlanAmount;
	}

	public String getRaisePlanADate() {
		return raisePlanADate;
	}

	public void setRaisePlanADate(String raisePlanDate) {
		this.raisePlanADate = raisePlanDate;
	}

	public String getRaisePlanDescribe() {
		return raisePlanDescribe;
	}

	public void setRaisePlanDescribe(String raisePlanDescribe) {
		this.raisePlanDescribe = raisePlanDescribe;
	}

	public RaiseBean getRaiseBean() {
		return raiseBean;
	}

	public void setRaiseBean(RaiseBean raiseBean) {
		this.raiseBean = raiseBean;
	};
	
	
	
}
