package com.czk.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.czk.login.listener.SessionListener;
import com.czk.login.service.LoginService;
import com.czk.util.JSONUtil;

@Controller
@RequestMapping(value = "/loginController.do")
public class LoginController {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	/**
	 * @author lei.zhou
	 * @note �û���½ 
	 */
	@RequestMapping(params="method=login",method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response ){	
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Map<String,Object> param = new HashMap<>();
		param.put("userName",name);
		param.put("password", password);
		Map<String,Object> result = new HashMap<>();
		Map<String,Object> userMap = loginService.login(param);
		if(userMap!=null){
			SessionListener.isAlreadyEnter(request.getSession(), userMap.get("id")+"");
			request.getSession().setAttribute("userId", userMap.get("id"));
			result.put("RESULT", "SUCCESS");
			result.put("RESULTMAP",userMap);
			result.put("MESSAGE","��½�ɹ�");
		}else{
			result.put("RESULT", "FAIL");
			result.put("MESSAGE","�û������������");
		}
		
		JSONUtil.sendHtmlObject(response, result);
		return null;
	}
	
	/**
	 * @author lei.zhou
	 * @note ��ȡ�û��˵� 
	 */
	@SuppressWarnings({ "unused", "unchecked" })
	@RequestMapping(params="method=getMenu",method=RequestMethod.POST)
	public ModelAndView getMenu(HttpServletRequest request,HttpServletResponse response){
		String userId = (String) request.getSession().getAttribute("userId");
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		List<Object> arrayMenu = loginService.getMenu(paramMap);
		Map<String,Object> result = new HashMap<>();
		if(arrayMenu!=null && arrayMenu.size()>0){
			result.put("RESULT", "SUCCESS");
			result.put("RESULTLIST",arrayMenu);
			result.put("MESSAGE","��ȡ�ɹ�");
		}else{
			result.put("RESULT", "FAIL");
			result.put("MESSAGE","��ȡʧ��");
		}
		JSONUtil.sendHtmlObject(response, result);
		return null;
	}
	
}
