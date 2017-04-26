package com.czk.login.listener;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.websocket.Session;

import com.alibaba.fastjson.JSONObject;

public class SessionListener implements HttpSessionListener {

	private static Map<String, HttpSession> userSessionMap = new HashMap();
	private static Map<String, String> sessionUserMap = new HashMap();
	private static Map<String, Session> hsessionSessionMap = new HashMap<>();

	@Override
	public void sessionCreated(HttpSessionEvent session) {
		System.out.println("sessionCreated:" + session.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent session) {
		userSessionMap.remove(sessionUserMap.remove(session.getSession().getId()));
		System.out.println("sessionDestroyed:" + session.getSession().getId());
	}

	public static boolean isAlreadyEnter(HttpSession newSession, String userId) {
		boolean flag = false;
		if (userSessionMap.get(userId) != null) {
			// 之前已有账户登陆
			flag = true;
			HttpSession httpSession = userSessionMap.remove(userId);
			sessionUserMap.remove(httpSession.getId());

			httpSession.removeAttribute("userId");
			httpSession.setAttribute("msg", "账户已在其他地方登陆！");
			Map<String, Object> messageMap = new HashMap<>();
			messageMap.put("type", "TC");
			messageMap.put("msg", "账户已在其他地方登陆");
			try {
				hsessionSessionMap.get(httpSession.getId()).getBasicRemote()
						.sendText(JSONObject.toJSONString(messageMap).toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			hsessionSessionMap.remove(httpSession.getId());
		}
		userSessionMap.put(userId, newSession);
		sessionUserMap.put(newSession.getId(), userId);
		return flag;
	}

	public static Map<String, HttpSession> getUserSessionMap() {
		return userSessionMap;
	}

	public static void setUserSessionMap(Map<String, HttpSession> userSessionMap) {
		SessionListener.userSessionMap = userSessionMap;
	}

	public static Map<String, String> getSessionUserMap() {
		return sessionUserMap;
	}

	public static void setSessionUserMap(Map<String, String> sessionUserMap) {
		SessionListener.sessionUserMap = sessionUserMap;
	}

	public static Map<String, Session> getHsessionSessionMap() {
		return hsessionSessionMap;
	}

	public static void setHsessionSessionMap(Map<String, Session> hsessionSessionMap) {
		SessionListener.hsessionSessionMap = hsessionSessionMap;
	}

}
