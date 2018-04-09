package com.jinglin.zy.dao.impl;

import java.util.Map;

import com.jinglin.zy.dao.IDao;
import com.jinglin.zy.model.Supplier;

public interface SupplierDao extends IDao<Supplier> {
	int getcount(Map<String,Object> map);
}
