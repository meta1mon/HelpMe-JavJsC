package bookshop.VO;

public class bookcartVO {
	private int bcid;
	private String bid;
	private String btitle;
	private String bimage;
	private int buyprice;
	private int buycount;
	private String buyer;
	
	public int getBcid() {
		return bcid;
	}
	public void setBcid(int bcid) {
		this.bcid = bcid;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
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
	public int getBuyprice() {
		return buyprice;
	}
	public void setBuyprice( int buyprice) {
		this.buyprice = buyprice;
	}
	public  int getBuycount() {
		return buycount;
	}
	public void setBuycount( int buycount) {
		this.buycount = buycount;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	
}
