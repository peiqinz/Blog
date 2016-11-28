package com.peiqin.blog.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


public class MailUtils {

	public static void sendMail(String to,String code) throws AddressException, MessagingException{
		/**
		 * 1. ���һ�� Session ����
		 * 2. ����һ�������ʼ��Ķ��� Message
		 * 3. �����ʼ� Transport
		 */
		Properties properties = new Properties();
		properties.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(properties,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("service@shop.com", "111");
			}
		});
		// 2.�����ʼ�����
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("service@shop.com"));
		//���÷�����
		message.addRecipient(RecipientType.TO, new InternetAddress(to));
		//���� CC ����BCC
		//���ñ���
		message.setSubject("����Blog�ٷ������ʼ�");
		message.setContent("<h1>�������ô����̳ǹٷ������ʼ�!������������ɼ������!</h1><h3><a href='http://localhost:8080/shop-web/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
		Transport.send(message);
	}
	
	public static void main(String[] args) throws AddressException, MessagingException{
		sendMail("aaa@shop.com", "11111111111111");
	}
}
