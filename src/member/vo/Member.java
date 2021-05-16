package member.vo;

public class Member {
	private String id;
	private String nickname;
	private String password;
	private String passquestion;
	private String passanswer;
	private String regdate;
	private String postcode;
	private String address1;
	private String address2;
	private String address3;
	private String tel;
	private String email;
	private String rcvmail;
	    
	public Member() {}

	public Member(String id, String nickname, String password, String passquestion, String passanswer, String regdate,
			String postcode, String address1, String address2, String address3, String tel, String email, String rcvmail) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.passquestion = passquestion;
		this.passanswer = passanswer;
		this.regdate = regdate;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.tel = tel;
		this.email = email;
		this.rcvmail = rcvmail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassquestion() {
		return passquestion;
	}

	public void setPassquestion(String passquestion) {
		this.passquestion = passquestion;
	}

	public String getPassanswer() {
		return passanswer;
	}

	public void setPassanswer(String passanswer) {
		this.passanswer = passanswer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRcvmail() {
		return rcvmail;
	}

	public void setRcvmail(String rcvmail) {
		this.rcvmail = rcvmail;
	}

	
}
