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

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name = "TimerReport")
public class TimerReport implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int timerReportID; 
	
	@OneToOne
	@JoinColumn(name = "meetingID")
	private Meeting meeting; 
	
	@OneToOne
	@JoinColumn(name = "timer")
	private MemberTable timer; 
	
	@Column(name = "rolePlayer")
	private String rolePlayer; 
	
	@Column(name = "role")
	private String role; 
	
	@Column(name = "timeTaken")
	private String timeTaken;

	public int getTimerReportID() {
		return timerReportID;
	}

	public void setTimerReportID(int timerReportID) {
		this.timerReportID = timerReportID;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public MemberTable getTimer() {
		return timer;
	}

	public void setTimer(MemberTable timer) {
		this.timer = timer;
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

	public String getTimeTaken() {
		return timeTaken;
	}

	public void setTimeTaken(String timeTaken) {
		this.timeTaken = timeTaken;
	}

}
