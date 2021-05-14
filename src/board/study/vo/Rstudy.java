package board.study.vo;

public class Rstudy {
	private int rsno;
	private int sno;
	private String rswriter;
	private String rscontent;
	private String rsdate;
	private int rslikecnt;

	public Rstudy() {
	}

	public Rstudy(int rsno, int sno, String rswriter, String rscontent, String rsdate, int rslikecnt) {
		super();
		this.rsno = rsno;
		this.sno = sno;
		this.rswriter = rswriter;
		this.rscontent = rscontent;
		this.rsdate = rsdate;
		this.rslikecnt = rslikecnt;
	}

	public int getRsno() {
		return rsno;
	}

	public void setRsno(int rsno) {
		this.rsno = rsno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getRswriter() {
		return rswriter;
	}

	public void setRswriter(String rswriter) {
		this.rswriter = rswriter;
	}

	public String getRscontent() {
		return rscontent;
	}

	public void setRscontent(String rscontent) {
		this.rscontent = rscontent;
	}

	public String getRsdate() {
		return rsdate;
	}

	public void setRsdate(String rsdate) {
		this.rsdate = rsdate;
	}

	public int getRslikecnt() {
		return rslikecnt;
	}

	public void setRslikecnt(int rslikecnt) {
		this.rslikecnt = rslikecnt;
	}

}
