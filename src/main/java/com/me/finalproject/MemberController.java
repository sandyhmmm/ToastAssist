package com.me.finalproject;

import java.util.ArrayList;
import java.util.Random;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.finalproject.converter.StringToMeeting;
import com.me.finalproject.converter.StringToMemberTable;
import com.me.finalproject.dao.MemberDAO;
import com.me.finalproject.pojo.AhCounterReport;
import com.me.finalproject.pojo.BalanceSheet;
import com.me.finalproject.pojo.CheckIn;
import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.EvaluatorReport;
import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.ExecutiveComitteeRoles;
import com.me.finalproject.pojo.GeneralEvaluatorReport;
import com.me.finalproject.pojo.Guest;
import com.me.finalproject.pojo.Meeting;
import com.me.finalproject.pojo.MemberTable;
import com.me.finalproject.pojo.RoleRequest;
import com.me.finalproject.pojo.TimerReport;


@Controller
public class MemberController {

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	StringToMeeting stringToMeeting;
	
	@Autowired
	StringToMemberTable stringToMemberTable;
	

	@RequestMapping(value = "searchGuestByEmail")
	public @ResponseBody String searchGuestByEmail(@RequestParam String email,String meetingID,
			HttpServletRequest request) {

		System.out.println("Ajax call");
		System.out.println("email: " + email);

		try {

			HttpSession session = request.getSession();
			MemberTable memberTable = (MemberTable) session
					.getAttribute("memberTable");
			Guest guest = memberDAO.getGuestByEmailID(email,
					memberTable.getClub());
			
			
			if (guest != null) {
				CheckIn checkIn = new CheckIn();
				checkIn.setClub(memberTable.getClub());
				checkIn.setGuest(guest);
				checkIn.setMeeting(memberDAO.getMeetingByID(Integer.parseInt(meetingID)));
				memberDAO.checkin(checkIn);
				String retString = "Welcome back "+guest.getGuestName()+" !!";
				return retString;
			} else {
				String retString = "Please enter your name :<input id='guestName' /><button type='button' onClick='doAjaxCheckIn()'>Continue</button> ";
				return retString;
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		return "something went wrong!!";
	}
	@RequestMapping(value = "saveGuest")
	public @ResponseBody String saveGuest(String guestName, String guestEmailID,String meetingID, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		Guest guest = new Guest();
		guest.setClub(memberTable.getClub());
		guest.setGuestName(guestName);
		guest.setGuestEmailID(guestEmailID);
		
		CheckIn checkIn = new CheckIn();
		checkIn.setClub(memberTable.getClub());
		checkIn.setMeeting(memberDAO.getMeetingByID(Integer.parseInt(meetingID)));
		
		memberDAO.saveGuest(guest,checkIn);
		return "Welcome "+guestName+"!!";
	}
	

	@RequestMapping(value = "ahCounterPage")
	public String ahCounterPage(Model model) {
		AhCounterReport ahCounterReport = new AhCounterReport();
		model.addAttribute("ahCounterReport", ahCounterReport);
		return "ahCounterReport";
	}

	@RequestMapping(value = "ahCounterReport")
	public String ahCounterReport(Model model, AhCounterReport ahCounterReport) {
		System.out.println(ahCounterReport.getAh());
		return "successPage";
	}

	@RequestMapping(value = "ahCounterReportAjax")
	public @ResponseBody String ahCounterReportAjax(String rolePlayer, String role, int ah, int um,
			String repeatedWords, int like, int youKnow, int andButOrSo,
			String goodUsage, int wODUsage, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("meeting");
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		System.out.println(rolePlayer);
		AhCounterReport ahCounterReport = new AhCounterReport();
		ahCounterReport.setAh(ah);
		ahCounterReport.setUm(um);
		ahCounterReport.setRepeatWords(repeatedWords);
		ahCounterReport.setLike(like);
		ahCounterReport.setYouKnow(youKnow);
		ahCounterReport.setAndButOrSo(andButOrSo);
		ahCounterReport.setGoodUsage(goodUsage);
		ahCounterReport.setwODUsage(wODUsage);
		ahCounterReport.setRole(role);
		ahCounterReport.setRolePlayer(rolePlayer);
		ahCounterReport.setMeeting(meeting);
		ahCounterReport.setAhCounter(memberTable);
		memberDAO.saveAhCounterReport(ahCounterReport);
		return "success";
	}

	@RequestMapping(value = "performRoles")
	public String performRoles(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		
		ArrayList<Meeting> meetings = memberDAO.getMeetingByStatus("checkin", memberTable.getClub());
		model.addAttribute("meeting",new Meeting());
		model.addAttribute("meetings",meetings);
		
		return "performRoles";
	}
	@RequestMapping(value = "submitMeetingRole")
	public String submitMeetingRole(HttpServletRequest request, Model model, Meeting meeting)
	{
		//int meetingID = Integer.parseInt(request.getParameter("meetingID"));
		meeting = memberDAO.getMeetingByID(meeting.getMeetingID());
		HttpSession session = request.getSession();
		session.setAttribute("meeting", meeting);
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		ArrayList<CheckIn> checkIns = memberDAO.checkedInList(meeting);
		
		ArrayList<String> checkInArray = new ArrayList<String>();
		for(CheckIn checkIn:checkIns)
		{
			if(checkIn.getGuest() != null)
			{
				checkInArray.add(checkIn.getGuest().getGuestName());
			}
			if(checkIn.getMemberTable() != null)
			{
				checkInArray.add(checkIn.getMemberTable().getName());
			}
			
		}
	
		String role = request.getParameter("radioOption");
		if(role.equalsIgnoreCase("timerPage"))
		{
			model.addAttribute("checkInArray", checkInArray);
			return "timer";
		}
		if(role.equalsIgnoreCase("ahCounterPage"))
		{
			AhCounterReport ahCounterReport = new AhCounterReport();
			model.addAttribute("checkInArray",checkInArray);
			model.addAttribute("ahCounterReport", ahCounterReport);
			return "ahCounterReport";
		}
		if(role.equalsIgnoreCase("evaluatorReport"))
		{
			EvaluatorReport evaluatorReport = new EvaluatorReport();
			evaluatorReport.setEvaluator(memberTable);
			evaluatorReport.setMeetingID(meeting);
			model.addAttribute("evaluatorReport", evaluatorReport);
			model.addAttribute("checkInArray",checkInArray);
			return "evaluatorReport";
		}
		if(role.equalsIgnoreCase("generalEvaluationReport"))
		{
			GeneralEvaluatorReport geReport = new GeneralEvaluatorReport();
			model.addAttribute("geReport", geReport);
			
			return "generalEvaluatorReport";
		}
		model.addAttribute("ex","Error generating reports");
		return "errorPage";
	}
	@RequestMapping(value = "searchCheckedInName")
	public String[] searchCheckedInName(HttpServletRequest request, String searchParameter)
	{
		System.out.println("searching");
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("meeting");
		ArrayList<CheckIn> checkIns = memberDAO.checkedInList(meeting);
		String[] returnArray = new String[checkIns.size()];
		int i = 0;
		for(CheckIn checkIn:checkIns)
		{
			if(checkIn.getGuest() != null && checkIn.getGuest().getGuestName().toLowerCase().contains(searchParameter.toLowerCase()))
			{
				
				returnArray[i] = checkIn.getGuest().getGuestName();
				i++;
			}
			if(checkIn.getMemberTable() != null && checkIn.getMemberTable().getName().toLowerCase().contains(searchParameter.toLowerCase()))
			{
				returnArray[i] = checkIn.getMemberTable().getName();
				i++;
			}
		}
		return returnArray;
	}
	
	@RequestMapping(value = "timerReport")
	public String ahCounterReport(String role, String rolePlayer, String time, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("meeting");
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");

		TimerReport timerReport = new TimerReport();
		timerReport.setMeeting(meeting);
		timerReport.setRole(role);
		timerReport.setRolePlayer(rolePlayer);
		timerReport.setTimeTaken(time);
		timerReport.setTimer(memberTable);
		memberDAO.saveTimerReport(timerReport);
		return "successPage";
	}
	@RequestMapping(value = "checkInMembers")
	public String checkInMembers(String customerID,String meetingID ) {
		
		CheckIn checkIn = new CheckIn();
		checkIn.setMeeting(memberDAO.getMeetingByID(Integer.parseInt(meetingID)));
		memberDAO.checkInMember(Integer.parseInt(customerID), checkIn);
		
		return "successPage";
	}
	@RequestMapping(value = "requestRole")
	public String requestRole(@ModelAttribute(value = "roleRequest")RoleRequest roleRequest,Model model)
	{
		roleRequest.setStatus("pending");
		memberDAO.saveRoleRequest(roleRequest);
		model.addAttribute("message", "The role request is submitted");
		return "successPage";
	}
	@RequestMapping(value = "availableMeetings")
	public String availableMeetings(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		MemberTable myDeatils = (MemberTable)session.getAttribute("memberTable");
		ArrayList<Meeting> meetings = memberDAO.getMeetingByStatus("open", myDeatils.getClub());
		model.addAttribute("meetings",meetings);
		return "availableMeetings";
	}
	@RequestMapping(value = "selectMeeting")
	public String selectMeeting(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		MemberTable myDeatils = (MemberTable)session.getAttribute("memberTable");
		int meetingID = Integer.parseInt(request.getParameter("selMeeting"));
		Meeting meeting = memberDAO.getMeetingByID(meetingID);
		RoleRequest roleRequest = new RoleRequest();
		roleRequest.setMeetingID(meeting);
		roleRequest.setRequestedBy(myDeatils);
		roleRequest.setRequestedTo(meeting.getCreatedBy());
		roleRequest.setStatus("pending");
		model.addAttribute("roleRequest", roleRequest);
		model.addAttribute("meetingID", meetingID);
		model.addAttribute("requestedByEmail", myDeatils.getEmail());
		model.addAttribute("requestedToEmail", meeting.getCreatedBy().getEmail());
		return "availableRoles";
	}
	@RequestMapping(value = "getExpensesForMember")
	public String getExpensesForClub(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		ArrayList<BalanceSheet> balanceList = memberDAO.getBalanceForMember(memberTable);
		ArrayList<MemberTable> members = new ArrayList<MemberTable>();
		model.addAttribute("balanceSheet",new BalanceSheet());
		model.addAttribute("members",members);
		model.addAttribute("balanceList", balanceList);
		model.addAttribute("canAdd", false);
		return "trackExpenses";
	}
	@RequestMapping(value = "passwordReset")
	public String passwordReset(HttpServletRequest request, Model view) throws Exception {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		view.addAttribute("memberTable", memberTable);
		return "passwordReset";
	}
	@RequestMapping(value = "resetPassword")
	public String resetPassword(Model model, MemberTable memberTable,
			@RequestParam("oldPassword") String oPassword,
			@RequestParam("newPass") String newPass, HttpServletRequest request)
			throws Exception {
		String oldPassword = oPassword;
		String newPassword = newPass;
		HttpSession session = request.getSession();
		MemberTable member = (MemberTable) session.getAttribute("memberTable");
		if (!member.getPassword().equals(oldPassword)) {
			JOptionPane.showMessageDialog(null, "Wrong old password!!");
			return passwordReset(request, model);
		}
		if (!memberTable.getPassword().equals(newPassword)) {
			JOptionPane.showMessageDialog(null,
					"New passwords should match exactly !!");
			return passwordReset(request, model);
		}
		member.setPassword(memberTable.getPassword());
		MemberTable u = memberDAO.changePassword(member);
		session.setAttribute("memberTable",u);
		model.addAttribute("message", "The password was reset");
		return "successPage";

	}
	@RequestMapping(value = "getExcommMembers")
	public String getExcommMembers(HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		ArrayList<ExecutiveComittee> exComm = memberDAO.getExCommForClub(memberTable.getClub());
		model.addAttribute("members",new ArrayList<MemberTable>());
		model.addAttribute("edit",false);
		model.addAttribute("exComm",exComm);
		model.addAttribute("newExcomm",new ExecutiveComittee());
		model.addAttribute("roles", new ArrayList<ExecutiveComitteeRoles>());
		return "viewExcomm";
	}
	@RequestMapping(value = "myDetails")
	public String myDetails(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		model.addAttribute("memberTable",memberTable);
		return "myDetails";
	}
	@RequestMapping(value = "submitEvaluation")
	public String submitEvaluation(HttpServletRequest request, EvaluatorReport evaluatorReport,Model model)
	{
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("meeting");
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		evaluatorReport.setMeetingID(meeting);
		evaluatorReport.setEvaluator(memberTable);
		memberDAO.saveEvaluatorReport(evaluatorReport);
		session.removeAttribute("meeting");
		
		model.addAttribute("message", "Evaluation Submitted");
		return "SuccessPage";
	}
	@RequestMapping(value = "timerGrid")
	public String timerGrid(HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("meeting");
		ArrayList<TimerReport> timerReport = memberDAO.getTimerReportForMeeting(meeting);
		model.addAttribute("timerReport",timerReport);
		session.removeAttribute("meeting");
		return "timerGrid";

	}
	@RequestMapping(value = "ahCounterGrid")
	public String ahCounterGrid(HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("meeting");
		ArrayList<AhCounterReport> ahCounterReports = memberDAO.getAhCounterReportForMeeting(meeting);
		model.addAttribute("ahCounterReports",ahCounterReports);
		session.removeAttribute("meeting");
		return "ahCounterGrid";

	}
	@RequestMapping(value = "selectMeetingReport")
	public String submitMeetingReport(HttpServletRequest request, Model model, Meeting meeting)
	{
		//int meetingID = Integer.parseInt(request.getParameter("meetingID"));
		meeting = memberDAO.getMeetingByID(meeting.getMeetingID());
		HttpSession session = request.getSession();
		session.setAttribute("meeting", meeting);
		
		String role = request.getParameter("radioOption");
		if(role.equalsIgnoreCase("timerPage"))
		{
			ArrayList<TimerReport> timerReport = memberDAO.getTimerReportForMeeting(meeting);
			model.addAttribute("timerReport",timerReport);
			session.removeAttribute("meeting");
			return "timerGrid";
			
		}
		if(role.equalsIgnoreCase("ahCounterPage"))
		{
			ArrayList<AhCounterReport> ahCounterReports = memberDAO.getAhCounterReportForMeeting(meeting);
			model.addAttribute("ahCounterReports",ahCounterReports);
			session.removeAttribute("meeting");
			return "ahCounterGrid";
		}
		if(role.equalsIgnoreCase("evaluatorReport"))
		{
			ArrayList<EvaluatorReport> evaluations = memberDAO.getEvaluatorReportForMeeting(meeting);
			model.addAttribute("evaluations",evaluations);
			session.removeAttribute("meeting");
			return "viewEvaluations";
		}
		model.addAttribute("ex", "Error with the reports");
		return "errorPage";
	}
	@RequestMapping(value = "viewReports")
	public String viewReports(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable) session
				.getAttribute("memberTable");
		
		ArrayList<Meeting> meetings = memberDAO.getMeetingByStatus("complete", memberTable.getClub());
		ArrayList<Meeting> checkinMeetings = memberDAO.getMeetingByStatus("checkin", memberTable.getClub());
		meetings.addAll(checkinMeetings);
		model.addAttribute("meeting",new Meeting());
		model.addAttribute("meetings",meetings);
		
		return "viewReports";
	}
	@RequestMapping(value = "submitGEReport")
	public String submitGEReport(HttpServletRequest request, GeneralEvaluatorReport geReport, Model model)
	{
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("meeting");
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		geReport.setMeeting(meeting);;
		geReport.setGeneralEvaluator(memberTable);
		memberDAO.saveGeneralEvaluatorReport(geReport);
		session.removeAttribute("meeting");
		model.addAttribute("message","GE report submitted");
		return "SuccessPage";
	}
	@RequestMapping(value = "checkMeInPage")
	public String checkMeInPage(HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		ArrayList<Meeting> meetingList = memberDAO.getMeetingByStatus("checkin", memberTable.getClub());
		model.addAttribute("meetingList",meetingList);
		model.addAttribute("checkIn",new CheckIn());
		return "checkMeIn";
	}
	@RequestMapping(value = "checkMeIn")
	public String checkMeIn(HttpServletRequest request, CheckIn checkIn,Model model ) {
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		checkIn.setMemberTable(memberTable);
		checkIn.setClub(memberTable.getClub());
		memberDAO.saveCheckIn(checkIn);
		model.addAttribute("message", "Successfully checkedin");
		return "successPage";
	}
	@RequestMapping(value = "pickTTSpeakerPage")
	public String pickTTSpeakerPage(HttpServletRequest request,CheckIn checkIn, Model model)
	{	
		HttpSession session = request.getSession();
		Meeting meeting = checkIn.getMeeting();
		session.setAttribute("currentMeeting", meeting);
		ArrayList<String> speakers = new ArrayList<String>();
		session.setAttribute("speakers", speakers);
		return "pickTTSpeaker";
		
	}
	@RequestMapping(value = "nextTTSpeaker")
	public @ResponseBody String nextTTSpeaker(HttpServletRequest request)
	{	
		String speaker;
		 Random randomGenerator = new Random();
		HttpSession session = request.getSession();
		Meeting meeting = (Meeting)session.getAttribute("currentMeeting");
		@SuppressWarnings("unchecked")
		ArrayList<String> speakers = (ArrayList<String>)session.getAttribute("speakers");
		ArrayList<CheckIn> checkIns = memberDAO.checkedInList(meeting);
		
		ArrayList<String> checkInArray = new ArrayList<String>();
		for(CheckIn check:checkIns)
		{
			if(check.getGuest() != null)
			{
				checkInArray.add(check.getGuest().getGuestName());
			}
			if(check.getMemberTable() != null)
			{
				checkInArray.add(check.getMemberTable().getName());
			}
			
		}	
		checkInArray.removeAll(speakers);
		
		
		
		if(checkInArray.size() == 0)
		{
			speaker = "No more checked-in speakers";
		}
		else
		{
			int index = randomGenerator.nextInt(checkInArray.size());
			speaker = checkInArray.get(randomGenerator.nextInt(checkInArray.size()));
			speakers.add(speaker);
			session.setAttribute("speakers", speakers);
		}
		return speaker;
		
		
	}
	@RequestMapping(value = "meetingForTTSpeaker")
	public String meetingForTTSpeaker(HttpServletRequest request,Model model)
	{
		HttpSession session = request.getSession();
		MemberTable memberTable = (MemberTable)session.getAttribute("memberTable");
		ArrayList<Meeting> meetingList = memberDAO.getMeetingByStatus("checkin", memberTable.getClub());
		model.addAttribute("meetingList",meetingList);
		model.addAttribute("checkIn",new CheckIn());
		return "meetingForTTSpeaker";
	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Meeting.class, this.stringToMeeting);
        binder.registerCustomEditor(MemberTable.class, this.stringToMemberTable);
    }
}
