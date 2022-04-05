package tw.designerfamily.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "commodity")
public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "COMM_NO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commNo;

	@Column(name = "COMM_TITLE")
	private String commTitle;

	@Column(name = "COMM_PRICE")
	private int commPrice;

	@Column(name = "COMM_DES")
	private String commDES;

	@Column(name = "COMM_SPE")
	private String commSPE;

	@Column(name = "COMM_SPE2")
	private String commSPE2;

	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "ITEM")
	private String item;

	@Column(name = "DESIGNER")
	private String designer;

	@Column(name = "COMM_QUANTITY")
	private int commQuantity;

	@Column(name = "COMM_IMG")
	private String commImg;

	public ProductBean() {
	}
	
	// 新增的建構子(無編號)
	public ProductBean(String commTitle, String commDES, String commSPE, String category, String designer,
			int commPrice, int commQuantity, String commImg) {
		this.commTitle = commTitle;
		this.commDES = commDES;
		this.commSPE = commSPE;
		this.category = category;
		this.designer = designer;
		this.commPrice = commPrice;
		this.commQuantity = commQuantity;
		this.commImg = commImg;
	}

	// 修改
	public ProductBean(int commNo, String commTitle, String commDES, String commSPE, String category, String designer,
			int commPrice, int commQuantity, String commImg) {
		this.commNo = commNo;
		this.commTitle = commTitle;
		this.commDES = commDES;
		this.commSPE = commSPE;
		this.category = category;
		this.designer = designer;
		this.commPrice = commPrice;
		this.commQuantity = commQuantity;
		this.commImg = commImg;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getCommTitle() {
		return commTitle;
	}

	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
	}

	public int getCommPrice() {
		return commPrice;
	}

	public void setCommPrice(int commPrice) {
		this.commPrice = commPrice;
	}

	public String getCommDES() {
		return commDES;
	}

	public void setCommDES(String commDES) {
		this.commDES = commDES;
	}

	public String getCommSPE() {
		return commSPE;
	}

	public void setCommSPE(String commSPE) {
		this.commSPE = commSPE;
	}

	public String getCommSPE2() {
		return commSPE2;
	}

	public void setCommSPE2(String commSPE2) {
		this.commSPE2 = commSPE2;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getDesigner() {
		return designer;
	}

	public void setDesigner(String designer) {
		this.designer = designer;
	}

	public int getCommQuantity() {
		return commQuantity;
	}

	public void setCommQuantity(int commQuantity) {
		this.commQuantity = commQuantity;
	}

	public String getCommImg() {
		return commImg;
	}

	public void setCommImg(String commImg) {
		this.commImg = commImg;
	}

}
