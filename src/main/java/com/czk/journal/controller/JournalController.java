package com.czk.journal.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.czk.journal.service.JournalService;

@Controller
@RequestMapping(value="journalController.do")
public class JournalController {
	
	@Resource(name="journalService")
	JournalService journalService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(params="method=getJournalByUser",method = RequestMethod.POST)
	public List<Map<String,Object>> getJournalByUser(HttpServletRequest request,HttpServletResponse response){
		String userId = (String) request.getSession().getAttribute("userId");
		return journalService.getJournalByUser(userId);
	}

}
