package com.czk.login.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.czk.login.dao.LoginDao;

@Service("loginService")
public class LoginService {
	
	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map<String,Object> login(Map param){
		List<Map> user = loginDao.login(param);
		if(user.size() == 1){
			return user.get(0);
		}else{
			return null;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List getMenu(Map param){
		List<Map> arrayMenu = loginDao.getMenu(param);
		Map<String,Object> menuMap = new HashMap<>();
		arrayMenu.parallelStream().forEach(menu->{
			Map<String,Object> map =new HashMap<>(); 
			map.putAll(menu);
			map.put("children", new ArrayList<Map<String,Object>>());
			map.put("parentId", menu.get("parent_id"));
			menuMap.put(menu.get("id").toString(), map);
		});
		menuMap.forEach((menuId,map)->{
			String parentId = (String) ((Map<String, Object>) map).get("parentId");
			if(parentId!=null && parentId != ""){
				((ArrayList<Map>) ((Map<String, Object>) menuMap.get(parentId)).get("children")).add((Map) map);
			}
		});
		List<Object> arrayParentMenu = new ArrayList<>(); 
		menuMap.entrySet().parallelStream().forEach(entry->{
			if(((Map<String, Object>) entry.getValue()).get("parentId")==null || ((Map<String, Object>) entry.getValue()).get("parentId").toString().equals("")){
				arrayParentMenu.add(entry.getValue());
			}
		});
		
		return arrayParentMenu;
	}
}
