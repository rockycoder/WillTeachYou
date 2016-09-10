package com.app.mail;

public abstract class AbstractMailMessage implements IMailMessage {

	private String subject;

	private String recipient;

	/**
	 * Default constructor
	 */
	public AbstractMailMessage() {
	}

	/**
	 * Parameterized constructor
	 * 
	 * @param subject
	 * @param recipient
	 */
	public AbstractMailMessage(String subject, String recipient) {
		super();
		this.subject = subject;
		this.recipient = recipient;
	}

	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject
	 *            the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the recipient
	 */
	public String getRecipient() {
		return recipient;
	}

	/**
	 * @param receipent
	 *            the recipient to set
	 */
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
}
