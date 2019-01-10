package team.lala.timebank.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import team.lala.timebank.entity.Member;

@Component
public class SimpleVerificationEmail implements VerificationEmail {
	
//	private MailSender mailSender;
//	
//    private SimpleMailMessage templateMessage;
//    
//    public void setMailSender(MailSender mailSender) {
//        this.mailSender = mailSender;
//    }
//
//    public void setTemplateMessage(SimpleMailMessage templateMessage) {
//        this.templateMessage = templateMessage;
//    }
    
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
    private JavaMailSender mailSender;

    @Value("${mail.fromMail.addr}")
    private String from;
	
	@Override
	public void mail(Member member) {
//		// Do the business calculations...
//		
//        // Call the collaborators to persist the order...
//
//        // Create a thread safe "copy" of the template message and customize it
//        SimpleMailMessage msg = new SimpleMailMessage(this.templateMessage);
//        msg.setTo(member.getEmail());
//        msg.setText(
//            "Dear " + member.getName()
//                + ", thank you for signing up. Your account is "
//                + member.getAccount());
//        try{
//            this.mailSender.send(msg);
//        }
//        catch (MailException ex) {
//            // simply log it and go on...
//            System.err.println(ex.getMessage());
//        }
		
		SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(member.getEmail());
        message.setSubject("主題：簡單郵件");
        message.setText("Dear " + member.getName()
        				+ ", thank you for signing up. Your account is "
        				+ member.getAccount());

        try {
            mailSender.send(message);
            logger.info("email已發送。");
        } catch (Exception e) {
            logger.error("email發生異常！", e);
        }

	}

}
