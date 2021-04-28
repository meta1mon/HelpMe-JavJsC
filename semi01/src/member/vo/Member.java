package member.vo;

public class Member {
	private String id;
	private String nickname;
	private String password;
	private String passquestion;
	private String passanswer;
	private String regdate;
	private String address;
	private String tel;
	private String email;
	
	public Member() {}
	
	public Member(String id, String nickname, String password, String passquestion, String passanswer, String regdate,
			String address, String tel, String email) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.passquestion = passquestion;
		this.passanswer = passanswer;
		this.regdate = regdate;
		this.address = address;
		this.tel = tel;
		this.email = email;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Override
	public String toString() {
		return "Member [id=" + id + ", nickname=" + nickname + ", password=" + password + ", passquestion="
				+ passquestion + ", passanswer=" + passanswer + ", regdate=" + regdate + ", address=" + address
				+ ", tel=" + tel + ", email=" + email + "]";
	}
	
	
	
	
}
