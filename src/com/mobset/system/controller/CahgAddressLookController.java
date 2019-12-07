package com.mobset.system.controller;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.constant.CommonConstants;
import com.mobset.system.service.CahgAddressLookService;
import com.mobset.system.service.SysDictionaryService;

import net.sf.json.JSONArray;

/**
 * @说明  通讯录controller
 * @创建人 陈礼刚
 * @时间 2017年7月10日13:47:16
 */
@Controller
@RequestMapping("/cahgAddressLook")

public class CahgAddressLookController {
	
	@Resource(name="cahgAddressLookService")
	private CahgAddressLookService cahgAddressLookService;
	
	@Resource(name="sysDictionaryService")
	private SysDictionaryService sysDictionaryService;
	
	
	/**
	 * 通讯录显示页
	 */
	@RequestMapping(value="/addressLookShowPage")
	public String addressLookShowPage(HttpServletRequest request){
		String dept_id = request.getParameter("dept_id");
		HashMap map = null;// 参数统一map
		if (!(dept_id == null || "".equals(dept_id) || CommonConstants.DEPT_ID.equals(dept_id))) {// ID为空,进入404页面
			map = new HashMap();
			map.put("dept_id", dept_id);
		}		
		List<HashMap> addressLookList = cahgAddressLookService.addressLookList(map);
		
		if(!CommonConstants.DEPT_ID.equals(dept_id)){
			HashMap dept = sysDictionaryService.deptSelect(map);
			request.setAttribute("dept", dept);//科室信息
		}
		
		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("condition", " dept_id != '38' ");
		List<Map<String, Object>> deptList = sysDictionaryService.deptList(paramMap);// 科室列表
		
		request.setAttribute("depts", JSONArray.fromObject(deptList)); //科室列表
		request.setAttribute("addressLookList", addressLookList);//通讯录列表
		request.setAttribute("dept_id", dept_id);
		return "addressLook/address_look_show";
	}

	
	@RequestMapping(value="/downAddressLookTable")
	@ResponseBody
	public String excel(HttpServletResponse response,HttpServletRequest request){
		String dept_id = request.getParameter("dept_id");
		String name = request.getParameter("name");
		HashMap map = new HashMap();//参数统一map
		map.put("dept_id", dept_id);
		List<HashMap> addressLookList = cahgAddressLookService.addressLookList(map);
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
        cell.setCellValue("工号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("职务");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3); 
        cell.setCellValue("手机号码");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 4);  
        cell.setCellValue("办公内线");  
        cell.setCellStyle(style);
        cell = row.createCell((short) 5);  
        cell.setCellValue("办公外线");  
        cell.setCellStyle(style);
        
        
        for (int i = 0; i <addressLookList.size(); i++)  
        {  
            row = sheet.createRow((int) i + 1);  
            // 第四步，创建单元格，并设置值  
            row.createCell((short) 0).setCellValue((String) addressLookList.get(i).get("name"));  
            row.createCell((short) 1).setCellValue((String) addressLookList.get(i).get("job_number"));  
            row.createCell((short) 2).setCellValue((String) addressLookList.get(i).get("duty")); 
            row.createCell((short) 3).setCellValue((String) addressLookList.get(i).get("mobile")); 
            row.createCell((short) 4).setCellValue((String) addressLookList.get(i).get("interior"));  
            row.createCell((short) 5).setCellValue((String) addressLookList.get(i).get("external"));  
        }  
        // 第六步，将文件存到指定位置  
        try  
        {  
        	//web浏览通过MIME类型判断文件是excel类型
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("utf-8");

            // 对文件名进行处理。防止文件名乱码
            // Content-disposition属性设置成以附件方式进行下载
            response.setHeader("Content-disposition", "attachment;filename="+name+".xls");
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
