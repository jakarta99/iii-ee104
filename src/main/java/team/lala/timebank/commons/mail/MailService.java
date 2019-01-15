package team.lala.timebank.commons.mail;

import team.lala.timebank.entity.Member;

public interface MailService {
	void sendSimpleMail(Member member);
	void sendHtmlMail(Member member);
	void sendVerificationCodeMail(Member member);	
	void sendInlineResourceMail(Member member);
}
