package board.qna.vo;

public class Qlike {
	private String id;
	private int qno;

	public Qlike() {
	}

	public Qlike(String id, int qno) {
		super();
		this.id = id;
		this.qno = qno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

}
