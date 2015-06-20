package com.me.finalproject.converter;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.me.finalproject.dao.MemberDAO;
import com.me.finalproject.pojo.Meeting;
import com.me.finalproject.pojo.MemberTable;
@Component
public class StringToMeeting extends PropertyEditorSupport {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public void setAsText(String meetingID) {
        Meeting c = this.memberDAO.getMeetingByID(Integer.parseInt(meetingID));
        this.setValue(c);
    }

}
