package com.app.mail;

public interface ISimpleMailMessage {

	/**
	 * @return the content
	 */
	public abstract String getContent();

	/**
	 * @param content
	 *            the content to set
	 */
	public abstract void setContent(String content);

}