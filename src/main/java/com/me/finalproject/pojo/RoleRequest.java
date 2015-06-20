package com.me.finalproject.pojo;

import java.io.Serializable;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name = "RoleRequest")
public class RoleRequest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RoleRequestID")
	private int roleRequestID; 
	
	@OneToOne
	@JoinColumn(name = "meetingID")
	private Meeting meetingID; 
	
	@OneToOne
	@JoinColumn(name = "requestedBy")
	private MemberTable requestedBy;
	
	@OneToOne
	@JoinColumn(name = "requestedTo") 
	private MemberTable requestedTo; 
	
	@Column(name = "role")
	private String role; 
	
	@Column(name = "message")
	private String message;
	
	@Column(name = "status")
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRoleRequestID() {
		return roleRequestID;
	}

	public void setRoleRequestID(int roleRequestID) {
		this.roleRequestID = roleRequestID;
	}

	public Meeting getMeetingID() {
		return meetingID;
	}

	public void setMeetingID(Meeting meetingID) {
		this.meetingID = meetingID;
	}

	public MemberTable getRequestedBy() {
		return requestedBy;
	}

	public void setRequestedBy(MemberTable requestedBy) {
		this.requestedBy = requestedBy;
	}

	public MemberTable getRequestedTo() {
		return requestedTo;
	}

	public void setRequestedTo(MemberTable requestedTo) {
		this.requestedTo = requestedTo;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
	
}
