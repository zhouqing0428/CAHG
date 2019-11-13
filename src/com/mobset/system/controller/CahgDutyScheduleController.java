package com.mobset.system.controller;

import java.io.OutputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgDutyScheduleService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/cahgDutySchedule")
public class CahgDutyScheduleController {

	@Resource(name="dutyScheduleService")
	private CahgDutyScheduleService dutyScheduleService;
	
	@RequestMapping(value="/dutyDetailsShow")
	public String dutyDetailsShow(HttpServletRequest request){
		String type = request.getParameter("type");
		if("".equals(type) || type == null){
			return "page/404";
		}
		if("1".equals(type)){
			HashMap infoMap = dutyScheduleService.selectDutyInfo(null);
			request.setAttribute("infoMap", infoMap);
			request.setAttribute("type", type);
		}
		else if("2".equals(type)){
			
		}
		request.setAttribute("type", type);
		return "dutySchedule/duty_schedule_details";
	}
	
	
	@RequestMapping(value="/selectDutyList")
	@ResponseBody
	public Map<String, Object> selectDutyList(HttpServletRequest request){
		String play_date = request.getParameter("play_date");
		String end_date = request.getParameter("end_date");
		String category = request.getParameter("category");
		String name = request.getParameter("name");
		HashMap map = new HashMap();
		
		Date d = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		String date = formatter.format(d);
		
		if(play_date!=null && !"".equals(play_date)){
			map.put("play_date", play_date+"-01");
		}else{
			map.put("play_date", date+"-01");
		}
		if(end_date!=null && !"".equals(end_date)){
			map.put("end_date", end_date+"-32");
		}else{
			map.put("end_date", date+"-32");
		}
		if(category!=null && !"".equals(category)){
			map.put("category", category);
		}
		if(name!=null && !"".equals(name)){
			map.put("name", name);
		}
		
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		Page p =new Page();
		p.setCurPage(Integer.parseInt(page));
		p.setPageSize(Integer.parseInt(rows));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows", 40);//每页大小
		List<HashMap> list = dutyScheduleService.selectDutyList(map);
		if(list!=null){
			 Integer count = dutyScheduleService.count(map);
			 Map<String, Object> result = new HashMap<String, Object>();
			 result.put("total",count);
			 result.put("rows", list);
			 return result;
		}
		return null;
	}
	
	@RequestMapping(value="/downCollecTable")
	@ResponseBody
	public String excel(HttpServletResponse response,HttpServletRequest request){
		String play_date = request.getParameter("play_date");
		String end_date = request.getParameter("end_date");
		String category = request.getParameter("category");
		String name = request.getParameter("name");
		HashMap map = new HashMap();
		
		if(play_date!=null && !"".equals(play_date)){
			map.put("play_date", play_date+"-01");
		}
		if(end_date!=null && !"".equals(end_date)){
			map.put("end_date", end_date+"-32");
		}
		if(category!=null && !"".equals(category)){
			map.put("category", category);
		}
		if(name!=null && !"".equals(name)){
			map.put("name", name);
		}
		
		map.put("page",1);//从第几个开始
		map.put("rows", 990);//每页大小
		List<HashMap> list = dutyScheduleService.selectDutyList(map);
		 // 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet();  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  

        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("姓名");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);  
        cell.setCellValue("手机号码");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("办公内线");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3); 
        cell.setCellValue("办公外线");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 4);  
        cell.setCellValue("值班时间");  
        cell.setCellStyle(style);
        
        
        for (int i = 0; i <list.size(); i++)  
        {  
            row = sheet.createRow((int) i + 1);  
            // 第四步，创建单元格，并设置值  
            row.createCell((short) 0).setCellValue((String) list.get(i).get("name"));  
            row.createCell((short) 1).setCellValue((String) list.get(i).get("mobile"));  
            row.createCell((short) 2).setCellValue((String) list.get(i).get("interior")); 
            row.createCell((short) 3).setCellValue((String) list.get(i).get("external")); 
            row.createCell((short) 4).setCellValue((String) list.get(i).get("work_time"));  
        }  
        // 第六步，将文件存到指定位置  
        try  
        {  
        	//web浏览通过MIME类型判断文件是excel类型
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("utf-8");

            // 对文件名进行处理。防止文件名乱码
            // Content-disposition属性设置成以附件方式进行下载
            response.setHeader("Content-disposition", "attachment;filename="+play_date+"——"+end_date+".xls");
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }
		return null;
	}
}
