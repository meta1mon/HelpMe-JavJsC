package board.review.vo;

public class Rreview {
	private int rrno;
	private int rno; // qna 의 pk인 qno를 fk로 가져옴
	private String rrwriter;
	private String rrcontent;
	private String rrdate;
	private int rrlikecnt;

	public Rreview() {
	}

	public Rreview(int rrno, int rno, String rrwriter, String rrcontent, String rrdate, int rrlikecnt) {
		super();
		this.rrno = rrno;
		this.rno = rno;
		this.rrwriter = rrwriter;
		this.rrcontent = rrcontent;
		this.rrdate = rrdate;
		this.rrlikecnt = rrlikecnt;
	}

	public int getRrno() {
		return rrno;
	}

	public void setRrno(int rrno) {
		this.rrno = rrno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRrwriter() {
		return rrwriter;
	}

	public void setRrwriter(String rrwriter) {
		this.rrwriter = rrwriter;
	}

	public String getRrcontent() {
		return rrcontent;
	}

	public void setRrcontent(String rrcontent) {
		this.rrcontent = rrcontent;
	}

	public String getRrdate() {
		return rrdate;
	}

	public void setRrdate(String rrdate) {
		this.rrdate = rrdate;
	}

	public int getRrlikecnt() {
		return rrlikecnt;
	}

	public void setRrlikecnt(int rrlikecnt) {
		this.rrlikecnt = rrlikecnt;
	}

}
