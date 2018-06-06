package com.dgit.domain;

import java.util.Date;

public class ReviewsVO {
	private int rNo;
	private int detailNo;
	private String rTitle;
	private String rContent;
	private Date date;
	private String rPic;
	
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	
	public int getDetailNo() {
		return detailNo;
	}
	public void setDetailNo(int detailNo) {
		this.detailNo = detailNo;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getrPic() {
		return rPic;
	}
	public void setrPic(String rPic) {
		this.rPic = rPic;
	}
	@Override
	public String toString() {
		return "ReviewsVO [rNo=" + rNo + ", detailNo=" + detailNo + ", rTitle=" + rTitle + ", rContent=" + rContent
				+ ", date=" + date + ", rPic=" + rPic + "]";
	}
	
}
