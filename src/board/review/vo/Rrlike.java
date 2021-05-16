package board.review.vo;

public class Rrlike {
	private String id;
	private int rrno;

	public Rrlike() {
	}

	public Rrlike(String id, int rrno) {
		super();
		this.id = id;
		this.rrno = rrno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRrno() {
		return rrno;
	}

	public void setRrno(int rrno) {
		this.rrno = rrno;
	}

}
