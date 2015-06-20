package com.me.finalproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.finalproject.dao.AdminDAO;
import com.me.finalproject.dao.LoginDAO;
import com.me.finalproject.pojo.ExecutiveComittee;
import com.me.finalproject.pojo.MemberTable;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	AdminDAO adminDAO;

	@Autowired
	LoginDAO loginDAO;

	@Autowired
	@Qualifier("memberValidator")
	private Validator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);

	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		MemberTable memberTable = new MemberTable();

		model.addAttribute("memberTable", memberTable);

		return "home";
	}

	@RequestMapping(value = "/timer")
	public String timer(HttpServletResponse response, HttpServletRequest request) {
		return "timer";
	}

	@RequestMapping(value = "/login")
	public String loginUser(@Valid MemberTable memberTable,BindingResult bindingResult, HttpServletResponse response,
			HttpServletRequest request,
			Model model) {
		if (bindingResult.hasErrors()) {
            return home(model);
        }
		try {
			MemberTable member = loginDAO.getMember(memberTable.getEmail(),
					memberTable.getPassword());

			if (member == null) {
				
				return home(model);
			} else {

				for (ExecutiveComittee comittee : member.getExecutiveComittee()) {
					System.out.println(comittee.getComitteeRoles()
							.getExecutiveComitteeRole());
				}

				List<ExecutiveComittee> roleList = loginDAO.getRoles(member
						.getCustomerId());
				HttpSession session = request.getSession();
				session.setAttribute("memberTable", member);
				return "userhome";

			}
		} catch (Exception ex) {

			System.out.println(ex);
			model.addAttribute("ex", ex);

		}
		return "errorpage";
	}

	@RequestMapping(value = "userHome")
	public String userHome() {
		return "userhome";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();

		return home(model);

	}

}
