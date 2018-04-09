package com.jinglin.zy.dao;

import java.util.List;
import java.util.Map;

public interface IDao<T> {
   List<T> getlist(Map<String,Object> map);
   T getmodel(Object id);
   int additem(T t);
   int updateitem(T t);
   int delitem(Object id);
}
