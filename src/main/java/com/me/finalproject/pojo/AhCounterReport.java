package com.me.finalproject.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="AhCounterReport")
public class AhCounterReport implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ahCounterReportID;
	
	@OneToOne
	@JoinColumn(name = "MeetingId")
	private Meeting meeting;
	
	@OneToOne
	@JoinColumn(name = "ahcounter")
	private MemberTable ahCounter;
	
	@Column(name = "RolePlayer")
	private String rolePlayer;
	
	@Column(name = "Role")
	private String role;
	
	@Column(name = "ah")
	private int ah;
	
	@Column(name = "um")
	private int um;
	
	@Column(name = "repeatwords")
	private String repeatWords;
	
	@Column(name = "likeNo")
	private int like;
	
	@Column(name = "youknow")
	private int youKnow;
	
	@Column(name = "andButOrSo")
	private int andButOrSo;
	
	@Column(name = "GoodUsage")
	private String goodUsage;
	
	@Column(name = "WODUsage")
	private int wODUsage;

	public int getAhCounterReportID() {
		return ahCounterReportID;
	}

	public void setAhCounterReportID(int ahCounterReportID) {
		this.ahCounterReportID = ahCounterReportID;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public MemberTable getAhCounter() {
		return ahCounter;
	}

	public void setAhCounter(MemberTable ahCounter) {
		this.ahCounter = ahCounter;
	}

	public String getRolePlayer() {
		return rolePlayer;
	}

	public void setRolePlayer(String rolePlayer) {
		this.rolePlayer = rolePlayer;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getAh() {
		return ah;
	}

	public void setAh(int ah) {
		this.ah = ah;
	}

	public int getUm() {
		return um;
	}

	public void setUm(int um) {
		this.um = um;
	}

	public String getRepeatWords() {
		return repeatWords;
	}

	public void setRepeatWords(String repeatWords) {
		this.repeatWords = repeatWords;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getYouKnow() {
		return youKnow;
	}

	public void setYouKnow(int youKnow) {
		this.youKnow = youKnow;
	}

	public int getAndButOrSo() {
		return andButOrSo;
	}

	public void setAndButOrSo(int andButOrSo) {
		this.andButOrSo = andButOrSo;
	}

	public String getGoodUsage() {
		return goodUsage;
	}

	public void setGoodUsage(String goodUsage) {
		this.goodUsage = goodUsage;
	}

	public int getwODUsage() {
		return wODUsage;
	}

	public void setwODUsage(int wODUsage) {
		this.wODUsage = wODUsage;
	}
	
	

}
