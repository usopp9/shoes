package com.dgit.domain;

import java.util.Date;
import java.util.List;

public class OrderProductVO {
	private int oNo;
	private int oNum;
	private List<DetailProductVO> detail;
	private String oId;
	private String oName;
	private String oPhone;
	private String oMail;
	private String oPassword;
	private String oAddress;
	private int oPrice;
	private int oPoint;
	private int oUpoint;
	private Date oDate;
	private int oCount;
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public List<DetailProductVO> getDetail() {
		return detail;
	}
	public void setDetail(List<DetailProductVO> detail) {
		this.detail = detail;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getoPhone() {
		return oPhone;
	}
	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	public String getoMail() {
		return oMail;
	}
	public void setoMail(String oMail) {
		this.oMail = oMail;
	}
	public String getoPassword() {
		return oPassword;
	}
	public void setoPassword(String oPassword) {
		this.oPassword = oPassword;
	}
	public String getoAddress() {
		return oAddress;
	}
	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public int getoPoint() {
		return oPoint;
	}
	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}
	public int getoUpoint() {
		return oUpoint;
	}
	public void setoUpoint(int oUpoint) {
		this.oUpoint = oUpoint;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	@Override
	public String toString() {
		return "OrderProductVO [oNo=" + oNo + ", oNum=" + oNum + ", detail=" + detail + ", oId=" + oId + ", oName="
				+ oName + ", oPhone=" + oPhone + ", oMail=" + oMail + ", oPassword=" + oPassword + ", oAddress="
				+ oAddress + ", oPrice=" + oPrice + ", oPoint=" + oPoint + ", oUpoint=" + oUpoint + ", oDate=" + oDate
				+ ", oCount=" + oCount + "]";
	}
	
	
	
	
}
