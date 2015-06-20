package com.me.finalproject.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.me.finalproject.pojo.AhCounterReport;
import com.me.finalproject.pojo.BalanceSheet;
import com.me.finalproject.pojo.CheckIn;
import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.EvaluatorReport;
import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.GeneralEvaluatorReport;
import com.me.finalproject.pojo.GrammarianReport;
import com.me.finalproject.pojo.Guest;
import com.me.finalproject.pojo.Meeting;
import com.me.finalproject.pojo.MemberTable;
import com.me.finalproject.pojo.RoleRequest;
import com.me.finalproject.pojo.TimerReport;


public class MemberDAO extends DAO {

	public Guest getGuestByEmailID(String emailID, Club club) {
		Query q = getSession().createQuery(
				"from Guest where guestEmailID = :emailID and club = :club");
		q.setParameter("emailID", emailID);
		q.setParameter("club", club);

		Guest guest = (Guest) q.uniqueResult();

		return guest;

	}
	
	public void saveGuest(Guest guest,CheckIn checkIn)
	{
		Session session = getSession();
		Transaction tran = session.beginTransaction();
	
		try
		{		
		session.save(guest);
		
		tran.commit();
		
		checkIn.setGuest(guest);
		checkin(checkIn);
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tran.rollback();
		}
		finally
		{
			
		}
		
	}
	public void checkInMember(int customerID, CheckIn checkIn)
	{
		Session session = getSession();
		//Transaction tran = session.beginTransaction();
		
		Query q = session.createQuery("from MemberTable where customerID = :customerID");
		q.setParameter("customerID", customerID);
		MemberTable memberTable = (MemberTable)q.uniqueResult();
		checkIn.setMemberTable(memberTable);
		checkIn.setClub(memberTable.getClub());
		//tbd
		
		
		checkin(checkIn);
	}
	public Meeting getMeetingByID(int meetingID)
	{
		Session session = getSession();
		Query q = session.createQuery("from Meeting where meetingID = :meetingID");
		q.setParameter("meetingID", meetingID);
		Meeting meeting = (Meeting)q.uniqueResult();
		
		return meeting;
		
	}
	@SuppressWarnings("unchecked")
	public ArrayList<Meeting> getMeetingByStatus(String status,Club club)
	{
		Session session = getSession();
		ArrayList<Meeting> meetings = new ArrayList<Meeting>();
		Query q = session.createQuery("from Meeting where clubNo = :club and status = :status");
		q.setParameter("club", club);
		q.setParameter("status", status);
		meetings = (ArrayList<Meeting>)q.list();
		
		
		return meetings;
		
		
	}
	
	public void saveRoleRequest(RoleRequest request)
	{
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		
		session.saveOrUpdate(request);
		tran.commit();
		}
		catch(Exception ex)
		{
			tran.rollback();
			ex.printStackTrace();
		}
		finally
		{
			
		}
	}
	public void saveCheckIn(CheckIn checkIn)
	{
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		
		session.saveOrUpdate(checkIn);
		tran.commit();
		}
		catch(Exception ex)
		{
			tran.rollback();
			ex.printStackTrace();
		}
		finally
		{
			
		}
	}
	public void checkin(CheckIn checkIn)
	{
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		session.save(checkIn);
		tran.commit();
	}
	
	public ArrayList<CheckIn> checkedInList(Meeting meeting)
	{
		Session session = getSession();
		Query q1 = session.createQuery("from CheckIn where meeting = :meeting");
		q1.setParameter("meeting", meeting);
		@SuppressWarnings("unchecked")
		ArrayList<CheckIn> checkIns = (ArrayList<CheckIn>)q1.list();
		return checkIns;
		
	}
	public MemberTable getMemberByEmail(String email)
	{
		Query q = getSession().createQuery("from MemberTable where email = :email");
		q.setParameter("email", email);
		
		MemberTable memberTable = (MemberTable)q.uniqueResult();
		return memberTable;
	}
	public ArrayList<BalanceSheet> getBalanceForMember(MemberTable memberTable)
	{
		try
		{
		Query q = getSession().createQuery("from BalanceSheet where member = :memberTable");
		q.setParameter("memberTable", memberTable);
		@SuppressWarnings("unchecked")
		ArrayList<BalanceSheet> balanceSheets = (ArrayList<BalanceSheet>)q.list();
		return balanceSheets;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public MemberTable changePassword(MemberTable member) {
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
			Query q = session.createQuery("update MemberTable set password = :password where customerId = :customerId");
			q.setParameter("password", member.getPassword());
			q.setParameter("customerId", member.getCustomerId());
			int result = q.executeUpdate();
			tran.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}

		Query qq = getSession().createQuery(
				"from MemberTable where customerId = :customerId");
		qq.setInteger("customerId", member.getCustomerId());
		MemberTable memberTable = (MemberTable) qq.uniqueResult();
		return memberTable;
	}
	public ArrayList<ExecutiveComittee> getExCommForClub(Club club)
	{	
		Session session = getSession();
		Query q = session.createQuery("from ExecutiveComittee where memberTable.club = :club");
		q.setParameter("club", club);
		@SuppressWarnings("unchecked")
		ArrayList<ExecutiveComittee> exComm = (ArrayList<ExecutiveComittee>)q.list();
		return exComm;
	}
	public void saveTimerReport(TimerReport timerReport) {
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		
		session.saveOrUpdate(timerReport);
		tran.commit();
		}
		catch(Exception ex)
		{
			tran.rollback();
			ex.printStackTrace();
		}
		finally
		{
			
		}
	}
	public void saveAhCounterReport(AhCounterReport ahCounterReport) {
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		
		session.save(ahCounterReport);
		tran.commit();
		}
		catch(Exception ex)
		{
			tran.rollback();
			ex.printStackTrace();
		}
		finally
		{
			
		}
	}
	public void saveEvaluatorReport(EvaluatorReport evaluatorReport) {
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		
		session.saveOrUpdate(evaluatorReport);
		tran.commit();
		}
		catch(Exception ex)
		{
			tran.rollback();
			ex.printStackTrace();
		}
		finally
		{
			
		}
	}
	public void saveGeneralEvaluatorReport(GeneralEvaluatorReport evaluatorReport) {
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		
		session.saveOrUpdate(evaluatorReport);
		tran.commit();
		}
		catch(Exception ex)
		{
			tran.rollback();
			ex.printStackTrace();
		}
		finally
		{
			
		}
	}
	public void saveGrammarianReport(GrammarianReport grammarianReport) {
		Session session = getSession();
		Transaction tran = session.beginTransaction();
		try
		{
		
		session.saveOrUpdate(grammarianReport);
		tran.commit();
		}
		catch(Exception ex)
		{
			tran.rollback();
			ex.printStackTrace();
		}
		finally
		{
			
		}
	}
	public ArrayList<TimerReport> getTimerReportForMeeting(Meeting meeting)
	{	
		Session session = getSession();
		Query q = session.createQuery("from TimerReport where meeting = :meeting");
		q.setParameter("meeting", meeting);
		@SuppressWarnings("unchecked")
		ArrayList<TimerReport> timerReport = (ArrayList<TimerReport>)q.list();
		return timerReport;
	}
	public ArrayList<AhCounterReport> getAhCounterReportForMeeting(Meeting meeting)
	{	
		Session session = getSession();
		Query q = session.createQuery("from AhCounterReport where meeting = :meeting");
		q.setParameter("meeting", meeting);
		@SuppressWarnings("unchecked")
		ArrayList<AhCounterReport> ahCounterReport = (ArrayList<AhCounterReport>)q.list();
		return ahCounterReport;
	}
	public ArrayList<EvaluatorReport> getEvaluatorReportForMeeting(Meeting meeting)
	{	
		Session session = getSession();
		Query q = session.createQuery("from EvaluatorReport where meetingID = :meeting");
		q.setParameter("meeting", meeting);
		@SuppressWarnings("unchecked")
		ArrayList<EvaluatorReport> evaluatorReport = (ArrayList<EvaluatorReport>)q.list();
		return evaluatorReport;
	}
	
	
}
