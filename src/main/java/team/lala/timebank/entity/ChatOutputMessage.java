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
	
	public ChatOutputMessage(String from, String text, String time) {
		this.from = from;
		this.text = text;
		this.time = time;
	}

	
}
