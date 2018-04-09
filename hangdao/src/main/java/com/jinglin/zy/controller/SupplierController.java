package com.jinglin.zy.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jinglin.zy.model.Supplier;
import com.jinglin.zy.service.SupplierService;
import com.jinglin.zy.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author DELL
 * 这是供应商信息
 */
@Controller
@RequestMapping(value="/supplier")
public class SupplierController {
   @RequestMapping("/show")
   public String show(HttpSession session) {
	   if(session.getAttribute("name")==null) {
		   session.setAttribute("name",Math.random());
	   }
	   return "supplier";
	   
   }
	
   public void testit() {
	   
   }
	
	
	
   @Resource(name="supplierService")
   private SupplierService supplierService;
   @RequestMapping(value="/addsupplier")
   @ResponseBody
   public String addsupplier(Supplier supplier) {
	   if(supplierService.additem(supplier)>0) {
		   return "Y";
	   }else {
		   return "N";
	   }
   }
   @RequestMapping(value="/getsuppliers")
   public void getsuppliers(Supplier supplier,
		                    @RequestParam(value="pageindex",required=false,defaultValue="1")Integer pageindex,
		                    @RequestParam(value="pagesize",required=false,defaultValue="5")Integer pagesize,
		                    HttpServletResponse response) {
	   Map<String,Object> map = new HashMap<String,Object>();
	   if(supplier.getId()!=null && supplier.getId()>0) {
		   map.put("id", supplier.getId());
	   }
	   if(supplier.getSupname()!=null) {
		   map.put("supname", supplier.getSupname());
	   }
	   //.......
	   map.put("pageindex", (pageindex-1)*pagesize);//起始行号
	   map.put("pagesize", pagesize);
	   //获取了数据的集合
	   List<Supplier> listsuppliers = supplierService.getsupplierlist(map);
	   //获取总的数据总数
	   int datacount= supplierService.getcount(map);
	   int pagecount = (int) Math.ceil(datacount*1.0/pagesize);//分页总数
	   JSONArray jsonrows = JSONArray.fromObject(listsuppliers);
	   JSONObject jsonobject =new JSONObject();
	   jsonobject.put("result", jsonrows);//数据集合
	   jsonobject.put("datacount",datacount);//数据总数
	   jsonobject.put("pagecount",pagecount);//总的页数
	   jsonobject.put("currenpage", pageindex);//当前页
		try {
			ResponseUtil.write(response, jsonobject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
   
   
   
   
   
}
