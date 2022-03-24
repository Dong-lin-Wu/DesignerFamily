package tw.designerfamily.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

@Entity @Table(name="orderlist") @DynamicInsert
public class Order implements Serializable{
	

	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="ORDERNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderNo;
	
	@Column(name="ORDEROWNER")
	private String orderOwner;
	
	@Column(name="ORDERNAME")
	private String orderName;
	
	@Column(name="ORDERQTY")
	private int orderQty;
	
	@Column(name="ORDERDATE", columnDefinition = "datetime2 default getdate()")
	private String orderDate;
	
	@Column(name="ORDERPRICE")
	private int orderPrice;
	
	@Column(name="ORDERSTATUS")
	private String orderStatus;
	
	@Column(name="ORDERKEY")
	private String orderKey;
	
	public Order() {
		
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





	public String getOrderName() {
		return orderName;
	}





	public void setOrderName(String orderName) {
		this.orderName = orderName;
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

}
