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
@Table(name = "GeneralEvaluationReport")
public class GeneralEvaluatorReport implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int generalEvaluationID;
	
	@OneToOne
	@JoinColumn(name = "generalEvaluator")
	private MemberTable generalEvaluator; 
	
	@OneToOne
	@JoinColumn(name = "meeting")
	private Meeting meeting; 
	
	@Column(name = "president")
	private int president;
	
	@Column(name = "toastMaster")
	private int toastMaster; 
	
	@Column(name = "tableTopicsMaster")
	private int tableTopicsMaster; 
	
	@Column(name = "tableTopicsSpeakers")
	private int tableTopicsSpeakers; 
	
	@Column(name = "evaluators")
	private int evaluators; 
	
	@Column(name = "comments")
	private String comments;

	public int getGeneralEvaluationID() {
		return generalEvaluationID;
	}

	public void setGeneralEvaluationID(int generalEvaluationID) {
		this.generalEvaluationID = generalEvaluationID;
	}

	public MemberTable getGeneralEvaluator() {
		return generalEvaluator;
	}

	public void setGeneralEvaluator(MemberTable generalEvaluator) {
		this.generalEvaluator = generalEvaluator;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public int getPresident() {
		return president;
	}

	public void setPresident(int president) {
		this.president = president;
	}

	public int getToastMaster() {
		return toastMaster;
	}

	public void setToastMaster(int toastMaster) {
		this.toastMaster = toastMaster;
	}

	public int getTableTopicsMaster() {
		return tableTopicsMaster;
	}

	public void setTableTopicsMaster(int tableTopicsMaster) {
		this.tableTopicsMaster = tableTopicsMaster;
	}

	public int getTableTopicsSpeakers() {
		return tableTopicsSpeakers;
	}

	public void setTableTopicsSpeakers(int tableTopicsSpeakers) {
		this.tableTopicsSpeakers = tableTopicsSpeakers;
	}

	public int getEvaluators() {
		return evaluators;
	}

	public void setEvaluators(int evaluators) {
		this.evaluators = evaluators;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	

}
