package com.me.finalproject.converter;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.me.finalproject.dao.AdminDAO;
import com.me.finalproject.dao.MemberDAO;
import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.MemberTable;

@Component
public class StringToMemberTable extends PropertyEditorSupport {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public void setAsText(String email) {
        MemberTable c = this.memberDAO.getMemberByEmail(email);
        this.setValue(c);
    }
}