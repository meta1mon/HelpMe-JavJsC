package board.qna.vo;

public class Qna {

	private int qno;
	private String qsubject;
	private String qwriter;
	private String qcontent;
	private String qdate; 			 // to_char(sysdate, 'YYYY-MM-DD HH:MM:SS')
	private String qimage;
	private String qfilepath;
	private int qviewcnt;			 // 처음 0
	private int qlikecnt;			 // 처음 0
	private int qtag;

	public Qna() {}
	
	public Qna(int qno, String qsubject, String qwriter, String qcontent, String qdate, String qimage, String qfilepath, int qviewcnt, int qlikecnt, int qtag) {
		super();
		this.qno = qno;
		this.qsubject = qsubject;
		this.qwriter = qwriter;
		this.qcontent = qcontent;
		this.qdate = qdate;
		this.qimage = qimage;
		this.qfilepath = qfilepath;
		this.qviewcnt = qviewcnt;
		this.qlikecnt = qlikecnt;
		this.qtag = qtag;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQsubject() {
		return qsubject;
	}

	public void setQsubject(String qsubject) {
		this.qsubject = qsubject;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQdate() {
		return qdate;
	}

	public void setQdate(String qdate) {
		this.qdate = qdate;
	}

	public String getQimage() {
		return qimage;
	}

	public void setQimage(String qimage) {
		this.qimage = qimage;
	}

	public String getQfilepath() {
		return qfilepath;
	}

	public void setQfilepath(String qfilepath) {
		this.qfilepath = qfilepath;
	}

	public int getQviewcnt() {
		return qviewcnt;
	}

	public void setQviewcnt(int qviewcnt) {
		this.qviewcnt = qviewcnt;
	}

	public int getQlikecnt() {
		return qlikecnt;
	}

	public void setQlikecnt(int qlikecnt) {
		this.qlikecnt = qlikecnt;
	}

	public int getQtag() {
		return qtag;
	}

	public void setQtag(int qtag) {
		this.qtag = qtag;
	}

	
	
}
