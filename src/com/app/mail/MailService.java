package com.app.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Service to send message across to customer's, etc.
 *
 */
public class MailService implements Runnable {

	private Properties props;

	// private final static String EMAIL_PROPERTIES = "email.properties";

	private final static String FROM_ADDRESS = "FromAddress";
	private final static String PASSWORD = "FromPassword";

	public MailService() {

	}

	/**
	 * Send SSL based mail based on the details given in @SimpleMailMessage
	 * object.
	 * 
	 * @param mail
	 * @return boolean
	 */

	/**
	 * 
	 * @param mail
	 * @return
	 */
	public boolean sendMail(IMailMessage mail) {
		boolean isMailSentSuccessfully = false;
		// build Session
		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(props
								.getProperty(FROM_ADDRESS), props
								.getProperty(PASSWORD));
					}
				});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(props.getProperty(FROM_ADDRESS)));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(mail.getRecipient()));
			message.setSubject(mail.getSubject());
			if (SimpleMailMessage.class.isInstance(mail)) {
				ISimpleMailMessage iSimpleMailMessage = (ISimpleMailMessage) mail;
				message.setText(iSimpleMailMessage.getContent());
			} else if (MultiPartMailMessage.class.isInstance(mail)) {
				IMultiPartMailMessage iMultiPartMailMessage = (IMultiPartMailMessage) mail;
				message.setContent(iMultiPartMailMessage.getMultipartMessage());

			}

			Transport.send(message);

			System.out.println("Done");
			isMailSentSuccessfully = true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return isMailSentSuccessfully;

	}

	/**
	 * @return the props
	 */
	public Properties getProps() {
		return props;
	}

	/**
	 * @param props
	 *            the props to set
	 */
	public void setProps(Properties props) {
		this.props = props;
	}

	@Override
	public void run() {
	   	    
	}

}
