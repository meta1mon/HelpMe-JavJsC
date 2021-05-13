package board.study.vo;

public class Study {
	private int sno;
	private String ssubject;
	private String swriter;
	private String scontent;
	private String sdate;
	private String sfilepath;
	private int sviewcnt;
	private int slikecnt;
	private int stag;
	private int rstudycnt;
	
	public Study() {}
	
	public Study(int sno, String ssubject, String swriter, String scontent, String sdate, String sfilepath,
			int sviewcnt, int slikecnt, int stag, int rstudycnt) {
		super();
		this.sno = sno;
		this.ssubject = ssubject;
		this.swriter = swriter;
		this.scontent = scontent;
		this.sdate = sdate;
		this.sfilepath = sfilepath;
		this.sviewcnt = sviewcnt;
		this.slikecnt = slikecnt;
		this.stag = stag;
		this.rstudycnt = rstudycnt;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getSsubject() {
		return ssubject;
	}

	public void setSsubject(String ssubject) {
		this.ssubject = ssubject;
	}

	public String getSwriter() {
		return swriter;
	}

	public void setSwriter(String swriter) {
		this.swriter = swriter;
	}

	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSfilepath() {
		return sfilepath;
	}

	public void setSfilepath(String sfilepath) {
		this.sfilepath = sfilepath;
	}

	public int getSviewcnt() {
		return sviewcnt;
	}

	public void setSviewcnt(int sviewcnt) {
		this.sviewcnt = sviewcnt;
	}

	public int getSlikecnt() {
		return slikecnt;
	}

	public void setSlikecnt(int slikecnt) {
		this.slikecnt = slikecnt;
	}

	public int getStag() {
		return stag;
	}

	public void setStag(int stag) {
		this.stag = stag;
	}

	public int getRstudycnt() {
		return rstudycnt;
	}

	public void setRstudycnt(int rstudycnt) {
		this.rstudycnt = rstudycnt;
	}
	
	
	
}
