package com.app.mail;

import javax.mail.Multipart;

/**
 * This represents a mutli part mail message. Use this to create a mail message
 * which contains images, html or attachment. Use {@link com.app.mail.MailMessageBuilder} to
 * create the message.
 *
 */
public class MultiPartMailMessage extends AbstractMailMessage implements
		IMultiPartMailMessage {

	private Multipart multipartMessage;

	public MultiPartMailMessage() {

	}

	public MultiPartMailMessage(String subject, String recipient,
			Multipart multipartMessage) {
		super(subject, recipient);
		this.multipartMessage = multipartMessage;
	}

	/**
	 * @return the multipartMessage
	 */
	@Override
	public Multipart getMultipartMessage() {
		return multipartMessage;
	}

	/**
	 * @param multipartMessage
	 *            the multipartMessage to set
	 */
	@Override
	public void setMultipartMessage(Multipart multipartMessage) {
		this.multipartMessage = multipartMessage;
	}

}
