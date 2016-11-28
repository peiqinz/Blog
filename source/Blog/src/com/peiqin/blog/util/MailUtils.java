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
		 * 1. 获得一个 Session 对象
		 * 2. 创建一个代表邮件的对象 Message
		 * 3. 发送邮件 Transport
		 */
		Properties properties = new Properties();
		properties.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(properties,new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("service@shop.com", "111");
			}
		});
		// 2.创建邮件对象
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("service@shop.com"));
		//设置发件人
		message.addRecipient(RecipientType.TO, new InternetAddress(to));
		//抄送 CC 密送BCC
		//设置标题
		message.setSubject("来自Blog官方激活邮件");
		message.setContent("<h1>购物天堂传智商城官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://localhost:8080/shop-web/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
		Transport.send(message);
	}
	
	public static void main(String[] args) throws AddressException, MessagingException{
		sendMail("aaa@shop.com", "11111111111111");
	}
}
