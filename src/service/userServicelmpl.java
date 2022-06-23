package service;

import java.sql.SQLException;
import dao.userDao;
import dao.userDaolmpl;

import pojo.user;
public class userServicelmpl implements userService {
		
		private userDao ud=new userDaolmpl();
		@Override
		public user userLogin(String username, String password) throws SQLException {
			// TODO Auto-generated method stub
			return ud.userLogin(username,password);
		}
}
