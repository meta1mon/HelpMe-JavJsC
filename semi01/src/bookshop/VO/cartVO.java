package bookshop.VO;

public class cartVO {
	private int cid;
	private int buyPrice;
	private int buyCount;
	private int vBuyPrice;
	private String buyer;
	private int bid;
	private String btitle;
	private String bimage;
	private int vid;
	private String vtitle;
	private String vimage;
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
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
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
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
	public int getvBuyPrice() {
		return vBuyPrice;
	}
	public void setvBuyPrice(int vBuyPrice) {
		this.vBuyPrice = vBuyPrice;
	}
	
	
}
//cid number primary key,
//id varchar(20),
//buyPrice number,
//buyCount number,
//buyer varchar2(20),
//bid number,
//btitle varchar2(100),
//bimage varchar2(20),
//vid number,
//vtitle varchar2(100),
//vimage varchar2(100),