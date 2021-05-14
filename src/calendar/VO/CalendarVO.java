package calendar.VO;

public class CalendarVO {
	
	private int scheNum;
	private String id;
	private String scheName;
	private String scheStart;
	private String scheEnd;
	private int scheCode;
	private String scheContent;
	
	public int getScheNum() {
		return scheNum;
	}
	public void setScheNum(int scheNum) {
		this.scheNum = scheNum;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getScheName() {
		return scheName;
	}
	public void setScheName(String scheName) {
		this.scheName = scheName;
	}
	public String getScheStart() {
		return scheStart;
	}
	public void setScheStart(String scheStart) {
		this.scheStart = scheStart;
	}
	public String getScheEnd() {
		return scheEnd;
	}
	public void setScheEnd(String scheEnd) {
		this.scheEnd = scheEnd;
	}
	public int getScheCode() {
		return scheCode;
	}
	public void setScheCode(int scheCode) {
		this.scheCode = scheCode;
	}
	public String getScheContent() {
		return scheContent;
	}
	public void setScheContent(String scheContent) {
		this.scheContent = scheContent;
	}
	
	@Override
	public String toString() {
		return "CalendarVO [scheNum=" + scheNum + ", id=" + id + ", scheName=" + scheName + ", scheStart=" + scheStart
				+ ", scheEnd=" + scheEnd + ", scheCode=" + scheCode + ", scheContent=" + scheContent + "]";
	}
	
	
	
	

}
