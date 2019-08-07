package com.community.petish.gatherboard.websocket;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	HttpServletRequest request;
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	public SocketHandler() {
		super();
		this.logger.info("create SocketHandler instance");
	}
	
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);
		this.logger.info("sessionSetremove"+sessionSet.size());
		this.logger.info("remove session!");
	}
	
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		sessionSet.add(session);
		this.logger.info("sessionSetADD"+sessionSet.size());
		
		this.logger.info("add session!");
	}
	
	//웹 소켓 서버측에 메시지가 전달되면 호출되는 메소드
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);

		for(WebSocketSession client_session : this.sessionSet) {
			if(client_session.isOpen()) {
				try {
					if(!(client_session.equals(session))) {						
						client_session.sendMessage(message);
					}
				} catch(Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}
	
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		this.logger.error("web socket error!", exception);
	}
}
