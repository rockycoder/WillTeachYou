package com.app.mail;

public class SimpleMailMessage extends AbstractMailMessage implements ISimpleMailMessage {

	private String content;

	/**
	 * Default constructor
	 */
	public SimpleMailMessage() {
	}

	/**
	 * Parameterized constructor
	 * 
	 * @param subject
	 * @param content
	 * @param recipient
	 */
	public SimpleMailMessage(String subject, String content, String recipient) {
		super(subject, recipient);
		this.content = content;
	}

	/**
	 * @return the content
	 */
	@Override
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            the content to set
	 */
	@Override
	public void setContent(String content) {
		this.content = content;
	}

}
