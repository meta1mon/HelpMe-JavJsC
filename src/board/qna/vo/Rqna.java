package board.qna.vo;

public class Rqna {
	private int rqno;
	private int qno; // qna 의 pk인 qno를 fk로 가져옴
	private String rqwriter;
	private String rqcontent;
	private String rqdate;
	private int rqlikecnt;

	public Rqna() {
	}

	public Rqna(int rqno, int qno, String rqwriter, String rqcontent, String rqdate, int rqlikecnt) {
		super();
		this.rqno = rqno;
		this.qno = qno;
		this.rqwriter = rqwriter;
		this.rqcontent = rqcontent;
		this.rqdate = rqdate;
		this.rqlikecnt = rqlikecnt;
	}

	public int getRqno() {
		return rqno;
	}

	public void setRqno(int rqno) {
		this.rqno = rqno;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getRqwriter() {
		return rqwriter;
	}

	public void setRqwriter(String rqwriter) {
		this.rqwriter = rqwriter;
	}

	public String getRqcontent() {
		return rqcontent;
	}

	public void setRqcontent(String rqcontent) {
		this.rqcontent = rqcontent;
	}

	public String getRqdate() {
		return rqdate;
	}

	public void setRqdate(String rqdate) {
		this.rqdate = rqdate;
	}

	public int getRqlikecnt() {
		return rqlikecnt;
	}

	public void setRqlikecnt(int rqlikecnt) {
		this.rqlikecnt = rqlikecnt;
	}

}
