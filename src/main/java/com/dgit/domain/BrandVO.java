package com.dgit.domain;

public class BrandVO {
	private int bNo;
	private String bNameKor;
	private String bNameEng;
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbNameKor() {
		return bNameKor;
	}
	public void setbNameKor(String bNameKor) {
		this.bNameKor = bNameKor;
	}
	public String getbNameEng() {
		return bNameEng;
	}
	public void setbNameEng(String bNameEng) {
		this.bNameEng = bNameEng;
	}
	@Override
	public String toString() {
		return "BrandVO [bNo=" + bNo + ", bNameKor=" + bNameKor + ", bNameEng=" + bNameEng + "]";
	}
	
	
}
