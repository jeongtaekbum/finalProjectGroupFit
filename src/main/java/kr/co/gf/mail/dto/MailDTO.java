package kr.co.gf.mail.dto;

import org.apache.ibatis.type.Alias;

@Alias("mail")
public class MailDTO {
	
	private int email_num;
	private String send_empno;
	private String get_empno;
	private String subject;
	private String content;
	private String send_time;
	private String get_chk;
	
	public int getEmail_num() {
		return email_num;
	}
	public void setEmail_num(int email_num) {
		this.email_num = email_num;
	}
	public String getSend_empno() {
		return send_empno;
	}
	public void setSend_empno(String send_empno) {
		this.send_empno = send_empno;
	}
	public String getGet_empno() {
		return get_empno;
	}
	public void setGet_empno(String get_empno) {
		this.get_empno = get_empno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public String getGet_chk() {
		return get_chk;
	}
	public void setGet_chk(String get_chk) {
		this.get_chk = get_chk;
	}

	
	
	
}
