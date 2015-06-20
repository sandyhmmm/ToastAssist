package com.me.finalproject.converter;

import java.beans.PropertyEditorSupport;

import javax.persistence.Convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.me.finalproject.dao.AdminDAO;
import com.me.finalproject.pojo.Club;


@Component
public class StringToClub extends PropertyEditorSupport {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public void setAsText(String clubName) {
        Club c = this.adminDAO.getClubForClubName(Integer.parseInt(clubName));
        this.setValue(c);
    }

	
}
