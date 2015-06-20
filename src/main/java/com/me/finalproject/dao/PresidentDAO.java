package com.me.finalproject.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;

import com.me.finalproject.pojo.BalanceSheet;
import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.ExecutiveComitteeRoles;
import com.me.finalproject.pojo.Guest;
import com.me.finalproject.pojo.Meeting;
import com.me.finalproject.pojo.MemberTable;
import com.me.finalproject.pojo.RoleRequest;

public class PresidentDAO extends DAO {

	public ArrayList<MemberTable> getMemberRoster(Club club) {
		Query q = getSession().createQuery(
				"from MemberTable where club = :club");
		q.setParameter("club", club);

		@SuppressWarnings("unchecked")
		ArrayList<MemberTable> memberTables = (ArrayList<MemberTable>) q.list();
		return memberTables;
	}

	public int saveMeeting(Meeting meeting) {
		Session session = getSession();
		try {
			Transaction tran = session.beginTransaction();
			session.saveOrUpdate(meeting);
			tran.commit();
			return 1;
		} catch (Exception ex) {
			ex.printStackTrace();
			return 0;
		}
	}
	public ArrayList<Guest> getGuestsforClub(Club club)
	{
		Session session = getSession();
		Query q = session.createQuery("from Guest where club = :club");
		q.setParameter("club", club);
		@SuppressWarnings("unchecked")
		ArrayList<Guest> guestList = (ArrayList<Guest>)q.list();
		return guestList;
	}
	public ArrayList<RoleRequest> viewRoleRequests(MemberTable memberTable)
	{
		Session session = getSession();
		Query q = session.createQuery("from RoleRequest where requestedTo = :memberTable and status = :status");
		q.setParameter("memberTable", memberTable);
		q.setParameter("status", "pending");
		@SuppressWarnings("unchecked")
		ArrayList<RoleRequest> requestList = (ArrayList<RoleRequest>)q.list();
		return requestList;
	}
	public RoleRequest getRequestForID(int requestID)
	{
		Session session = getSession();
		Query q = session.createQuery("from RoleRequest where roleRequestID = :requestID");
		q.setParameter("requestID", requestID);
		RoleRequest request = (RoleRequest)q.uniqueResult();
		return request;
		
	}
	public ArrayList<BalanceSheet> getBalanceForClub(Club club)
	{
		Session session = getSession();
		Query q = session.createQuery("from BalanceSheet where club = :club");
		q.setParameter("club", club);
		@SuppressWarnings("unchecked")
		ArrayList<BalanceSheet> balanceSheets = (ArrayList<BalanceSheet>)q.list();
		return balanceSheets;
	}
	public int addExpense(BalanceSheet balanceSheet)
	{
		Session session = getSession();
		try {
			Transaction tran = session.beginTransaction();
			session.saveOrUpdate(balanceSheet);
			tran.commit();
			return 1;
		} catch (Exception ex) {
			ex.printStackTrace();
			return 0;
		}
	}
	
	public int deleteExCommByID(int exCommID) {
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		Query q = session.createQuery("delete from ExecutiveComittee where comitteeID = :exCommID");
		q.setParameter("exCommID", exCommID);
		int val = q.executeUpdate();
		tran.commit();
		return val;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		return -1;
		
	}
	public int addExComm(ExecutiveComittee exComm)
	{
		Session session = getSession();
		try {
			Transaction tran = session.beginTransaction();
			session.save(exComm);
			tran.commit();
			return 1;
		} catch (Exception ex) {
			ex.printStackTrace();
			return 0;
		}
	}
	public ArrayList<ExecutiveComitteeRoles> getExCommRoles() {
		Session session = getSession();
		Query q = session.createQuery("from ExecutiveComitteeRoles where exCommRoleId > 1");
		@SuppressWarnings("unchecked")
		ArrayList<ExecutiveComitteeRoles> roles = (ArrayList<ExecutiveComitteeRoles>)q.list();
		return roles;
		
	}
	
	public ExecutiveComitteeRoles getExCommRoleForID(int exCommRoleID)
	{
		Session session = getSession();
		Query q = session.createQuery("from ExecutiveComitteeRoles where exCommRoleId = :exCommRoleID");
		q.setParameter("exCommRoleID", exCommRoleID);
		ExecutiveComitteeRoles executiveComitteeRoles = (ExecutiveComitteeRoles)q.uniqueResult();
		return executiveComitteeRoles;
	}
	public int addGuest(Guest guest)
	{
		Session session = getSession();
		try {
			Transaction tran = session.beginTransaction();
			session.save(guest);
			tran.commit();
			return 1;
		} catch (Exception ex) {
			ex.printStackTrace();
			return 0;
		}
	}
	
	
}
