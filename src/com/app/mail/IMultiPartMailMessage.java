package com.app.mail;

import javax.mail.Multipart;

public interface IMultiPartMailMessage {

	/**
	 * @return the multipartMessage
	 */
	public abstract Multipart getMultipartMessage();

	/**
	 * @param multipartMessage
	 *            the multipartMessage to set
	 */
	public abstract void setMultipartMessage(Multipart multipartMessage);

}