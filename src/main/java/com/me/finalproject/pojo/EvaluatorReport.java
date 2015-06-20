package com.me.finalproject.pojo;

import java.io.Serializable;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="EvaluatorReport")
public class EvaluatorReport implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
	@Column(name = "EvaluatorReportID")
	private int evaluatorReportID;

	@OneToOne
	@JoinColumn(name = "meetingID")
	private Meeting meetingID; 
	
	@OneToOne
	@JoinColumn(name = "evaluator")
	private MemberTable evaluator; 
	
	@Column(name = "rolePlayer")
	private String rolePlayer; 
	
	@Column(name = "role")
	private String role;
	
	@Column(name = "commendations")
	private String commendations; 
	
	@Column(name = "recommendation")
	private String recommendation;

	public int getEvaluatorReportID() {
		return evaluatorReportID;
	}

	public void setEvaluatorReportID(int evaluatorReportID) {
		this.evaluatorReportID = evaluatorReportID;
	}

	public Meeting getMeetingID() {
		return meetingID;
	}

	public void setMeetingID(Meeting meetingID) {
		this.meetingID = meetingID;
	}

	public MemberTable getEvaluator() {
		return evaluator;
	}

	public void setEvaluator(MemberTable evaluator) {
		this.evaluator = evaluator;
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

	public String getCommendations() {
		return commendations;
	}

	public void setCommendations(String commendations) {
		this.commendations = commendations;
	}

	public String getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}

}
