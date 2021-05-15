package recruitcalendar.VO;

public class RecruitCalendarVO {
	private int rcScheNum;
	private String mId;
	private String rcScheName;
	private String rcScheStart;
	private String rcScheEnd;
	private int rcScheCode;
	private String rcScheContent;
	
	public int getRcScheNum() {
		return rcScheNum;
	}
	public void setRcScheNum(int rcScheNum) {
		this.rcScheNum = rcScheNum;
	}

	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	public String getRcScheName() {
		return rcScheName;
	}
	public void setRcScheName(String rcScheName) {
		this.rcScheName = rcScheName;
	}
	public String getRcScheStart() {
		return rcScheStart;
	}
	public void setRcScheStart(String rcScheStart) {
		this.rcScheStart = rcScheStart;
	}
	public String getRcScheEnd() {
		return rcScheEnd;
	}
	public void setRcScheEnd(String rcScheEnd) {
		this.rcScheEnd = rcScheEnd;
	}
	public int getRcScheCode() {
		return rcScheCode;
	}
	public void setRcScheCode(int rcScheCode) {
		this.rcScheCode = rcScheCode;
	}
	public String getRcScheContent() {
		return rcScheContent;
	}
	public void setRcScheContent(String rcScheContent) {
		this.rcScheContent = rcScheContent;
	}
	
	@Override
	public String toString() {
		return "RecruitCalendarVO [rcScheNum=" + rcScheNum + ", mId=" + mId + ", rcScheName=" + rcScheName
				+ ", rcScheStart=" + rcScheStart + ", rcScheEnd=" + rcScheEnd + ", rcScheCode=" + rcScheCode
				+ ", rcScheContent=" + rcScheContent + "]";
	}
	


	
}
