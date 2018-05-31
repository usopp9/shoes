package com.dgit.domain;

import java.util.Date;

public class ProductVO {
	private int pNo;
	private BrandVO brand ;
	private CategoryVO category;
	private String pCode;
	private String pQr;
	private String pNameKor;
	private String pNameEng;
	private int pPrice;
	private int pRate;
	private int pTotalPrice;
	private int pCnt;
	private int pCount;
	private Boolean pTf;
	private Date pDate;
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public BrandVO getBrand() {
		return brand;
	}
	public void setBrand(BrandVO brand) {
		this.brand = brand;
	}
	public CategoryVO getCategory() {
		return category;
	}
	public void setCategory(CategoryVO category) {
		this.category = category;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpQr() {
		return pQr;
	}
	public void setpQr(String pQr) {
		this.pQr = pQr;
	}
	public String getpNameKor() {
		return pNameKor;
	}
	public void setpNameKor(String pNameKor) {
		this.pNameKor = pNameKor;
	}
	public String getpNameEng() {
		return pNameEng;
	}
	public void setpNameEng(String pNameEng) {
		this.pNameEng = pNameEng;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpRate() {
		return pRate;
	}
	public void setpRate(int pRate) {
		this.pRate = pRate;
	}
	public int getpTotalPrice() {
		return pTotalPrice;
	}
	public void setpTotalPrice(int pTotalPrice) {
		this.pTotalPrice = pTotalPrice;
	}
	public int getpCnt() {
		return pCnt;
	}
	public void setpCnt(int pCnt) {
		this.pCnt = pCnt;
	}
	public int getpCount() {
		return pCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	public Boolean getpTf() {
		return pTf;
	}
	public void setpTf(Boolean pTf) {
		this.pTf = pTf;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	@Override
	public String toString() {
		return "ProductVO [pNo=" + pNo + ", brand=" + brand + ", category=" + category + ", pCode=" + pCode + ", pQr="
				+ pQr + ", pNameKor=" + pNameKor + ", pNameEng=" + pNameEng + ", pPrice=" + pPrice + ", pRate=" + pRate
				+ ", pTotalPrice=" + pTotalPrice + ", pCnt=" + pCnt + ", pCount=" + pCount + ", pTf=" + pTf + ", pDate="
				+ pDate + "]";
	}
	
	
	
	
	
}
