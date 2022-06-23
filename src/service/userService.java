package service;

import java.sql.SQLException;
import pojo.user;

public interface userService {
	
	public user userLogin(String username,String password) throws SQLException;
}
