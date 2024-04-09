package com.tech.ibara.my.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("amine1225@gmail.com","jnyn fqfl dgwm aftb");
		
	}
}
