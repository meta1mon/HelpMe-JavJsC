package calendar.VO;

public class CalendarVO {
	
	private String scheNum;
	private String scheName;
	private String scheStart;
	private String scheEnd;
	private int scheCode;
	private String scheContent;
	
	public String getScheNum() {
		return scheNum;
	}
	public void setScheNum(String scheNum) {
		this.scheNum = scheNum;
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
		return "CalendarVO [scheNum=" + scheNum + ", scheName=" + scheName + ", scheStart=" + scheStart + ", scheEnd="
				+ scheEnd + ", scheCode=" + scheCode + ", scheContent=" + scheContent + "]";
	}
	
	
	

}
