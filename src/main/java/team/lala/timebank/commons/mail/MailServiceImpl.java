package team.lala.timebank.commons.mail;





import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Component;

import team.lala.timebank.entity.Member;

@Component
public class MailServiceImpl implements MailService {
    
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
    private JavaMailSenderImpl mailSender;

    @Value("${mail.fromMail.addr}")
    private String from;
	
	@Override
	public void sendSimpleMail(Member member) {
		SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(member.getEmail());
        message.setSubject("已註冊TimeBank帳戶");
        message.setText("Dear " + member.getName()
        				+ ", thank you for signing up. Your account is "
        				+ member.getAccount() + ".");

        try {
            mailSender.send(message);
            logger.info("email已發送。");
        } catch (Exception e) {
            logger.error("email發生異常！", e);
        }
	}

	@Override
	public void sendHtmlMail(Member member) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
	        //true表示需要創建一个multipart message
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);
	        helper.setFrom(from);
	        helper.setTo(member.getEmail());
	        helper.setSubject("已註冊TimeBank帳戶");
	        String content="<html>" +
	                "<body>" +
	                "    <h3>已註冊TimeBank帳戶!</h3>" +
	                "Dear " + member.getName() +
    				",<br/> thank you for signing up. Your account is " + member.getAccount() + ".<br>" +
    				"<a href='https://eeit104timebank.southeastasia.cloudapp.azure.com/?emailVerify=Y&account=" + member.getAccount() + "'>請按此驗證</a><br/><br/>" +
	                "</body>" +
	                "</html>";
	        helper.setText(content, true);

	        mailSender.send(message);
	        logger.info("html email已發送。");
	    } catch (MessagingException e) {
	        logger.error("html email發生異常！", e);
	    } catch (javax.mail.MessagingException e) {
	    	logger.error("html email發生異常！！", e);
	    	e.printStackTrace();
		}
	}
	
	@Override
	public void sendVerificationCodeMail(Member member) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			String imgPath = "https://i.screenshot.net/63om8uz";
	        //true表示需要創建一个multipart message
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);
	        helper.setFrom(from);
	        helper.setTo(member.getEmail());
	        helper.setSubject("TimeBank帳戶-忘記密碼，您的驗證連結");
	        String content="<html>" +
	                "<body>" +
	                "    <h3>TimeBank帳戶-忘記密碼，您的驗證連結</h3>" +
	                "Dear " + member.getName() +
    				",<br/> Your account is " + member.getAccount() + ".<br/>" +
	                "此驗證連結在五分鐘內有效，請在期限內登入。<br/>" +
    				"<a href='https://eeit104timebank.southeastasia.cloudapp.azure.com/commons/login-forget/password?account=" + 
	                member.getAccount() + "&verificationCode=" + member.getVerificationCode() +
	                "'>請由此進入</a><br/>" +
    				"請盡快修改密碼，謝謝您。<br/>" +
    				"<a href='https://eeit104timebank.southeastasia.cloudapp.azure.com/commons/login-forget/password?account=" + 
	                member.getAccount() + "&verificationCode=" + member.getVerificationCode() +
	                "'>" + "<img src=\'" + imgPath + "\' ></a><br/>" +
	                "</body>" +
	                "</html>";
	        helper.setText(content, true);

	        mailSender.send(message);
	        logger.info("NewPassword email已發送。");
	    } catch (MessagingException e) {
	        logger.error("NewPassword email發生異常！", e);
	    } catch (javax.mail.MessagingException e) {
	    	logger.error("NewPassword email發生異常！！", e);
	    	e.printStackTrace();
		}
	}
	
	@Override
	public void sendInlineResourceMail(Member member) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			String imgPath = "https://i.screenshot.net/63om8uz";
	        //true表示需要創建一个multipart message
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);
	        helper.setFrom(from);
	        helper.setTo(member.getEmail());
	        helper.setSubject("已註冊TimeBank帳戶");
	        String content="<html>" +
			                "<body>" +
			                "    <h3>已註冊TimeBank帳戶!</h3>" +
			                "Dear " + member.getName() +
		    				",<br/> thank you for signing up. Your account is " + member.getAccount() + ".<br>" +
		    				"<a href='https://eeit104timebank.southeastasia.cloudapp.azure.com/login?emailVerify=Y&account=" + member.getAccount() + "'>請按此驗證</a><br/><br/>" +
		    				"<a href='https://eeit104timebank.southeastasia.cloudapp.azure.com/login?emailVerify=Y&account=" + member.getAccount() + "'>" + "<img src=\'" + imgPath + "\' ></a><br/>" + 
			                "</body>" +
			                "</html>";
	        helper.setText(content, true);

	        mailSender.send(message);
	        logger.info("有照片的email已發送。");
	    } catch (MessagingException e) {
	        logger.error("有照片的email發生異常！", e);
	    } catch (javax.mail.MessagingException e) {
	    	logger.error("有照片的email發生異常！！", e);
			e.printStackTrace();
		}
		
	}

}
