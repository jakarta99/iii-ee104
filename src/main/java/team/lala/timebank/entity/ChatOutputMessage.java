package team.lala.timebank.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatOutputMessage {
	
	private String from;
	
	private String text;
	
	private String time;
	
	private String to;
	
	public ChatOutputMessage(String from,String to, String text, String time ) {
		this.from = from;
		this.to = to;
		this.text = text;
		this.time = time;
	}

	
}
