package com.dgit.domain;

public class BasketVO {
	private int bNo;
	private DetailProductVO detailProduct;
	private String bId;
	private int bCount;
	
	
	
	public BasketVO() {
		super();
	}
	
	
	public BasketVO(int bNo) {
		this.bNo = bNo;
	}


	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public DetailProductVO getDetailProduct() {
		return detailProduct;
	}
	public void setDetailProduct(DetailProductVO detailProduct) {
		this.detailProduct = detailProduct;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	@Override
	public String toString() {
		return "BasketVO [bNo=" + bNo + ", detailProduct=" + detailProduct + ", bId=" + bId + ", bCount=" + bCount
				+ "]";
	}
	
	
}
