package com.dgit.domain;

import java.util.Date;

public class CoustomerVO {
	private String cId;
	private String cName;
	private String cPassword;
	private Date cBirth;
	private Date cJoin;
	private String cPhone;
	private String cMail;
	private String cAddress;
	private int cPoint;
	private Boolean cTf;
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcPassword() {
		return cPassword;
	}
	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}
	public Date getcBirth() {
		return cBirth;
	}
	public void setcBirth(Date cBirth) {
		this.cBirth = cBirth;
	}
	public Date getcJoin() {
		return cJoin;
	}
	public void setcJoin(Date cJoin) {
		this.cJoin = cJoin;
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}
	public String getcMail() {
		return cMail;
	}
	public void setcMail(String cMail) {
		this.cMail = cMail;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	public int getcPoint() {
		return cPoint;
	}
	public void setcPoint(int cPoint) {
		this.cPoint = cPoint;
	}
	public Boolean getcTf() {
		return cTf;
	}
	public void setcTf(Boolean cTf) {
		this.cTf = cTf;
	}
	
	
	@Override
	public String toString() {
		return "CoustomerVO [cId=" + cId + ", cName=" + cName + ", cPassword=" + cPassword + ", cBirth=" + cBirth
				+ ", cJoin=" + cJoin + ", cPhone=" + cPhone + ", cMail=" + cMail + ", cAddress=" + cAddress
				+ ", cPoint=" + cPoint + ", cTf=" + cTf + "]";
	}
	
	
}
