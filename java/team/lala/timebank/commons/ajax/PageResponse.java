package team.lala.timebank.commons.ajax;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

public class PageResponse<T> {


	private String status;
	
	private List<String> messages;
	
	private Page<T> page;

	@Override
	public String toString() {
		return "PageResponse [status=" + status + ", messages=" + messages + ", page=" + page + "]";
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

	public Page<T> getPage() {
		return page;
	}

	public void setPage(Page<T> page) {
		this.page = page;
	}
	
	
}
