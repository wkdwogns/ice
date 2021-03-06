package com.ice.app.material;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ice.app.util.Utilities;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MaterialController {
	
	private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);
	
	@Autowired
	private MaterialService materialService;
	
	@RequestMapping(value = "materialList", method = {RequestMethod.GET,RequestMethod.POST})
	public String materialList(Locale locale, Model model,HttpServletRequest request) {
		logger.info("materialList");
		String pIndex = request.getParameter("pIndex");
		if(pIndex ==null || pIndex.equals("")){pIndex = "1";}
		
		int tot = materialService.materialListCnt(param(request));
		Utilities util = new Utilities();
		Map<String,Object> param = util.page(10,tot,pIndex);
		param.putAll(param(request));
		
		List<Map<String,Object>> list = materialService.materialList(param);
		model.addAttribute("list", list);
		model.addAttribute("info", param);
		return "material/materialList";
	}
	
	@RequestMapping(value = "materialInsert", method = {RequestMethod.GET})
	public String materialInsert(Locale locale, Model model,HttpServletRequest request) {
		logger.info("materialInsert");
		
		return "material/materialInsert";
	}
	
	@RequestMapping(value = "materialInsertAction", method = {RequestMethod.POST})
	public String materialInsertAction(Locale locale, Model model,HttpServletRequest request) {
		logger.info("materialInsertAction");
		materialService.materialInsertAction(param(request));
		return "redirect:/materialList";
	}
	
	@RequestMapping(value = "materialUpdate/{no}", method = {RequestMethod.GET})
	public String materialUpdate(Locale locale, Model model,HttpServletRequest request,@PathVariable String no) {
		logger.info("materialUpdate");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("no", no);
		Map<String, Object> info = materialService.materialUpdate(param);
		model.addAttribute("info", info);
		return "material/materialUpdate";
	}
	
	@RequestMapping(value = "materialUpdateAction", method = {RequestMethod.POST})
	public String materialUpdateAction(Locale locale, Model model,HttpServletRequest request) {
		logger.info("materialUpdateAction");
		
		materialService.materialUpdateAction(param(request));
		
		return "redirect:/materialList";
	}
	
	@RequestMapping(value = "materialDelete/{no}", method = {RequestMethod.GET})
	public String materialDelete(Locale locale, Model model,HttpServletRequest request,@PathVariable String no) {
		logger.info("materialDelete");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("no", no);
		materialService.materialDelete(param);
		
		return "redirect:/materialList";
	}
	
	@ResponseBody
	@RequestMapping(value = "materialSort", method = {RequestMethod.POST})
	public List<Map<String,Object>> materialSort(HttpServletRequest request) {
		logger.info("materialSort");
		Map<String,Object> param = new HashMap<String, Object>();
		
		List<Map<String,Object>> list = materialService.materialSort(param);
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> param(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		return param;
	}
}