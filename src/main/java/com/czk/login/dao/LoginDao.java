package com.czk.login.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("loginDao")
public interface LoginDao {
    
    List<Map> login(Map map);
    
    List<Map> getMenu(Map map);
}
