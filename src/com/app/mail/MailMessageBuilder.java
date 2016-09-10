package com.app.mail;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;

import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.ResourceLoader;

/**
 * This provides utility methods to build a mail message.
 *
 */
public class MailMessageBuilder implements ResourceLoaderAware {

	/**
	 * This builds a simple mail message.
	 * 
	 * @param subject
	 * @param recipient
	 * @param content
	 * @return
	 */
	public IMailMessage buildSimpleMailMessage(String subject,
			String recipient, String content) {
		return new SimpleMailMessage(subject, content, recipient);
	}

	/**
	 * This build a mutli part mail message. Use this to create a message with
	 * image, html or pdf attachment.
	 * 
	 * @param subject
	 * @param recipient
	 * @param htmlContent
	 * @param imageFileName
	 * @param attachmentName
	 * @param attachmentData
	 * @return
	 */
	@SuppressWarnings("resource")
	public IMailMessage buildMultiPartMailMessage(String subject,
			String recipient, String htmlContent, String imageFileName,
			String attachmentName, byte[] attachmentData) {
		IMailMessage iMailMessage = null;
		Properties sessionProperties = System.getProperties();
		try {
			Multipart multipartMessage = new MimeMultipart();
			MimeBodyPart mimeBodyPart = null;
			// set html part
			if (htmlContent != null && !htmlContent.isEmpty()) {
				mimeBodyPart = new MimeBodyPart();
				mimeBodyPart.setContent(htmlContent, "text/html");
				multipartMessage.addBodyPart(mimeBodyPart);
			}

			// add image file
			if (imageFileName != null && !imageFileName.isEmpty()) {
				mimeBodyPart = new MimeBodyPart();
				File resFile = this.resourceLoader.getResource(imageFileName)
						.getFile();
				DataSource fds = new FileDataSource(resFile);
				mimeBodyPart.setDataHandler(new DataHandler(fds));
				mimeBodyPart.setHeader("Content-ID", "<image>");
				multipartMessage.addBodyPart(mimeBodyPart);

			}

			// set attachment
			if (attachmentName != null && !attachmentName.isEmpty()) {
				mimeBodyPart = new MimeBodyPart();
				InputStream attachmentDataStream = new ByteArrayInputStream(
						attachmentData);
				mimeBodyPart.setFileName(attachmentName);
				mimeBodyPart
						.setContent(attachmentDataStream, "application/pdf");
				multipartMessage.addBodyPart(mimeBodyPart);
			}
			iMailMessage = new MultiPartMailMessage(subject, recipient,
					multipartMessage);

		} catch (MessagingException | IOException e) {
			e.printStackTrace();
		}

		return iMailMessage;
	}

	private ResourceLoader resourceLoader;

	public void setResourceLoader(ResourceLoader resourceLoader) {
		this.resourceLoader = resourceLoader;
	}

}
