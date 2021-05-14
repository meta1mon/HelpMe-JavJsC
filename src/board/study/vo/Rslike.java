package board.study.vo;

public class Rslike {
	private String id;
	private int rsno;

	public Rslike() {
	}

	public Rslike(String id, int rsno) {
		super();
		this.id = id;
		this.rsno = rsno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRsno() {
		return rsno;
	}

	public void setRsno(int rsno) {
		this.rsno = rsno;
	}

}
