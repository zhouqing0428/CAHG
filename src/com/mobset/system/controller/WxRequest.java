package com.mobset.system.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.util.MD5;


@Controller
@RequestMapping("/wx")
public class WxRequest {

	
	@RequestMapping(value="/Sms_Send")
	@ResponseBody
	public String Sms_Send(HttpServletRequest request) throws UnsupportedEncodingException{
		  String CorpID=request.getParameter("CorpID");
		   String LoginName=request.getParameter("LoginName");
		   String passwd=request.getParameter("password");
		   String mobile = request.getParameter("send_no");
		   String baseUrl = request.getParameter("baseUrl");
		   String t = request.getParameter("msg");
		   String contnt = URLDecoder.decode(t,"UTF-8");
		   System.out.println(contnt);
		   String contexts=URLEncoder.encode(contnt, "GBK");//转码
		   Date now = new Date(); 
		   SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");//日期格式化
		   String timeStamp = dateFormat.format(now);
		   String strPwsd = MD5.md5(CorpID+passwd+timeStamp);//MD5加密方式
		   String urls="",txt="";//mobile手机号码                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
		   urls="http://"+baseUrl+"/SDK2/Sms_Send.asp?CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&send_no="+mobile+"&msg="+contexts+"&LongSms=1";
		   txt=SMSsend(urls);
		   txt=txt.substring(0, 1);
		   System.out.println(txt);	
		   return txt; 
	}
	
	
	@RequestMapping(value="/Sms_Recv")
	@ResponseBody
	public String Sms_Recv(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException, DocumentException{
		   response.setContentType("text/json;charset=UTF-8");
		   response.setCharacterEncoding("UTF-8");
		   String CorpID=request.getParameter("CorpID");
		   String LoginName=request.getParameter("LoginName");
		   String passwd=request.getParameter("password");
		   String baseUrl = request.getParameter("baseUrl");
		   Date now = new Date(); 
		   SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");//日期格式化
		   String timeStamp = dateFormat.format(now);
		   String strPwsd = MD5.md5(CorpID+passwd+timeStamp);//MD5加密方式
		   String urls="http://"+baseUrl+"/SDK2/Sms_Recv.asp?CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&XML=1";
		   String txt=SMSsend(urls);
		   System.out.println(txt);
		   List<Map> list = readStringXmlOut(txt);
		   String t = "";
		   for(int i =0;i<list.size();i++){
			   t += "第"+(i+1)+"条回复：回复号码："+list.get(i).get("SendNum").toString()+"，回复内容："+list.get(i).get("Content").toString()+"\n";
		   }
		  
		   /*for (Map<String, Object> m : list)
		    {
		      for (String k : m.keySet())
		      {
		    	 m.get(k).toString();
		      }
		     
		    }*/
		   t=URLEncoder.encode(t, "UTF-8");//转码
		   System.out.println(t);
	      return t; 
	}
	
	
	
	public String SMSsend(String url) throws UnsupportedEncodingException
	  {
	   String result = "";
	   try{
	    URL U = new URL(url);
	    URLConnection connection = U.openConnection();
	    /*connection.setDoOutput(true); 
      connection.setDoInput(true); 
      connection.setRequestProperty("Charsert", "UTF-8"); //设置请求编码
      connection.setUseCaches(false); 
      connection.setRequestProperty("Content-Type","application/json");*/
	    connection.connect();
	    BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(),"GBK"));
	    String line;
	    StringBuffer sb = new StringBuffer("");
	    while ((line = in.readLine())!= null)
	    {
	     result += line;
	    }
	    in.close();   
	   }catch(Exception e){
	    System.out.println("没有结果！"+e);
	    result="产生异常";
	   }
	   return result.toString();
	  }
	
	  public static List<Map> readStringXmlOut(String xml) {
	        List<Map> list = new ArrayList<Map>();
	        Document doc = null;
	        try {
	            // 将字符串转为XML
	            doc = DocumentHelper.parseText(xml); 
	            // 获取根节点
	            Element rootElt = doc.getRootElement(); 
	            // 拿到根节点的名称
	            System.out.println("根节点：" + rootElt.getName()); 

	            // 获取根节点下的子节点head
	            Iterator iter = rootElt.elementIterator("Msg"); 
	            // 遍历head节点
	            while (iter.hasNext()) {
	            		Element itemEle = (Element) iter.next();
	                    // 拿到head下的子节点script下的字节点username的值
	            	 	Map map = new HashMap();
	                    String SendNum = itemEle.elementTextTrim("SendNum"); 
	                    String RecvTime = itemEle.elementTextTrim("RecvTime");
	                    String Content = itemEle.elementTextTrim("Content");
	                    map.put("SendNum", SendNum);
	                    map.put("RecvTime", RecvTime);
	                    map.put("Content", Content);
	                    list.add(map);
	            }
	        } catch (DocumentException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
}
