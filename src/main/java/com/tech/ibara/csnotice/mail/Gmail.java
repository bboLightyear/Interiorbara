package com.tech.ibara.csnotice.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	private String from;
	
	public Gmail(String from) {
		this.from=from;
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(from,"evgc jbsn njym ecwb");
		
	}
}
