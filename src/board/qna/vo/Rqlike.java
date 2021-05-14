package board.qna.vo;

public class Rqlike {
	private String id;
	private int rqno;
	
	public Rqlike() {}
	
	public Rqlike(String id, int rqno) {
		super();
		this.id = id;
		this.rqno = rqno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRqno() {
		return rqno;
	}
	public void setRqno(int rqno) {
		this.rqno = rqno;
	}
	
	
}
