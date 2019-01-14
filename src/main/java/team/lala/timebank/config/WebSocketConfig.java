package team.lala.timebank.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer  {
 
	 	//配置消息代理(broker)
		@Override
	    public void configureMessageBroker(MessageBrokerRegistry config) {
	        config.enableSimpleBroker("/topic");//啟用SimpleBroker，使得訂閱到此 "/topic" 前綴的客戶端可以收到ChatMessage的消息。
	        config.setApplicationDestinationPrefixes("/app"); //將 "/app" 前綴綁定到@MessageMapping註解指定的方法上。
	       
	    }
	    

		//用來註冊Endpoint，"/gs-guide-websocket"即為客戶端嘗試建立連接的地址。
	    @Override
	    public void registerStompEndpoints(StompEndpointRegistry registry) {
	        registry.addEndpoint("/gs-guide-websocket").withSockJS();
	    }

	    
}