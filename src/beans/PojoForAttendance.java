package beans;

import java.util.Date;

public class PojoForAttendance {
	
	private int S_No;
	Date date=new Date();
	private String attStatus;
	private String Subject;
	private int id;
    
	public PojoForAttendance(Date date, String attStatus, String subject, int id) {
		super();
		this.date = date;
		this.attStatus = attStatus;
		Subject = subject;
		this.id = id;
	}

	public int getS_No() {
		return S_No;
	}

	public void setS_No(int s_No) {
		S_No = s_No;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAttStatus() {
		return attStatus;
	}

	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public PojoForAttendance() {
		// TODO Auto-generated constructor stub
	}

}
