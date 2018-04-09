package com.jinglin.zy.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jinglin.zy.dao.impl.SupplierDao;
import com.jinglin.zy.model.Supplier;
import com.jinglin.zy.service.SupplierService;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
   @Resource
   private SupplierDao supplierDao;

	@Override
	public int additem(Supplier supplier) {
		return supplierDao.additem(supplier);
	}

	@Override
	public int updateitem(Supplier supplier) {
		return supplierDao.updateitem(supplier);
	}

	
	
	@Override
	public List<Supplier> getsupplierlist(Map<String, Object> map) {
		return supplierDao.getlist(map);
	}

	@Override
	public int getcount(Map<String, Object> map) {
		return supplierDao.getcount(map);
	}

	@Override
	public Supplier getsupplierone(Integer id) {
		return supplierDao.getmodel(id);
	}
}
