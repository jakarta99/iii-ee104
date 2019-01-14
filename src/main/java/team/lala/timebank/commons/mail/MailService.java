package team.lala.timebank.commons.mail;

import team.lala.timebank.entity.Member;

public interface MailService {
	void sendSimpleMail(Member member);
	void sendHtmlMail(Member member);
	void sendNewPasswordMail(Member member, String newPassword);	
	void sendInlineResourceMail(Member member);
}
