package shop.VO;

import java.sql.Timestamp;

public class BuyVO {
	private int buyid;
	private String pid;
	private String bid;
	private String btitle;
	private String bimage;
	private int bprice;
	private String vid;
	private String vtitle;
	private String vimage;
	private int vprice;
	private Timestamp buydate;
	private String account;
	private String deliveryname;
	private String deliverytel;
	private String deliveryadd1;
	private String deliveryadd2;
	private String saction;
	private int buyprice;
	private int buycount;
	
	
	public int getBuyid() {
		return buyid;
	}
	public void setBuyid(int buyid) {
		this.buyid = buyid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public Timestamp getBuydate() {
		return buydate;
	}
	public void setBuydate(Timestamp buydate) {
		this.buydate = buydate;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDeliveryname() {
		return deliveryname;
	}
	public void setDeliveryname(String deliveryname) {
		this.deliveryname = deliveryname;
	}
	public String getDeliverytel() {
		return deliverytel;
	}
	public void setDeliverytel(String deliverytel) {
		this.deliverytel = deliverytel;
	}
	public String getDeliveryadd1() {
		return deliveryadd1;
	}
	public void setDeliveryadd1(String deliveryadd1) {
		this.deliveryadd1 = deliveryadd1;
	}
	public String getDeliveryadd2() {
		return deliveryadd2;
	}
	public void setDeliveryadd2(String deliveryadd2) {
		this.deliveryadd2 = deliveryadd2;
	}
	public String getSaction() {
		return saction;
	}
	public void setSaction(String saction) {
		this.saction = saction;
	}
	public int getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(int buyprice) {
		this.buyprice = buyprice;
	}
	public int getBuycount() {
		return buycount;
	}
	public void setBuycount(int buycount) {
		this.buycount = buycount;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	public String getVtitle() {
		return vtitle;
	}
	public void setVtitle(String vtitle) {
		this.vtitle = vtitle;
	}
	public String getVimage() {
		return vimage;
	}
	public void setVimage(String vimage) {
		this.vimage = vimage;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public int getVprice() {
		return vprice;
	}
	public void setVprice(int vprice) {
		this.vprice = vprice;
	}
	
	
	
	
}
