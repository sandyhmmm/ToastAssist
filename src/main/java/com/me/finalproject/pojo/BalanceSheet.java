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
@Table(name = "BalanceSheet")
public class BalanceSheet implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int balanceSheetID;
	
	@OneToOne
	@JoinColumn(name = "CustomerID")
	private MemberTable member;
	
	@OneToOne
	@JoinColumn(name = "Treasurer")
	private MemberTable treasurer;
	
	@Column(name = "Amount")
	private double amount;
	
	@OneToOne
	@JoinColumn(name = "ClubNo")
	private Club club;
	
	@Column(name = "Comment")
	private String comment;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getBalanceSheetID() {
		return balanceSheetID;
	}

	public void setBalanceSheetID(int balanceSheetID) {
		this.balanceSheetID = balanceSheetID;
	}

	public MemberTable getMember() {
		return member;
	}

	public void setMember(MemberTable member) {
		this.member = member;
	}

	public MemberTable getTreasurer() {
		return treasurer;
	}

	public void setTreasurer(MemberTable treasurer) {
		this.treasurer = treasurer;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
	}
	
	
	
	

}
