package shop.VO;

import java.sql.Date;
import java.sql.Timestamp;


public class ShopBookVo {
	private String bid;
	private String bkind;
	private String btitle;
	private int bprice;
	private int bcount;
	private String author;
	private String publishing_com;
	private String bimage;
	private int discountRate;
	private Timestamp regdate;
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBkind() {
		return bkind;
	}
	public void setBkind(String bkind) {
		this.bkind = bkind;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublishing_com() {
		return publishing_com;
	}
	public void setPublishing_com(String publishing_com) {
		this.publishing_com = publishing_com;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
}
//create table book(
//	    book_id number primary key,
//	    book_kind varchar2(20),
//	    book_title varchar2(20),
//	    book_price number,
//	    book_count number,
//	    author varchar2(20),
//	    publishing_com varchar2(20),
//	    book_image varchar2(30),
//	    discount_rate number
//	);