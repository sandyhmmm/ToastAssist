package com.me.finalproject.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.finalproject.pojo.MemberTable;

public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return MemberTable.class.equals(arg0);

	}

	@Override
	public void validate(Object arg0, Errors errors) {
		MemberTable memberTable = (MemberTable)arg0;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Please enter your email");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Please enter your password");
		
	}

}
