package com.czk.journal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.czk.journal.dao.JournalDao;

@Service("journalService")
public class JournalService {
	
	@Resource(name="journalDao")
	JournalDao journalDao;
	
	public List getJournalByUser(String userId){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", userId);
		return journalDao.getJournalByUser(paramMap);
	}
	
}
