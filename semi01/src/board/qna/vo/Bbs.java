package board.qna.vo;

import java.sql.Timestamp;

public class Bbs {

	private int bno;
	private String bsubject;
	private String bwriter;
	private String bcontent;
	private String bdate;
	private int bavailable;
	private int bref;
	private int bref_step;
	private int viewcnt;
	private int likecnt;
	private String bimage;
	private String bfilepath;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBsubject() {
		return bsubject;
	}

	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public int getBavailable() {
		return bavailable;
	}

	public void setBavailable(int bavailable) {
		this.bavailable = bavailable;
	}

	public int getBref() {
		return bref;
	}

	public void setBref(int bref) {
		this.bref = bref;
	}

	public int getBref_step() {
		return bref_step;
	}

	public void setBref_step(int bref_step) {
		this.bref_step = bref_step;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public String getBimage() {
		return bimage;
	}

	public void setBimage(String bimage) {
		this.bimage = bimage;
	}

	public String getBfilepath() {
		return bfilepath;
	}

	public void setBfilepath(String bfilepath) {
		this.bfilepath = bfilepath;
	}

}
