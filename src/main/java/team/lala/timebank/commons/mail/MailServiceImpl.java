package team.lala.timebank.commons.mail;





import java.io.File;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Component;

import team.lala.timebank.entity.Member;

@Component
public class MailServiceImpl implements MailService {
    
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
    private JavaMailSender mailSender;

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
    				"<a href='http://localhost:8080/?emailVerify=Y&account=" + member.getAccount() + "'>請按此驗證</a><br/><br/>" +
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
	public void sendInlineResourceMail(Member member) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			String imgPath = "C:\\Users\\ancho\\git\\iii-ee104\\src\\main\\resources\\static\\img";
	        //true表示需要创建一个multipart message
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);
	        helper.setFrom(from);
	        helper.setTo(member.getEmail());
	        helper.setSubject("已註冊TimeBank帳戶");
	        String rscId = member.getAccount();
//	        String content="<html><body>有圖片的mail：<img src=\'cid:" + rscId + "\' ></body></html>";
	        String content="<html>" +
			                "<body>" +
			                "    <h3>TimeBank:</h3>" +
			                "Dear " + member.getName() +
		    				", thank you for signing up. Your account is "+ member.getAccount() + "." +
		    				"<img src=\'cid:" + rscId + "\' >" +
			                "</body>" +
			                "</html>";
	        helper.setText(content, true);
	        FileSystemResource res = new FileSystemResource(new File(imgPath));
	        helper.addInline(rscId, res);

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