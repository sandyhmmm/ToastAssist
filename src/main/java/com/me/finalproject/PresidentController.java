package com.me.finalproject;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hamcrest.core.IsInstanceOf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.me.finalproject.component.MailHelper;
import com.me.finalproject.converter.StringToClub;
import com.me.finalproject.converter.StringToExCommRoleTable;
import com.me.finalproject.converter.StringToMeeting;
import com.me.finalproject.converter.StringToMemberTable;
import com.me.finalproject.dao.AdminDAO;
import com.me.finalproject.dao.MemberDAO;
import com.me.finalproject.dao.PresidentDAO;
import com.me.finalproject.pojo.BalanceSheet;
import com.me.finalproject.pojo.CheckIn;
import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.ExecutiveComitteeRoles;
import com.me.finalproject.pojo.Guest;
import com.me.finalproject.pojo.Meeting;
import com.me.finalproject.pojo.MemberTable;
import com.me.finalproject.pojo.RoleRequest;
import com.me.finalproject.utility.UtilityFunctions;

@Controller
public class PresidentController {

	@Autowired
	UtilityFunctions utilityFunctions;

	@Autowired
	AdminDAO adminDAO;

	@Autowired
	PresidentDAO presidentDAO;

	@Autowired
	MailHelper mailHelper;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	StringToMemberTable stringToMemberTable;

	@Autowired
	StringToExCommRoleTable stringToExCommRoleTable;
	
	@Autowired
	StringToMeeting stringToMeeting;
	
	@Autowired
	StringToClub stringToClub;

	@RequestMapping(value = "updateMembersPage")
	public String updateMembersPage(HttpServletRequest request) {

		return "updatemembers";

	}

	@RequestMapping(value = "updateMembers")
	public String uploadFileHandler(HttpServletRequest request,
			@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file, Model model) {

		HttpSession session = request.getSession();
		MemberTable myDetails = (MemberTable) session
				.getAttribute("memberTable");
		if (!file.isEmpty()) {
			try {
				File fileName = new File(file.getOriginalFilename());
				file.transferTo(fileName);
				ArrayList<MemberTable> memberTables = utilityFunctions
						.extractMembers(fileName);
				for (MemberTable newMember : memberTables) {
					newMember.setPassword("password");
					newMember.setClub(myDetails.getClub());
					adminDAO.addMember(newMember);
				}
				ArrayList<MemberTable> members = new ArrayList<MemberTable>();
				memberTables = presidentDAO
						.getMemberRoster(myDetails.getClub());
				model.addAttribute("memberTables", members);
				return "viewmembers";
			} catch (Exception ex) {
				System.out.println(ex);
				model.addAttribute("ex", ex.getMessage());
				return "errorpage";
			}
		} else {
			model.addAttribute("ex", "file is empty!");
			return "errorpage";
		}
	}

	@RequestMapping(value = "viewMembers")
	public String viewMemberRoster(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable myDetails = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<MemberTable> memberTables = new ArrayList<MemberTable>();
		memberTables = presidentDAO.getMemberRoster(myDetails.getClub());
		model.addAttribute("memberTables", memberTables);
		return "viewmembers";

	}

	@RequestMapping(value = "/mailAllMembers")
	public String mailAllMembers(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable myDetails = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<MemberTable> members = presidentDAO.getMemberRoster(myDetails
				.getClub());
		String[] emailArray = new String[members.size()];
		int i = 0;
		for (MemberTable memberTable : members) {
			emailArray[i] = memberTable.getEmail();
			i++;
		}
		emailArray = new String[3];
		emailArray[0] = "sandyhmmm@gmail.com";
		emailArray[1] = "mansi.bdeo@gmail.com";
		emailArray[2] = "anirudhbedre@gmail.com";
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setTo(emailArray);
		model.addAttribute("simpleMailMessage", simpleMailMessage);
		model.addAttribute("title", "Mail All members");
		return "multiMail";
	}

	@RequestMapping(value = "/sendMailPage")
	public String sendMailPage(HttpServletRequest request, Model model) {
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		model.addAttribute("simpleMailMessage", simpleMailMessage);

		return "mailPage";
	}

	@RequestMapping(value = "/sendMail")
	public String sendMail(Model model, SimpleMailMessage simpleMailMessage) {
		try {
			mailHelper
					.sendMail(simpleMailMessage.getReplyTo(),
							simpleMailMessage.getSubject(),
							simpleMailMessage.getText());
			model.addAttribute("message", "Mail sent");
			return "successPage";
		} catch (Exception ex) {
			System.out.println(ex);
			model.addAttribute("ex", ex.getMessage());
			return "errorPage";
		}
	}
	@RequestMapping(value = "/sendMultiMail")
	public String sendMultiMail(Model model, SimpleMailMessage simpleMailMessage) {
		try {
			mailHelper
					.sendMailToMany(simpleMailMessage.getTo(),
							simpleMailMessage.getSubject(),
							simpleMailMessage.getText());
			model.addAttribute("message", "Mail Sent");
			return "successPage";
		} catch (Exception ex) {
			System.out.println(ex);
			model.addAttribute("ex", ex.getMessage());
			return "errorPage";
		}
	}

	@RequestMapping(value = "/sendInstantMail")
	public String sendInstantMail(Model model, String to, String subject,
			String text) {
		try {
			mailHelper.sendMail(to, subject, text);
			model.addAttribute("message", "Mail Sent");
			return "successPage";
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
			model.addAttribute("ex", ex.getMessage());
			return "errorPage";
		}
	}

	@RequestMapping(value = "/createMeetingPage")
	public String createMeeting(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberTable member = (MemberTable)session.getAttribute("memberTable");
		for(ExecutiveComittee comm:member.getExecutiveComittee())
		{
			if(comm.getComitteeRoles().getExecutiveComitteeRole().equalsIgnoreCase("VicePresident-Education"))
			{
				model.addAttribute("meeting", new Meeting());
				return "createMeeting";
				
			}
		}
		model.addAttribute("ex","No access to this page");
		return "errorPage";
		
	}

	@RequestMapping(value = "/createMeeting")
	public String createMeeting(HttpServletRequest request, Meeting meeting, Model model) {
		HttpSession session = request.getSession();
		MemberTable member = (MemberTable)session.getAttribute("memberTable");
		for(ExecutiveComittee comm:member.getExecutiveComittee())
		{
			if(comm.getComitteeRoles().getExecutiveComitteeRole().equalsIgnoreCase("VicePresident-Education"))
			{
				meeting.setClubNo(member.getClub());
				meeting.setCreatedBy(member);
				meeting.setStatus("open");

				if (presidentDAO.saveMeeting(meeting) == 1) {
					model.addAttribute("message", "Meeting created and added");
					return "successPage";
				}
				model.addAttribute("ex", "President was not added");
				return "errorPage";
				
			}
		}
		model.addAttribute("ex","No access to this page");
		return "errorPage";
		
	}

	@RequestMapping(value = "checkin")
	public String checkIn(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable myDetails = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<Meeting> meetings = memberDAO.getMeetingByStatus("checkin",
				myDetails.getClub());
		ArrayList<MemberTable> memberTables = presidentDAO
				.getMemberRoster(myDetails.getClub());
		model.addAttribute("memberTables", memberTables);
		model.addAttribute("meetings", meetings);
		return "checkin";
	}

	@RequestMapping(value = "reviewRequests")
	public String reviewRequests(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable myDetails = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<RoleRequest> roleRequests = presidentDAO
				.viewRoleRequests(myDetails);
		model.addAttribute("roleRequests", roleRequests);
		return "reviewRequests";
	}

	@RequestMapping(value = "approveRequest")
	public String approveRequest(HttpServletRequest request, Model model) {
		String[] approveRequest = request.getParameterValues("approve");
		for (String requestID : approveRequest) {
			RoleRequest roleRequest = presidentDAO.getRequestForID(Integer
					.parseInt(requestID));
			if (roleRequest.getRole().trim().equalsIgnoreCase("speaker1")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setSpeaker1(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("evaluator1")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setEvaluator1(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("speaker2")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setSpeaker2(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("evaluator2")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setEvaluator2(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("speaker3")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setSpeaker3(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("evaluator3")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setEvaluator3(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("speaker4")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setSpeaker4(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("evaluator4")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setEvaluator4(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("speaker5")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setSpeaker5(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("evaluator5")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setEvaluator5(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("toastmaster")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setToastmaster(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("ttmaster")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().settTMaster(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim()
					.equalsIgnoreCase("generalEvaluator")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setGeneralEvaluator(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("timer")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setTimer(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("aHCounter")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setaHCounter(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			if (roleRequest.getRole().trim().equalsIgnoreCase("grammarian")) {
				roleRequest.setStatus("approved");
				roleRequest.getMeetingID().setGrammarian(
						roleRequest.getRequestedBy().getName());
				presidentDAO.saveMeeting(roleRequest.getMeetingID());
			}
			model.addAttribute("message", "Request was approved");
			memberDAO.saveRoleRequest(roleRequest);

		}
		model.addAttribute("message", "Role Approved");
		return "successPage";
	}

	@RequestMapping(value = "getExpensesForClub")
	public String getExpensesForClub(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<BalanceSheet> balanceList = presidentDAO
				.getBalanceForClub(memberTable.getClub());
		ArrayList<MemberTable> members = presidentDAO
				.getMemberRoster(memberTable.getClub());
		model.addAttribute("balanceSheet", new BalanceSheet());
		model.addAttribute("members", members);
		model.addAttribute("balanceList", balanceList);
		model.addAttribute("canAdd", true);
		return "trackExpenses";
	}

	@RequestMapping(value = "addExpense")
	public String addExpense(Model model, HttpServletRequest request,
			BalanceSheet balanceSheet) {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		balanceSheet.setTreasurer(memberTable);
		balanceSheet.setClub(memberTable.getClub());
		presidentDAO.addExpense(balanceSheet);
		ArrayList<BalanceSheet> balanceList = presidentDAO
				.getBalanceForClub(memberTable.getClub());
		ArrayList<MemberTable> members = presidentDAO
				.getMemberRoster(memberTable.getClub());
		model.addAttribute("balanceSheet", new BalanceSheet());
		model.addAttribute("members", members);
		model.addAttribute("balanceList", balanceList);
		model.addAttribute("canAdd", true);
		return "trackExpenses";
	}

	@RequestMapping(value = "editExcommMembers")
	public String getExcommMembers(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<ExecutiveComittee> exComm = memberDAO
				.getExCommForClub(memberTable.getClub());
		ArrayList<MemberTable> members = presidentDAO
				.getMemberRoster(memberTable.getClub());
		model.addAttribute("members", members);
		model.addAttribute("edit", true);
		model.addAttribute("exComm", exComm);
		model.addAttribute("newExcomm", new ExecutiveComittee());
		model.addAttribute("roles", presidentDAO.getExCommRoles());
		return "viewExcomm";
	}

	@RequestMapping(value = "deleteExcomm")
	public String deleteExComm(HttpServletRequest request, Model model) {
		int exCommID = Integer.parseInt(request.getParameter("exCommID"));
		presidentDAO.deleteExCommByID(exCommID);
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<ExecutiveComittee> exComm = memberDAO
				.getExCommForClub(memberTable.getClub());
		ArrayList<MemberTable> members = presidentDAO
				.getMemberRoster(memberTable.getClub());
		model.addAttribute("members", members);
		model.addAttribute("edit", true);
		model.addAttribute("exComm", exComm);
		model.addAttribute("newExcomm", new ExecutiveComittee());
		model.addAttribute("roles", presidentDAO.getExCommRoles());
		return "viewExcomm";
	}

	@RequestMapping(value = "addExcomm")
	public String addExcomm(HttpServletRequest request, Model model,
			ExecutiveComittee newExcomm) {
		presidentDAO.addExComm(newExcomm);
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<ExecutiveComittee> exComm = memberDAO
				.getExCommForClub(memberTable.getClub());
		ArrayList<MemberTable> members = presidentDAO
				.getMemberRoster(memberTable.getClub());
		model.addAttribute("members", members);
		model.addAttribute("edit", true);
		model.addAttribute("exComm", exComm);
		model.addAttribute("newExcomm", new ExecutiveComittee());
		model.addAttribute("roles", presidentDAO.getExCommRoles());
		return "viewExcomm";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(MemberTable.class, this.stringToMemberTable);
		binder.registerCustomEditor(ExecutiveComitteeRoles.class,
				this.stringToExCommRoleTable);
		binder.registerCustomEditor(Meeting.class, this.stringToMeeting);
		binder.registerCustomEditor(Club.class, this.stringToClub);
		
	}
	
	@RequestMapping(value = "allMeetings")
	public String openMeetings(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		ArrayList<Meeting> openMeetings =memberDAO.getMeetingByStatus("open", memberTable.getClub());
		model.addAttribute("openMeetings", openMeetings);
		ArrayList<Meeting> checkInMeetings =memberDAO.getMeetingByStatus("checkin", memberTable.getClub());
		model.addAttribute("checkInMeetings", checkInMeetings);
		ArrayList<Meeting> completeMeetings =memberDAO.getMeetingByStatus("complete", memberTable.getClub());
		model.addAttribute("completeMeetings", completeMeetings);
		model.addAttribute("checkIn", new CheckIn());
		return "selectMeetingToEdit";
	}
	
	@RequestMapping(value = "openMeeting")
	public String openMeeting(CheckIn checkin, Model model)
	{
		
		
		model.addAttribute("meeting",checkin.getMeeting());
		return "openMeetings";
	}
	
	@RequestMapping(value = "saveMeeting")
	public String saveMeeting(Meeting meeting,HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		String time = request.getParameter("date");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		meeting.setClubNo(memberTable.getClub());
		meeting.setCreatedBy(memberTable);
		try
		{
		date =  format.parse(time);
		meeting.setMeetingDate(date);
		
		presidentDAO.saveMeeting(meeting);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			model.addAttribute("ex", ex.getMessage());
			return "errorPage";
		}
		
		model.addAttribute("message", "Meeting was saved");
		return "successPage";
	}
	@RequestMapping(value = "addGuestPage")
	public String addGuestPage(Model model)
	{
		model.addAttribute("guest", new Guest());
		return "addGuest";
	}
	@RequestMapping(value = "addGuest")
	public String addGuest(Guest guest,HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		guest.setClub(memberTable.getClub());
		presidentDAO.addGuest(guest);
		model.addAttribute("message","Guest Added");
		return "successPage";
	}
	@RequestMapping(value = "/mailAllGuests")
	public String mailAllGuests(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable myDetails = (MemberTable) session
				.getAttribute("memberTable");
		ArrayList<Guest> guests = presidentDAO.getGuestsforClub(myDetails
				.getClub());
		String[] emailArray = new String[guests.size()];
		int i = 0;
		for (Guest guest : guests) {
			emailArray[i] = guest.getGuestEmailID();
			i++;
		}
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setTo(emailArray);
		model.addAttribute("simpleMailMessage", simpleMailMessage);
		model.addAttribute("title", "Mail All members");
		return "multiMail";
	}

}
