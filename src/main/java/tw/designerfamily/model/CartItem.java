package tw.designerfamily.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

@Entity @Table(name="orderdetail")
public class CartItem implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="orderNO")
	private Order order;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="COMM_No")
	private ProductBean product;
	
	@Column(name="qty")
	private int qty;
	
	@Column(name="totalprice")
	private int totalprice;

	public CartItem() {
		// TODO Auto-generated constructor stub
	}

	
    //購物車用
	public CartItem(ProductBean product, int qty, int totalprice) {
		super();
		this.product = product;
		this.qty = qty;
		this.totalprice = totalprice;
	}



	public ProductBean getProduct() {
		return product;
	}

	public void setProduct(ProductBean product) {
		this.product = product;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


	public Order getOrder() {
		return order;
	}


	public void setOrder(Order order) {
		this.order = order;
	}
	
}
