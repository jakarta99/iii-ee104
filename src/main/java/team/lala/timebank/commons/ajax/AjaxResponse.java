package team.lala.timebank.commons.ajax;

import java.util.ArrayList;
import java.util.List;

public class AjaxResponse<T> {
	
	private String status;
	
	private List<String> messages;
	
	private T obj;

	@Override
	public String toString() {
		return "AjaxResponse [status=" + status + ", messages=" + messages + ", obj=" + obj + "]";
	}

	public String getStatus() {
		
		// when messages is empty, return success
		if(messages == null || messages.size() == 0) {
			return "SUCCESS";
		}		
		return "ERROR";		
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<String> getMessages() {
		return messages;
	}

	public void setMessages(List<String> messages) {
		this.messages = messages;
	}
	
	public void addMessage(String message) {
		if(messages == null) {
			messages = new ArrayList<String>();
		}
		messages.add(message);
	}
	

	public T getObj() {
		return obj;
	}

	public void setObj(T obj) {
		this.obj = obj;
	}
	
	
	
	

}
