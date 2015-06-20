package com.me.finalproject.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

@Entity
@Table(name = "ExecutiveComitteeRoles")
public class ExecutiveComitteeRoles implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name ="exCommRoleId")
	private int exCommRoleId;
	
	@Column(name ="ExecutiveComitteeRole")
	private String executiveComitteeRole;

	public int getExCommRoleId() {
		return exCommRoleId;
	}

	public void setExCommRoleId(int exCommRoleId) {
		this.exCommRoleId = exCommRoleId;
	}

	public String getExecutiveComitteeRole() {
		return executiveComitteeRole;
	}

	public void setExecutiveComitteeRole(String executiveComitteeRole) {
		this.executiveComitteeRole = executiveComitteeRole;
	}
	
	

}
