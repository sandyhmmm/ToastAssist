package com.me.finalproject.pojo;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name ="ExecutiveComittee")
public class ExecutiveComittee implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "comitteeID")
	private int comitteeID;
	
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name = "customerId")
	private MemberTable memberTable;
	
	@OneToOne
	@JoinColumn(name="ExcommRoleID")
	private ExecutiveComitteeRoles comitteeRoles;

	public ExecutiveComitteeRoles getComitteeRoles() {
		return comitteeRoles;
	}

	public void setComitteeRoles(ExecutiveComitteeRoles comitteeRoles) {
		this.comitteeRoles = comitteeRoles;
	}

	public int getComitteeID() {
		return comitteeID;
	}

	public void setComitteeID(int comitteeID) {
		this.comitteeID = comitteeID;
	}

	public MemberTable getMemberTable() {
		return memberTable;
	}

	public void setMemberTable(MemberTable memberTable) {
		this.memberTable = memberTable;
	}
/*
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return comitteeRoles.getExecutiveComitteeRole();
	}

	
*/
	

}
