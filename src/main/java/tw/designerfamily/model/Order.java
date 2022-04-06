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

@Entity @Table(name="orderlist")
public class Order implements Serializable{
	

	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="ORDERNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderNo;
	
	@Column(name="ORDEROWNER")
	private String orderOwner;
	
	@Column(name="ORDERQTY")
	private int orderQty;
	
	@Column(name="ORDERDATE")
	private String orderDate;
	
	@Column(name="ORDERPRICE")
	private int orderPrice;
	
	@Column(name="ORDERSTATUS")
	private String orderStatus;
	
	@Column(name="ORDERKEY")
	private String orderKey;
	
	//對應CartItem(購物車多筆商品)
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL,mappedBy = "order",orphanRemoval = true)
	private Set<CartItem> item = new LinkedHashSet<CartItem>();
	
	public Order() {
		
	}
	
	//生成訂單用
	public Order(String orderOwner, int orderQty, int orderPrice, String orderStatus, String orderKey,
			Set<CartItem> item,String orderDate) {
		super();
		this.orderOwner = orderOwner;
		this.orderQty = orderQty;
		this.orderPrice = orderPrice;
		this.orderStatus = orderStatus;
		this.orderKey = orderKey;
		this.item = item;
		this.orderDate = orderDate;
	}
	

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderOwner() {
		return orderOwner;
	}

	public void setOrderOwner(String orderOwner) {
		this.orderOwner = orderOwner;
	}


	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderKey() {
		return orderKey;
	}

	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}

	public Set<CartItem> getItem() {
		return item;
	}

	public void setItem(Set<CartItem> item) {
		this.item = item;
	}
	

}
