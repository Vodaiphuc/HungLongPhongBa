package com.example.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.example.dto.MailInfo;
import com.example.helper.MailTypeEnum;
import com.example.service.MailerService;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;

@Service
public class MailerServiceImpl implements MailerService {

	@Autowired
	JavaMailSender sender;

	List<MailInfo> list = new ArrayList<>();

	@Override
	public void send(MailInfo mail) throws MessagingException {
		// Tạo message
		MimeMessage message = sender.createMimeMessage();
		// Sử dụng Helper để thiết lập các thông tin cần thiết cho message
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		try {
			String emailContent = getEmailContent(mail.getBody(), mail.getMailType());
			helper.setText(emailContent, true);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		helper.setReplyTo(mail.getFrom());
		String[] cc = mail.getCc();
		if (cc != null && cc.length > 0) {
			helper.setCc(cc);
		}
		String[] bcc = mail.getBcc();
		if (bcc != null && bcc.length > 0) {
			helper.setBcc(bcc);
		}
		String[] attachments = mail.getAttachments();
		if (attachments != null && attachments.length > 0) {
			for (String path : attachments) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}
		// Gửi message đến SMTP server
		sender.send(message);
	}

	@Autowired
	Configuration configuration;

	String getEmailContent(String body, String mailType) throws IOException, TemplateException {
		StringWriter stringWriter = new StringWriter();
		Map<String, Object> model = new HashMap<>();
		String template = null;
		if (mailType.equals(MailTypeEnum.LOGIN.type)) {
			template = "login-account.ftlh";
		}else if (mailType.equals(MailTypeEnum.FORGOT.type)) {
			template = "forgot-password-account.ftlh";
			model.put("code", body);
		}
		configuration.getTemplate(template).process(model, stringWriter);
		return stringWriter.getBuffer().toString();
	}

	@Override
	public void send(String to, String subject, String body, String mailType) throws MessagingException {
		this.send(new MailInfo(to, subject, body, mailType));
	}

	@Override
	public void queue(MailInfo mail) {
		list.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body, String mailType) {
		queue(new MailInfo(to, subject, body, mailType));
	}

	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfo mail = list.remove(0);
			try {
				this.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}