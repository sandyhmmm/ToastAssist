package com.me.finalproject.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Meeting")
public class Meeting implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue
	@Column(name ="MeetingID")
	private int meetingID;
	
	
	
	@Column(name ="Toastmaster")
	private String toastmaster;
	
	@Column(name ="Timer")
	private String timer;
	
	@Column(name ="TTMaster")
	private String tTMaster;
	
	@Column(name ="Status")
	private String status;
	
	@Column(name ="Speaker5")
	private String speaker5;
	
	@Column(name ="Speaker4")
	private String speaker4;
	
	@Column(name ="Speaker3")
	private String speaker3;
	
	@Column(name ="Speaker2")
	private String speaker2;
	
	@Column(name ="Speaker1")
	private String speaker1;
	
	@Column(name ="MeetingName")
	private String meetingName;
	
	@Column(name ="MeetingDate")
	private Date meetingDate;
	
	@Column(name ="Humorist")
	private String humorist;
	
	@Column(name ="grammarian")
	private String grammarian;
	
	@Column(name ="generalEvaluator")
	private String generalEvaluator;
	
	@Column(name ="evaluator5")
	private String evaluator5;
	
	@Column(name ="evaluator4")
	private String evaluator4;
	
	@Column(name ="evaluator3")
	private String evaluator3;
	
	@Column(name ="evaluator2")
	private String evaluator2;
	
	@Column(name ="evaluator1")
	private String evaluator1;
	
	@Column(name ="aHCounter")
	private String aHCounter;
	
	@OneToOne
	@JoinColumn(name = "createdBy")
	private MemberTable createdBy; 
	
	@OneToOne
	@JoinColumn(name = "clubNo")
	private Club clubNo;

	public int getMeetingID() {
		return meetingID;
	}

	public void setMeetingID(int meetingID) {
		this.meetingID = meetingID;
	}

	public String getToastmaster() {
		return toastmaster;
	}

	public void setToastmaster(String toastmaster) {
		this.toastmaster = toastmaster;
	}

	public String getTimer() {
		return timer;
	}

	public void setTimer(String timer) {
		this.timer = timer;
	}

	public String gettTMaster() {
		return tTMaster;
	}

	public void settTMaster(String tTMaster) {
		this.tTMaster = tTMaster;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSpeaker5() {
		return speaker5;
	}

	public void setSpeaker5(String speaker5) {
		this.speaker5 = speaker5;
	}

	public String getSpeaker4() {
		return speaker4;
	}

	public void setSpeaker4(String speaker4) {
		this.speaker4 = speaker4;
	}

	public String getSpeaker3() {
		return speaker3;
	}

	public void setSpeaker3(String speaker3) {
		this.speaker3 = speaker3;
	}

	public String getSpeaker2() {
		return speaker2;
	}

	public void setSpeaker2(String speaker2) {
		this.speaker2 = speaker2;
	}

	public String getSpeaker1() {
		return speaker1;
	}

	public void setSpeaker1(String speaker1) {
		this.speaker1 = speaker1;
	}

	public String getMeetingName() {
		return meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public Date getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
	}

	public String getHumorist() {
		return humorist;
	}

	public void setHumorist(String humorist) {
		this.humorist = humorist;
	}

	public String getGrammarian() {
		return grammarian;
	}

	public void setGrammarian(String grammarian) {
		this.grammarian = grammarian;
	}

	public String getGeneralEvaluator() {
		return generalEvaluator;
	}

	public void setGeneralEvaluator(String generalEvaluator) {
		this.generalEvaluator = generalEvaluator;
	}

	public String getEvaluator5() {
		return evaluator5;
	}

	public void setEvaluator5(String evaluator5) {
		this.evaluator5 = evaluator5;
	}

	public String getEvaluator4() {
		return evaluator4;
	}

	public void setEvaluator4(String evaluator4) {
		this.evaluator4 = evaluator4;
	}

	public String getEvaluator3() {
		return evaluator3;
	}

	public void setEvaluator3(String evaluator3) {
		this.evaluator3 = evaluator3;
	}

	public String getEvaluator2() {
		return evaluator2;
	}

	public void setEvaluator2(String evaluator2) {
		this.evaluator2 = evaluator2;
	}

	public String getEvaluator1() {
		return evaluator1;
	}

	public void setEvaluator1(String evaluator1) {
		this.evaluator1 = evaluator1;
	}

	public String getaHCounter() {
		return aHCounter;
	}

	public void setaHCounter(String aHCounter) {
		this.aHCounter = aHCounter;
	}

	public MemberTable getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(MemberTable createdBy) {
		this.createdBy = createdBy;
	}

	public Club getClubNo() {
		return clubNo;
	}

	public void setClubNo(Club clubNo) {
		this.clubNo = clubNo;
	}
	
	
	

}
