package com.me.finalproject.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MailHelper {
	
	@Autowired
	MailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender) {
	     this.mailSender = mailSender;
	   }

	
	public void sendMail(String to, String subject, String body)
    {
		
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
    }
	
	public void sendMailToMany(String[] to, String subject, String body)
    {
		
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
    }

}
