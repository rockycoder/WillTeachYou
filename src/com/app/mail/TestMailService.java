package com.app.mail;

public class TestMailService implements Runnable {



	public static void testSimpleMessage() {

		IMailMessage mail = new MailMessageBuilder().buildSimpleMailMessage(
				"Mailing Service Test", "mohnishmb@gmail.com",
				"Yo!! Testing the mail service :P");
		MailService mailService = new MailService();
		mailService.sendMail(mail);
	}

	public static void testMultiPartMessage() {
		IMailMessage mail = new MailMessageBuilder()
				.buildMultiPartMailMessage(
						"Multi Part - Mailing Service Test",
						"mohnishmb@gmail.com",
						"<H1>Hello</H1><img src=\"cid:image\" style=\" height:500px ; width:500px;\" >",
						"/home/mohnish/fun/trykaro/workspace/testbed/src/email.jpg",
						null, null);
		MailService mailService = new MailService();
		mailService.sendMail(mail);
	}

	@Override
	public void run() {
	    System.out.println("hello");
	    
	}
	
	public void testing(String s)
	{
	    System.out.println("hello ji " + s);
	}
	
	
	
	
	public static void main(String[] args) {
	    
	    
	    TestMailService test=new TestMailService();
	    
	    Thread thd=new Thread(test);
	    thd.start();
	    test.testing("hhhhhhhh");
	    
	    
	    
	}
}
