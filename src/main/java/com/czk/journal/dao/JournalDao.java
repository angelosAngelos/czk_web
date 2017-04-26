package com.czk.journal.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("journalDao")
public interface JournalDao {

	List<Map> getJournalByUser(Map map);
	
}
