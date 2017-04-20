package com.czk.util;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.czk.login.listener.SessionListener;

@ServerEndpoint(value = "/websocket", configurator = GetHttpSessionConfigurator.class)
public class MyWebSocKet {

	@OnMessage
	public void onMessage(String message, Session session) throws IOException, InterruptedException {
		System.out.println(message);
		System.out.println("-----数据接受成功-----");
	}

	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		System.out.println("-----链接创建成功------");
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		SessionListener.getHsessionSessionMap().put(httpSession.getId(), session);
	}

	@OnClose
	public void onClose() {
		System.out.println("-----链接关闭------");
	}

}
