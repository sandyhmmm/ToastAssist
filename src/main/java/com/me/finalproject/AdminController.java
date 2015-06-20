package com.me.finalproject;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.me.finalproject.converter.StringToClub;
import com.me.finalproject.dao.AdminDAO;
import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.ExecutiveComitteeRoles;
import com.me.finalproject.pojo.MemberTable;

@Controller
public class AdminController {
	
	@Autowired
	AdminDAO adminDAO;
	
	@Autowired
	StringToClub stringToClub;
	
	@RequestMapping(value ="/addClubPage")
	public String addClubPage(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		for(ExecutiveComittee comm:memberTable.getExecutiveComittee())
		{
			if(comm.getComitteeRoles().getExecutiveComitteeRole().equalsIgnoreCase("Admin"))
			{
				Club club = new Club();
				model.addAttribute("club", club);
				
				return "Admin/addclub";
			}
		}
		model.addAttribute("ex","No access to this page");
		return "errorPage";
		
	}
	
	@RequestMapping(value ="/addClub")
	public String addClub(HttpServletRequest request, HttpServletResponse response, Club club,Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		for(ExecutiveComittee comm:memberTable.getExecutiveComittee())
		{
			if(comm.getComitteeRoles().getExecutiveComitteeRole().equalsIgnoreCase("Admin"))
			{
				adminDAO.addClub(club);
				model.addAttribute("message","Club added succesfully");
				return "successPage";
				
			}
		}
		model.addAttribute("ex","No access to this page");
		return "errorPage";
		
	}
	@RequestMapping(value ="/addPresidentPage")
	public String addPresidentPage(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		MemberTable member = (MemberTable)session.getAttribute("memberTable");
		for(ExecutiveComittee comm:member.getExecutiveComittee())
		{
			if(comm.getComitteeRoles().getExecutiveComitteeRole().equalsIgnoreCase("Admin"))
			{
				ArrayList<Club> clubList = adminDAO.getClubList();
				MemberTable memberTable = new MemberTable();
				model.addAttribute("memberTable", memberTable);
				model.addAttribute("clubList",clubList);
				return "Admin/addpresident";
				
			}
		}
		model.addAttribute("ex","No access to this page");
		return "errorPage";
		
	}
	@RequestMapping(value ="/addPresident")
	public String addPresident(HttpServletRequest request, HttpServletResponse response, MemberTable memberTable, Model model)
	{
		HttpSession session = request.getSession();
		MemberTable member = (MemberTable)session.getAttribute("memberTable");
		for(ExecutiveComittee comm:member.getExecutiveComittee())
		{
			if(comm.getComitteeRoles().getExecutiveComitteeRole().equalsIgnoreCase("Admin"))
			{

				memberTable.setPassword("password");
				if(adminDAO.addMember(memberTable) == 1)
				{
					ExecutiveComittee executiveComittee = new ExecutiveComittee();
					executiveComittee.setMemberTable(memberTable);
					adminDAO.addExecutiveCommiteeRoles(executiveComittee,2);
					model.addAttribute("message", "President Added Succesfully");
					return "successPage";
				}
				
			}
		}
		model.addAttribute("ex","No access to this page");
		return "errorPage";
		
	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Club.class, this.stringToClub);
    }

}
