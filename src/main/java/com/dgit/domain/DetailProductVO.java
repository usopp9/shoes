package com.dgit.domain;

public class DetailProductVO {
	private int dNo;
	private ProductVO product;
	private String dColor;
	private int dSize;
	private int dStock;
	
	public DetailProductVO() {
		super();
		
	}
	
	public DetailProductVO(int dNo) {
		this.dNo = dNo;
	}

	public int getdNo() {
		return dNo;
	}
	public void setdNo(int dNo) {
		this.dNo = dNo;
	}
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	public String getdColor() {
		return dColor;
	}
	public void setdColor(String dColor) {
		this.dColor = dColor;
	}
	public int getdSize() {
		return dSize;
	}
	public void setdSize(int dSize) {
		this.dSize = dSize;
	}
	public int getdStock() {
		return dStock;
	}
	public void setdStock(int dStock) {
		this.dStock = dStock;
	}
	@Override
	public String toString() {
		return "DetailProductVO [dNo=" + dNo + ", product=" + product + ", dColor=" + dColor + ", dSize=" + dSize
				+ ", dStock=" + dStock + "]";
	}
	
	
}
