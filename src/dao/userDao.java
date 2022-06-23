package dao;

import java.sql.SQLException;
import java.util.List;

import pojo.user;
public interface userDao {
	public user userLogin(String username,String password) throws SQLException;
	public  List<Object> userList() throws SQLException;
	public List<Object> userListByName(String username) throws SQLException;
	public void deluserById(int id) throws SQLException;
	public void adduser(String usercode,String username,String userpassword,String gender,String birthday,int userRole) throws SQLException;
	public void updateuser(int id,String usercode,String username,String userpassword,String gender,String birthday,int userRole) throws SQLException;
}
