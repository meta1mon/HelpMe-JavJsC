package board.study.vo;

public class Slike {
	private String id;
	private int sno;
	
	public Slike() {}
	
	public Slike(String id, int sno) {
		super();
		this.id = id;
		this.sno = sno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	
	
}
