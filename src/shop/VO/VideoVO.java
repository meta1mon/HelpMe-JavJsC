package shop.VO;

import java.sql.Date;
import java.sql.Timestamp;

public class VideoVO {
	private String vid;
	private String vkind;
	private String vtitle;
	private int vprice;
	private String vimage;
	private int discountRate;
	private Timestamp regdate;
	private String vsize;
	private Date startDate;
	private Date endDate;
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getVkind() {
		return vkind;
	}
	public void setVkind(String vkind) {
		this.vkind = vkind;
	}
	public String getVtitle() {
		return vtitle;
	}
	public void setVtitle(String vtitle) {
		this.vtitle = vtitle;
	}
	public int getVprice() {
		return vprice;
	}
	public void setVprice(int vprice) {
		this.vprice = vprice;
	}
	public String getVimage() {
		return vimage;
	}
	public void setVimage(String vimage) {
		this.vimage = vimage;
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
	public String getVsize() {
		return vsize;
	}
	public void setVsize(String vsize) {
		this.vsize = vsize;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
		
	
	
}

//vid number primary key,
//vkind varchar2(20),
//vtitle varchar2(200),
//vprice number,
//vimage varchar2(300),
//discountRate number,
//regdate date,
//vsize varchar2(20),
//expiration date