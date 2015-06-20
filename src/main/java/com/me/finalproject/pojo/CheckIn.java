package com.me.finalproject.pojo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CheckIn")
public class CheckIn implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int checkInID; 
	
	@OneToOne
	@JoinColumn(name = "clubNo")
	private Club club; 
	
	@OneToOne
	@JoinColumn(name = "meetingId")
	private Meeting meeting;
	
	@OneToOne
	@JoinColumn(name = "guestId")
	private Guest guest; 
	
	@OneToOne
	@JoinColumn(name = "customerId")
	private MemberTable memberTable;

	public int getCheckInID() {
		return checkInID;
	}

	public void setCheckInID(int checkInID) {
		this.checkInID = checkInID;
	}

	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public Guest getGuest() {
		return guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	public MemberTable getMemberTable() {
		return memberTable;
	}

	public void setMemberTable(MemberTable memberTable) {
		this.memberTable = memberTable;
	}
	
	
	
	

}
