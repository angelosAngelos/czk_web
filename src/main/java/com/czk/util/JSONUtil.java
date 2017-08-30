package com.czk.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class JSONUtil {
	
	public static boolean sendHtmlObject(HttpServletResponse response,Object result){		
		String resultString;
		if (result instanceof Collection) {
			resultString = JSONArray.toJSONString(result);
		} else {
			resultString = JSONObject.toJSONString(result);
		}
		
		response.setContentType("text/html;charset=utf-8");
	
		response.setDateHeader("expires", 0);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("pragma", "no-cache");
		try {
			PrintWriter out = response.getWriter();
			out.print(resultString);
			out.flush();
			out.close();
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}		
	}
}
