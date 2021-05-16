package board.review.vo;

public class Review {

	private int rno;
	private String rsubject;
	private String rwriter;
	private String rcontent;
	private String rdate; // to_char(sysdate, 'YYYY-MM-DD HH:MM:SS')
	private String rfilepath;
	private int rviewcnt; // 처음 0
	private int rlikecnt; // 처음 0
	private int rtag;
	private int rreviewcnt;

	public Review() {
	}

	public Review(int rno, String rsubject, String rwriter, String rcontent, String rdate, String rfilepath,
			int rviewcnt, int rlikecnt, int rtag, int rreviewcnt) {
		super();
		this.rno = rno;
		this.rsubject = rsubject;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rfilepath = rfilepath;
		this.rviewcnt = rviewcnt;
		this.rlikecnt = rlikecnt;
		this.rtag = rtag;
		this.rreviewcnt = rreviewcnt;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRsubject() {
		return rsubject;
	}

	public void setRsubject(String rsubject) {
		this.rsubject = rsubject;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRfilepath() {
		return rfilepath;
	}

	public void setRfilepath(String rfilepath) {
		this.rfilepath = rfilepath;
	}

	public int getRviewcnt() {
		return rviewcnt;
	}

	public void setRviewcnt(int rviewcnt) {
		this.rviewcnt = rviewcnt;
	}

	public int getRlikecnt() {
		return rlikecnt;
	}

	public void setRlikecnt(int rlikecnt) {
		this.rlikecnt = rlikecnt;
	}

	public int getRtag() {
		return rtag;
	}

	public void setRtag(int rtag) {
		this.rtag = rtag;
	}

	public int getRreviewcnt() {
		return rreviewcnt;
	}

	public void setRreviewcnt(int rreviewcnt) {
		this.rreviewcnt = rreviewcnt;
	}

}
