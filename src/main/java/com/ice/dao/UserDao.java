package com.ice.dao;

import java.util.List;
import java.util.Map;

import com.ice.app.login.UserVo;


public interface UserDao {

	UserVo findUserInfo(String username);

	List<Map<String, Object>> loadPermission(String username);

}
