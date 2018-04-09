package com.jinglin.zy.service;

import java.util.List;
import java.util.Map;

import com.jinglin.zy.model.Supplier;

public interface SupplierService {
   int additem(Supplier supplier);
   int updateitem(Supplier supplier);
   List<Supplier> getsupplierlist(Map<String,Object> map);
   int getcount(Map<String,Object> map);
   Supplier getsupplierone(Integer id);
}
