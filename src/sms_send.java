import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.util.EntityUtils;

import com.mobset.system.util.MD5;

public class sms_send extends Thread {
public static void main(String[] args) throws UnsupportedEncodingException, InterruptedException {
	http1();
}
	static public String SMSsend(String url)
			throws UnsupportedEncodingException {
		String result = "";
		try {
			URL U = new URL(url);
			URLConnection connection = U.openConnection();
			
			/*  connection.setDoOutput(true); connection.setDoInput(true);
			  connection.setRequestProperty("Charsert", "UTF-8"); //设置请求编码
			  connection.setUseCaches(false);
			  connection.setRequestProperty("Content-Type","application/json");
			*/
			connection.setDoOutput(true);
			connection.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), "UTF-8"));
			String line;
			StringBuffer sb = new StringBuffer("");
			while ((line = in.readLine()) != null) {
				result += line;
			}
			in.close();
		} catch (Exception e) {
			System.out.println("没有结果！" + e);
			result = "产生异常";
		}
		return  result.toString();
	}

	public static void send() throws UnsupportedEncodingException {
		/*String CorpID = "200136"; // 登录ID号
		String LoginName = "Admin";// 登录名
		String passwd = "Qi314463";// 登录密码*/
		String CorpID = "100000"; // 登录ID号
		String LoginName = "chenlg";// 登录名
		String passwd = "forget20";// 登录密码
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");// 日期格式化
		String timeStamp = dateFormat.format(now);
		String strPwsd = MD5.md5(CorpID + passwd + timeStamp);// MD5加密方式
		String urls = "", mobile = "13266541569", txt = "";// mobile手机号码
		
		String contexts =  URLEncoder.encode("收到请回复，谢谢", "UTF-8");// 转码
		//System.out.println(unicodeToString("\ue415"));
		//String contexts = URLDecoder.decode("%E4%BA%B2%E7%88%B1%E7%9A%84%E6%B7%98%E5%AE%9D%E4%BC%9A%E5%91%98jiangchunji");// 转码
		System.out.println(contexts);
		String baseUrl = "sms1.mobset.com";// 广州首易短信接口地址,CorpID开头数字是3，对应地址是sm3.mobset.com
		urls = "http://" + baseUrl + "/UTF/Sms_Send.asp?CorpID=" + CorpID
				+ "&LoginName=" + LoginName + "&TimeStamp=" + timeStamp
				+ "&passwd=" + strPwsd + "&send_no=" + mobile + "&msg="
				+ contexts + "&LongSms=1";
		System.out.println(urls);
		txt = SMSsend(urls);
		System.out.println(txt);
	}
	
	public static void http1() throws UnsupportedEncodingException {
		String CorpID = "100000"; // 登录ID号
		String LoginName = "chenlg";// 登录名
		String passwd = "forget20";// 登录密码
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");// 日期格式化
		String timeStamp = dateFormat.format(now);
		String strPwsd = MD5.md5(CorpID + passwd + timeStamp);// MD5加密方式
		String urls = "", mobile = "13266541569", txt = "";// mobile手机号码
		
		String contexts =  URLEncoder.encode("收到请回复，谢谢1\n\r按时\n我我我", "UTF-8");// 转码
		//System.out.println(unicodeToString("\ue415"));
		//String contexts = URLDecoder.decode("%E4%BA%B2%E7%88%B1%E7%9A%84%E6%B7%98%E5%AE%9D%E4%BC%9A%E5%91%98jiangchunji");// 转码
		System.out.println(contexts);
		String baseUrl = "sms1.mobset.com";// 广州首易短信接口地址,CorpID开头数字是3，对应地址是sm3.mobset.com
		urls = "http://" + baseUrl + "/UTF/Sms_Send.asp?CorpID=" + CorpID
				+ "&LoginName=" + LoginName + "&TimeStamp=" + timeStamp
				+ "&Passwd=" + passwd + "&send_no=" + mobile + "&msg="
				+ contexts + "&LongSms=1";
		System.out.println(urls);
		txt = SMSsend(urls);
		System.out.println(txt);
	}
	
	  public static String unicodeToString(String unicode) {
	        StringBuffer string = new StringBuffer();
	        String[] hex = unicode.split("\\\\u");
	        for (int i = 1; i < hex.length; i++) {
	            int data = Integer.parseInt(hex[i], 16);// 转换出每一个代码点
	            string.append((char) data);// 追加成string
	        }
	        return string.toString();
	    }

	static String getPageContent(String strUrl, String strPostRequest,
			int maxLength) {
		StringBuffer buffer = new StringBuffer();

		try {
			URL newUrl = new URL(strUrl);

			HttpURLConnection hConnection = (HttpURLConnection) newUrl
					.openConnection();
			if (strPostRequest.length() > 0) {
				hConnection.setDoOutput(true);
				// hConnection.setRequestProperty("User-Agent","Mozilla/5.0 ( compatible ) ");
				// hConnection.setRequestProperty("Accept","*/*");
				OutputStreamWriter out = new OutputStreamWriter(
						hConnection.getOutputStream());
				out.write(strPostRequest);
				out.flush();
				out.close();
			}
			InputStream input = hConnection.getInputStream();
			InputStreamReader in = new InputStreamReader(input, "utf-8");
			BufferedReader rd = new BufferedReader(in);
			int ch;
			for (int length = 0; (ch = rd.read()) > -1
					&& (maxLength <= 0 || length < maxLength); length++)
				buffer.append((char) ch);
			String s = buffer.toString();
			s.replaceAll("//&[a-zA-Z]{1,10};", "").replace("<[^>]>", "");
			System.out.println(s);
			rd.close();
			hConnection.disconnect();
			return buffer.toString().trim();
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}

	public static void recv() throws UnsupportedEncodingException {
		String CorpID = "303159"; // 登录ID号
		String LoginName = "admin";// 登录名
		String passwd = "forget20";// 登录密码
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");// 日期格式化
		String timeStamp = dateFormat.format(now);
		String strPwsd = MD5.md5(CorpID + passwd + timeStamp);// MD5加密方式
		String urls = "", mobile = "132****1569", txt = "";// mobile手机号码
		String baseUrl = "sms3.mobset.com";// 广州首易短信接口地址,CorpID开头数字是3，对应地址是sm3.mobset.com
		urls = "http://" + baseUrl + "/SDK2/Sms_Recv.asp?CorpID=" + CorpID
				+ "&LoginName=" + LoginName + "&TimeStamp=" + timeStamp
				+ "&XML=1" + "&passwd=" + strPwsd;
		 txt=doPost(urls, "utf-8");
		System.out.println(urls);
		System.out.print(txt);
	}

	public static String doPost(String url, String charset) {
		HttpClient httpClient = null;
		HttpPost httpPost = null;
		String result = null;
		try {
			httpClient = new SSLClient();
			httpPost = new HttpPost(url);
			HttpResponse response = httpClient.execute(httpPost);
			if (response != null) {
				HttpEntity resEntity = response.getEntity();
				if (resEntity != null) {
					result = EntityUtils.toString(resEntity, charset);

				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}

	public static void HttpsPost() throws UnsupportedEncodingException {
		/*企业ID:200136
		登录用户:Admin
		密码:Qi314463*/
		String CorpID = "200136"; // 登录ID号
		String LoginName = "Admin";// 登录名
		String passwd = "Qi314463";// 登录密码

		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");// 日期格式化
		String timeStamp = dateFormat.format(now);
		String strPwsd = MD5.md5(CorpID + passwd + timeStamp);// MD5加密方式
		String urls = "", mobile = "13266541569", txt = "";// mobile手机号码
		// String
		// contexts=URLEncoder.encode("您好！非常感谢您对我们医院的信任，我们将竭尽全力为了您/家人的健康服务。 按照我院住院的要求：住院患者严禁非医嘱离院，这一点我们在入院须知时已经明确告知。您/家属现在已经违反了我院的住院规定私自离院，对于疾病的治疗失去了连贯性，这会影响治疗效果。患者在外出期间，原有治疗中断，将有可能出现病情加重或者病情恶化的不良后果；配置好的药物将浪费；已经取得的效果可能丧失，病情可能随时发生变化而不能得到及时的诊治，丧失最佳的诊断和治疗疾病的时机；可能出现其他无法预计的意外。患者外出期间出现的一切意外和不良后果，医院不承担任何责任。同时，如违反社保证策可能会影响报销；更为关键的是我们对你无法尽到关注义务，如果发生意外我们无法承担法律责任，请收到信息后立即返回病房，谢谢配合！",
		// "GBK");//转码
		// String baseUrl =
		// "sms3.mobset.com";//广州首易短信接口地址,CorpID开头数字是3，对应地址是sm3.mobset.com
		/*
		 * urls="https://"+baseUrl+"/SDK2/Sms_Send.asp?CorpID="+CorpID+"&LoginName="
		 * +
		 * LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&send_no="+mobile
		 * +"&msg="+contexts+"&LongSms=1";
		 */// urls =
			// "https://.mobset.com/SDK2/Sms_Send.asp?CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&send_no="+mobile+"&msg="+contexts+"&LongSms=1";;
			// urls =
			// "https://sms3.mobset.com:8096/SDK3/Sms?Methods=SmsGetRecv&CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&SecretKey="+strPwsd+"&msg="+contexts+"&LongSms=1";;
		String msg=URLEncoder.encode("夸父逐日：夸父与太阳竞跑，一直追赶到太阳落下的地方；他感到口渴，想要喝水，就到黄河、渭水喝水。黄河、渭水的水不够，又去北方的大湖喝水。还没赶到大湖，就半路渴死了。他丢弃了他的手杖，变化成为了桃林,共工怒触不周山 ：从前，共工与颛顼争夺部落天帝之位，(共工在大战中惨败）(共工)愤怒地用头撞击不周山，支撑着天的柱子折断了，拴系着大地的绳索也断了。（所以）天向西北方向倾斜，所以日月、星辰都向西北方向移动了；大地的东南角塌陷了，所以江河积水泥沙都朝东南角流去了", "utf-8");//编辑要发送信息的内容
		urls = "https://45.116.33.133:8095/SDK3/Sms?Methods=SmsSend&CorpID="
				+ CorpID
				+ "&LoginName="
				+ LoginName
				+ "&TimeStamp="
				+ timeStamp + "&SecretKey=" + strPwsd
				+ "&Content="+msg
				+"&PhoneNumbers=13266541569";
		String httpOrgCreateTest = urls;
		System.out.println(urls);
		String result = doPost(httpOrgCreateTest, "utf-8");
		//System.out.println("result:"+result);
		System.out.println(result);
		JSONObject jsonObject = JSONObject.fromObject(result);
		int Code = jsonObject.getInt("Code");
		System.out.println("Code:" + Code);
		String Message = jsonObject.getString("Message");
		System.out.println("Message:" + Message);
		if (jsonObject.has("Details") == true) {
			JSONArray index = jsonObject.getJSONArray("Details");
			for (int j = 0; j < index.size(); j++) {
				String PhoneNumber = index.getJSONObject(j).getString(
						"PhoneNumber");
				System.out.println("PhoneNumber:" + PhoneNumber);
				String RecvNumber = index.getJSONObject(j).getString(
						"RecvNumber");
				System.out.println("RecvNumber" + RecvNumber);
				String AddNum = index.getJSONObject(j).getString("AddNum");
				System.out.println("AddNum:" + AddNum);
				String RecvTime = index.getJSONObject(j).getString("RecvTime");
				System.out.println("RecvTime:" + RecvTime);
				String Content = index.getJSONObject(j).getString("Content");
				System.out.println("Content:" + Content);
			}
		}
	}
	
	public static void httpsStatus() throws UnsupportedEncodingException, InterruptedException {

		String CorpID = "200136"; // 登录ID号
		String LoginName = "Admin";// 登录名
		String passwd = "Qi314463";// 登录密码

		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");// 日期格式化
		String timeStamp = dateFormat.format(now);
		String strPwsd = MD5.md5(CorpID + passwd + timeStamp);// MD5加密方式
		String urls = "", mobile = "13266541569", txt = "";// mobile手机号码
		// String
		// contexts=URLEncoder.encode("您好！非常感谢您对我们医院的信任，我们将竭尽全力为了您/家人的健康服务。 按照我院住院的要求：住院患者严禁非医嘱离院，这一点我们在入院须知时已经明确告知。您/家属现在已经违反了我院的住院规定私自离院，对于疾病的治疗失去了连贯性，这会影响治疗效果。患者在外出期间，原有治疗中断，将有可能出现病情加重或者病情恶化的不良后果；配置好的药物将浪费；已经取得的效果可能丧失，病情可能随时发生变化而不能得到及时的诊治，丧失最佳的诊断和治疗疾病的时机；可能出现其他无法预计的意外。患者外出期间出现的一切意外和不良后果，医院不承担任何责任。同时，如违反社保证策可能会影响报销；更为关键的是我们对你无法尽到关注义务，如果发生意外我们无法承担法律责任，请收到信息后立即返回病房，谢谢配合！",
		// "GBK");//转码
		// String baseUrl =
		// "sms3.mobset.com";//广州首易短信接口地址,CorpID开头数字是3，对应地址是sm3.mobset.com
		/*
		 * urls="https://"+baseUrl+"/SDK2/Sms_Send.asp?CorpID="+CorpID+"&LoginName="
		 * +
		 * LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&send_no="+mobile
		 * +"&msg="+contexts+"&LongSms=1";
		 */// urls =
			// "https://.mobset.com/SDK2/Sms_Send.asp?CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&passwd="+strPwsd+"&send_no="+mobile+"&msg="+contexts+"&LongSms=1";;
			// urls =
			// "https://sms3.mobset.com:8096/SDK3/Sms?Methods=SmsGetRecv&CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&SecretKey="+strPwsd+"&msg="+contexts+"&LongSms=1";;
		String msg=URLEncoder.encode("收到，请回复 谢谢", "utf-8");//编辑要发送信息的内容
		urls = "https://45.116.33.133:8095/SDK3/Sms?Methods=SmsGetReport&CorpID="
				+ CorpID
				+ "&LoginName="
				+ LoginName
				+ "&TimeStamp="
				+ timeStamp + "&SecretKey=" + strPwsd
				+ "&Content="+msg
				+"&PhoneNumbers=13266541569";
		String httpOrgCreateTest = urls;
		System.out.println(urls);
		while (true) {
			String result = doPost(httpOrgCreateTest, "utf-8");
			System.out.println(result);
			Thread.sleep(1000);
		}
		
		/*JSONObject jsonObject = JSONObject.fromObject(result);
		int Code = jsonObject.getInt("Code");
		System.out.println("Code:" + Code);
		String Message = jsonObject.getString("Message");
		System.out.println("Message:" + Message);*/
		/*if (jsonObject.has("Details") == true) {
			JSONArray index = jsonObject.getJSONArray("Details");
			for (int j = 0; j < index.size(); j++) {
				String PhoneNumber = index.getJSONObject(j).getString(
						"PhoneNumber");
				System.out.println("PhoneNumber:" + PhoneNumber);
				String RecvNumber = index.getJSONObject(j).getString(
						"RecvNumber");
				System.out.println("RecvNumber" + RecvNumber);
				String AddNum = index.getJSONObject(j).getString("AddNum");
				System.out.println("AddNum:" + AddNum);
				String RecvTime = index.getJSONObject(j).getString("RecvTime");
				System.out.println("RecvTime:" + RecvTime);
				String Content = index.getJSONObject(j).getString("Content");
				System.out.println("Content:" + Content);
			}
		}*/
	}
	
	public static void http3() throws UnsupportedEncodingException{
		String CorpID = "100000"; // 登录ID号
		String LoginName = "chenlg";// 登录名
		String passwd = "forget20";// 登录密码

	  	Random r = new Random();
	  	//String send_no="1326654"+(int)((Math.random()*9+1)*1000);//要发送短信的手机号码
	  	String send_no="18943662678";
	  	String msg=URLEncoder.encode("陈金助于01-30 14:27:38 给您发送一条标题为信息上报流程（集团信息中心）的流程，请您及时办理。", "utf-8");//编辑要发送信息的内容
		String addNum = "";
		String RecvTime = "";
  	    Date now = new Date(); 
	    SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");//日期格式
	    String timeStamp = dateFormat.format(now);
	    
	    String strPwsd = MD5.md5(CorpID+passwd+timeStamp);//MD5加密方式
			//拼接ulr访问
			//Methods = SmsSend为发送短信，SmsGetRecv取回复短信，SmsGetReport取短信状态，SmsGetBalance取账号剩余短信量,SmsGetSign取短信签名�?
	  	String ip="https://sms1.mobset.com:843/SDK3/Sms?Methods=SmsSend&CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&SecretKey="+strPwsd+"&PhoneNumbers="+send_no+"&Content="+msg+"&AddNum="+addNum+"&LongSms=1";//请求发短信的接口
	  	String sr=doPost(ip,"UTF-8");
	  	System.out.println(sr);
	  	/*System.out.println(sr);
		JSONObject jsonObject = JSONObject.fromObject(sr);
		int Code = jsonObject.getInt("Code");
		System.out.println(sr);
		return Code;   */
	}
	
	public static void http3Recv() throws UnsupportedEncodingException{
		String CorpID = "200136"; // 登录ID号
		String LoginName = "Admin";// 登录名
		String passwd = "Qi314463";// 登录密码

	  	Random r = new Random();
	  	//String send_no="1326654"+(int)((Math.random()*9+1)*1000);//要发送短信的手机号码
	  	String send_no="13266541569";
	  	String msg=URLEncoder.encode("收到，请回复 谢谢", "utf-8");//编辑要发送信息的内容
		String addNum = "";
		String RecvTime = "";
  	    Date now = new Date(); 
	    SimpleDateFormat dateFormat = new SimpleDateFormat("MMddHHmmss");//日期格式
	    String timeStamp = dateFormat.format(now);
	    
	    String strPwsd = MD5.md5(CorpID+passwd+timeStamp);//MD5加密方式
			//拼接ulr访问
			//Methods = SmsSend为发送短信，SmsGetRecv取回复短信，SmsGetReport取短信状态，SmsGetBalance取账号剩余短信量,SmsGetSign取短信签名�?
	  	String ip="http://45.116.33.133:8095/SDK3/Sms?Methods=SmsGetReport&CorpID="+CorpID+"&LoginName="+LoginName+"&TimeStamp="+timeStamp+"&SecretKey="+strPwsd+"&PhoneNumbers="+send_no+"&Content="+msg+"&AddNum="+addNum+"&LongSms=1";//请求发短信的接口
	  	
	  	String sr=doPost(ip,"UTF-8");
	  	System.out.println(sr);
	  	/*System.out.println(sr);
		JSONObject jsonObject = JSONObject.fromObject(sr);
		int Code = jsonObject.getInt("Code");
		System.out.println(sr);
		return Code;   */
	}
}