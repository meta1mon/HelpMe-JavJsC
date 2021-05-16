package board.review.vo;

public class Rlike {
	private String id;
	private int rno;
	
	public Rlike() {}
	
	public Rlike(String id, int rno) {
		super();
		this.id = id;
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	
}
