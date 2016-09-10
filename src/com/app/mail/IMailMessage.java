package com.app.mail;

public interface IMailMessage {
	
	/**
	 * @return the subject
	 */
	public String getSubject();

	/**
	 * @param subject
	 *            the subject to set
	 */
	public void setSubject(String subject);

	/**
	 * @return the recipient
	 */
	public String getRecipient();

	/**
	 * @param receipent
	 *            the recipient to set
	 */
	public void setRecipient(String recipient);
}
