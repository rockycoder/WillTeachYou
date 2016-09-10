/*package com.app.mail;

import com.sendgrid.SendGrid;
import com.sendgrid.SendGridException;

public class SendGridMailing {
	public static void main(String[] args) {
		SendGrid sendgrid = new SendGrid(
				"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");

		SendGrid.Email email = new SendGrid.Email();
		email.addTo("purohit.brijmohan@gmail.com");
		email.setFrom("brij@trykaro.in");
		email.setSubject("Hello World");
		email.setText("My first email with SendGrid Java!");

		try {
			SendGrid.Response response = sendgrid.send(email);
			System.out.println(response.getMessage());
		} catch (SendGridException e) {
			System.err.println(e);
		}
	}
}*/