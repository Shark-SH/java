package org.psh.domain;

public class MemberDTO {
	private int bno;
	private String id;
	private String ps;
	private String ph;
	
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPs() {
		return ps;
	}
	public void setPs(String ps) {
		this.ps = ps;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [bno=" + bno + ", id=" + id + ", ps=" + ps + ", ph=" + ph + "]";
	}
}
