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
@Table(name = "GrammarianReport")
public class GrammarianReport implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int grammarianReportID;
	
	@OneToOne
	@JoinColumn(name = "MeetingID")
	private Meeting meeting;
	
	@OneToOne
	@JoinColumn(name = "CustomerID")
	private MemberTable grammarian;
	
	@Column(name = "RolePlayer")
	private String rolePlayer;
	
	@Column(name = "role")
	private String role;
	
	@Column(name = "GoodUsages")
	private String goodUsages;
	
	@Column(name = "NotSoGoodUsages")
	private String notSoGoodUsages;
	
	@Column(name = "WODUsage")
	private String wODUsage;

	public int getGrammarianReportID() {
		return grammarianReportID;
	}

	public void setGrammarianReportID(int grammarianReportID) {
		this.grammarianReportID = grammarianReportID;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public MemberTable getGrammarian() {
		return grammarian;
	}

	public void setGrammarian(MemberTable grammarian) {
		this.grammarian = grammarian;
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

	public String getNotSoGoodUsages() {
		return notSoGoodUsages;
	}

	public void setNotSoGoodUsages(String notSoGoodUsages) {
		this.notSoGoodUsages = notSoGoodUsages;
	}

	public String getwODUsage() {
		return wODUsage;
	}

	public void setwODUsage(String wODUsage) {
		this.wODUsage = wODUsage;
	}

}
