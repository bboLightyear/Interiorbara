package com.tech.ibara.csnotice.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("bokun0502@gmail.com","evgc jbsn njym ecwb");
		
	}
}
