package team.lala.timebank.entity;



import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ChatClient {	
	
	private String from;
	
	private String to;
	
    private String text;

	@Override
	public String toString() {
		return "ChatClient [from=" + from + ", to=" + to + ", text=" + text + "]";
	}



}
