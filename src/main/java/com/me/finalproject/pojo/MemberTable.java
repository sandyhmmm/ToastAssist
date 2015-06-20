package com.me.finalproject.pojo;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Required;


@Entity
@Table(name = "MemberTable")
public class MemberTable implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id 
	@Column(name = "customerId")
	private int customerId;
	
	@Length(max = 100)
	@Column(name="name")
	private String name;
	
	@Column(name = "mailStop")
	private String mailStop;
	
	@Column(name = "addrL1")
	private String addrL1;
	
	@Column(name = "addrL2")
	private String addrL2;
	
	@Column(name = "addrL3")
	private String addrL3;
	
	@Column(name = "addrL4")
	private String addrL4;
	
	@NotNull
	@Pattern(regexp=".+@.+\\..+")
	@Column(name = "email")
	private String email;
	
	@Column(name = "secondaryEmail")
	private String secondaryEmail;
	
	@Column(name = "home")
	private String home;
	
	@Column(name = "work")
	private String work;
	
	@Column(name = "fax")
	private String fax;
	
	@Column(name = "mobile")
	private String mobile;
	
	@Column(name = "membershipPeriod")
	private String membershipPeriod;
	
	@Column(name = "memberSince")
	private String memberSince;
	
	@Column(name = "status")
	private String status;
	
	public Set<ExecutiveComittee> getExecutiveComittee() {
		return executiveComittee;
	}
	public void setExecutiveComittee(Set<ExecutiveComittee> executiveComittee) {
		this.executiveComittee = executiveComittee;
	}
	@NotNull
	@Column(name = "password")
	private String password;
	
	@OneToOne
	@JoinColumn(name="ClubNo")
	private Club club;
	
	@OneToMany(mappedBy= "memberTable")
	private Set<ExecutiveComittee> executiveComittee;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMailStop() {
		return mailStop;
	}
	public void setMailStop(String mailStop) {
		this.mailStop = mailStop;
	}
	public String getAddrL1() {
		return addrL1;
	}
	public void setAddrL1(String addrL1) {
		this.addrL1 = addrL1;
	}
	public String getAddrL2() {
		return addrL2;
	}
	public void setAddrL2(String addrL2) {
		this.addrL2 = addrL2;
	}
	public String getAddrL3() {
		return addrL3;
	}
	public void setAddrL3(String addrL3) {
		this.addrL3 = addrL3;
	}
	public String getAddrL4() {
		return addrL4;
	}
	public void setAddrL4(String addrL4) {
		this.addrL4 = addrL4;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSecondaryEmail() {
		return secondaryEmail;
	}
	public void setSecondaryEmail(String secondaryEmail) {
		this.secondaryEmail = secondaryEmail;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getMembershipPeriod() {
		return membershipPeriod;
	}
	public void setMembershipPeriod(String membershipPeriod) {
		this.membershipPeriod = membershipPeriod;
	}
	public String getMemberSince() {
		return memberSince;
	}
	public void setMemberSince(String memberSince) {
		this.memberSince = memberSince;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Club getClub() {
		return club;
	}
	public void setClub(Club club) {
		this.club = club;
	}
	
	/*
	@Override
	public Collection<ExecutiveComittee> getAuthorities() {
		// TODO Auto-generated method stub
		return executiveComittee;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return email;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return status.equalsIgnoreCase("active");
	}
	
	*/

}
