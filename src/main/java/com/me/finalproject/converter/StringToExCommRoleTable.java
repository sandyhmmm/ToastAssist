package com.me.finalproject.converter;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.me.finalproject.dao.AdminDAO;
import com.me.finalproject.dao.MemberDAO;
import com.me.finalproject.dao.PresidentDAO;
import com.me.finalproject.pojo.Club;
import com.me.finalproject.pojo.ExecutiveComitteeRoles;
import com.me.finalproject.pojo.MemberTable;

@Component
public class StringToExCommRoleTable extends PropertyEditorSupport {

	@Autowired
	PresidentDAO presidentDAO;
	
	@Override
	public void setAsText(String exCommRoleID) {
        ExecutiveComitteeRoles c = this.presidentDAO.getExCommRoleForID(Integer.parseInt(exCommRoleID));
        this.setValue(c);
    }
}