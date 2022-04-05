package tw.designerfamily.model;

public class CartItem {
	
	private ProductBean product;
	private int qty;
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
	
	
	

}
