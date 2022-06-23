package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import pojo.user;
import util.DBUtil;

public class userDaolmpl implements userDao {
		
	@Override
	public user userLogin(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		DBUtil db=new DBUtil();
		String sql="select * from user where userName=? and userPassword=?";  
		PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
		ps.setString(1,username);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		user user=new user();
		while (rs.next()) {
			user.setUsercode(rs.getString("userName"));
			user.setPassword(rs.getString("userPassword"));
			user.setUserrole(rs.getInt("userRole"));
			return user;
		}
		return null;
	}
	   public List<Object> userList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from user where userRole=2"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   user us=new user();
	    	   us.setId(rs.getInt("id"));
	    	   us.setUsercode(rs.getString("userCode"));
	    	   us.setUsername(rs.getString("userName"));
	    	   us.setGender(rs.getString("gender"));
	    	   us.setPassword(rs.getString("userPassword"));
	    	   us.setUserrole(rs.getInt("userRole"));
	    	   us.setBirthday(rs.getString("birthday"));
	    	   list.add(us);
	    	   
	       }
	       return list;
		 
		 }
	   public List<Object> userListByName(String username) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from user where username like ? and userrole=2"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+username+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   user us=new user();
	    	   us.setId(rs.getInt("id"));
	    	   us.setUsercode(rs.getString("userCode"));
	    	   us.setUsername(rs.getString("userName"));
	    	   us.setGender(rs.getString("gender"));
	    	   us.setPassword(rs.getString("userPassword"));
	    	   us.setUserrole(rs.getInt("userRole"));
	    	   us.setBirthday(rs.getString("birthday"));
	    	   list.add(us);
	    	   
	       }
	       return list;
		 
		 }
	   public void deluserById(int id) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="delete from user where id=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,id);
	       ps.executeUpdate();
	       return;
		 }
	   public void adduser(String usercode,String username,String userpassword,String gender,String birthday,int userrole) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into user (userCode,userName,userPassword,gender,birthday,userRole) values(?,?,?,?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,usercode);
	       ps.setString(2,username);
	       ps.setString(3,userpassword);
	       ps.setString(4,gender);
	       ps.setString(5,birthday);
	       ps.setInt(6,userrole);
	       ps.executeUpdate();
	       return;
		 
		 }
	   public void updateuser(int id,String usercode,String username,String userpassword,String gender,String birthday,int userrole) throws SQLException {
		   DBUtil db=new DBUtil();   
	       String sql="update user set userCode=?,userName=?,userPassword=?,gender=?,birthday=?,userRole=? where id="+id; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,usercode);
	       ps.setString(2,username);
	       ps.setString(3,userpassword);
	       ps.setString(4,gender);
	       ps.setString(5,birthday);
	       ps.setInt(6,userrole);
	       ps.executeUpdate();
	       return;
		 }
}
