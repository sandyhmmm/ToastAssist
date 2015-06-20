package com.me.finalproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.ExecutiveComitteeRoles;
import com.me.finalproject.pojo.MemberTable;

public class AdminDAO extends DAO {

	public int addClub(Club club) {
		Session session = getSession();
		session.beginTransaction();
		session.save(club);
		session.getTransaction().commit();
		return 1;

	}

	public int addMember(MemberTable memberTable) {
		try {
			Session session = getSession();
			session.beginTransaction();
			session.saveOrUpdate(memberTable);
			session.getTransaction().commit();
		} catch (Exception ex) {
			System.out.println(ex);
			return 0;
		}
		return 1;
	}

	public int addExecutiveCommiteeRoles(ExecutiveComittee executiveComittee, int roleID) {
		Session session = getSession();
		try {
			
			Query q = session
					.createQuery("from ExecutiveComitteeRoles where exCommRoleID = :roleID");
			q.setParameter("roleID", roleID);
			ExecutiveComitteeRoles executiveComitteeRoles = (ExecutiveComitteeRoles) q
					.uniqueResult();
			executiveComittee.setComitteeRoles(executiveComitteeRoles);
			session.beginTransaction();
			session.save(executiveComittee);
			session.getTransaction().commit();
		} catch (Exception ex) {
			System.out.println(ex);
			return 0;
		}
		finally
		{
			session.close();
		}
		return 1;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<Club> getClubList() 
	{
		ArrayList<Club> clubList = new ArrayList<Club>();
		Query q = getSession().createQuery("from Club");
		clubList = (ArrayList<Club>)q.list();
		return clubList;
	
	}
	
	public Club getClubForClubName(int clubID)
	{
		Query q = getSession().createQuery("from Club where clubNo = :clubID");
		q.setParameter("clubID", clubID);
		return (Club)q.uniqueResult();
	}
	
}
