package com.app.Utils;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.Async;
 
public class AutoEmail
{
	
	@Autowired
	private JavaMailSender mailSender;
	 

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public AutoEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Async
	
	public void sendMail(String from, String to, String subject, String msg) {
 
		SimpleMailMessage message = new SimpleMailMessage();
 
		message.setTo(to);
		
		message.setFrom(from);
		message.setSubject(subject);
		message.setText(msg);
		mailSender.send(message);	
	}
}