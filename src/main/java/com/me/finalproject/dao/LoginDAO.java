package com.me.finalproject.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.MemberTable;

public class LoginDAO extends DAO {
	public MemberTable getMember(String email,String password) throws Exception
	{
		try {
			Query q = getSession()
					.createQuery(
							"from MemberTable where email = :email and password = :password and status = :status");
			q.setParameter("email", email);
			q.setParameter("password", password);
			q.setParameter("status", "active");

			MemberTable memberTable = (MemberTable) q.uniqueResult();
			
			/*@SuppressWarnings("unchecked")
			List<String> roleList = getSession().createQuery(
					"select exCommRoles.executiveComitteeRole from MemberTable memberTable innerjoin ExecutiveComittee exComm innerjoin ExecutiveCommitteeRoles exCommRoles" +
					"where memberTable.customerID = exComm.customerID and exComm.ExcommRoleId = exCommRoles.ExcommRoleId and memberTable.customerID = :customerID").list();
			memberTable.setRoleList(roleList);*/
			return memberTable;
			
			
		} catch (HibernateException e) {
			throw new Exception("Could not find user" + e);
		}
	}
	public List<ExecutiveComittee> getRoles(int customerID) throws Exception
	{
		try {
			
			Query q = getSession().createQuery("from ExecutiveComittee where customerID = :customerID");
			q.setParameter("customerID", customerID);
			
			@SuppressWarnings("unchecked")
			List<ExecutiveComittee> roleList = (List<ExecutiveComittee>)q.list();
			return roleList;
			
			
		} catch (HibernateException e) {
			throw new Exception("Could not find user" + e);
		}
	}

}
