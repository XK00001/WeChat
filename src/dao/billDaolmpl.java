package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import pojo.goods;
import pojo.info;
import pojo.message;
import pojo.replenish;
import util.DBUtil;

public class billDaolmpl implements billDao {
	@Override
	public void addbill(String gcode,String speccode,String scode,String procode,String gunit,String time,String username,String remark,int count) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into bill(gcode,speccode,scode,procode,gunit,time,username,remark,count) values(?,?,?,?,?,?,?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,gcode);
	       ps.setString(2,speccode);
	       ps.setString(3,scode);
	       ps.setString(4,procode);
	       ps.setString(5,gunit);
	       ps.setString(6,time);
	       ps.setString(7,username);
	       ps.setString(8,remark);
	       ps.setInt(9,count);
	       ps.executeUpdate();
	       return;
		 
		 }
	public List<Object> replenishList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from replenish"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   replenish rep=new replenish();
	    	   rep.setId(rs.getInt("id"));
	    	   rep.setSpecname(rs.getString("specname"));
	    	   rep.setGname(rs.getString("gName"));
	    	   rep.setGunit(rs.getString("gUnit"));
	    	   rep.setProname(rs.getString("proname"));
	    	   rep.setUsername(rs.getString("username"));
	    	   rep.setTime(rs.getString("time"));
	    	   rep.setCount(rs.getInt("count"));
	    	   rep.setState(rs.getInt("state"));
	    	   list.add(rep);
	    	   
	       }
	       return list;
		 }
	public List<Object> replenishListByName(String gname) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from replenish where gname like ?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+gname+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   replenish rep=new replenish();
	    	   rep.setId(rs.getInt("id"));
	    	   rep.setSpecname(rs.getString("specname"));
	    	   rep.setGname(rs.getString("gName"));
	    	   rep.setGunit(rs.getString("gUnit"));
	    	   rep.setProname(rs.getString("proname"));
	    	   rep.setUsername(rs.getString("username"));
	    	   rep.setTime(rs.getString("time"));
	    	   rep.setCount(rs.getInt("count"));
	    	   rep.setState(rs.getInt("state"));
	    	   list.add(rep);
	    	   
	       }
	       return list;
		 
		 }
	public void addreplenish(String specname,String gname,String sname,String proname,int count,String gunit,String username,String time,int state) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into replenish(specname,gname,sname,proname,count,gunit,username,time,state) values(?,?,?,?,?,?,?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,specname);
	       ps.setString(2,gname);
	       ps.setString(3,sname);
	       ps.setString(4,proname);
	       ps.setInt(5,count);
	       ps.setString(6,gunit);
	       ps.setString(7,username);
	       ps.setString(8,time);
	       ps.setInt(9,state);
	       ps.executeUpdate();
	       return;
		 
		 }
	public void delreplenishById(int id) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="delete from replenish where id=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,id);
	       ps.executeUpdate();
	       return;
		 }
	public void replenishstate(int id) throws SQLException {
		   DBUtil db=new DBUtil();   
	       String sql="update replenish set state=2 where id="+id; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.executeUpdate();
	       return;
		 }
	
	public List<Object> infoList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from info"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   info info=new info();
	    	   info.setId(rs.getInt("id"));
	    	   info.setInfo(rs.getString("info"));
	    	   info.setUsername(rs.getString("username"));
	    	   info.setTime(rs.getString("time"));
	    	   list.add(info);
	    	   
	       }
	       return list;
		 }
	public List<Object> infoListByName(String username) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from info where username like ?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+username+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   info info=new info();
	    	   info.setId(rs.getInt("id"));
	    	   info.setInfo(rs.getString("info"));
	    	   info.setUsername(rs.getString("username"));
	    	   info.setTime(rs.getString("time"));
	    	   list.add(info);
	    	   
	       }
	       return list;
		 
		 }
	public void addinfo(String time,String username,String info) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into info(time,username,info) values(?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,time);
	       ps.setString(2,username);
	       ps.setString(3,info);
	       ps.executeUpdate();
	       return;
		 
		 }
	public void delinfoById(int id) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="delete from info where id=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,id);
	       ps.executeUpdate();
	       return;
		 }
	public void addmessage(String time,String username,String message) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into message(time,username,message) values(?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,time);
	       ps.setString(2,username);
	       ps.setString(3,message);
	       ps.executeUpdate();
	       return;
		 
		 }
	public List<Object> messageListByName(String username) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from message where username=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,username);
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   message message=new message();
	    	   message.setId(rs.getInt("id"));
	    	   message.setMessage(rs.getString("message"));
	    	   message.setUsername(rs.getString("username"));
	    	   message.setTime(rs.getString("time"));
	    	   list.add(message);
	    	   
	       }
	       return list;
		 
		 }
	public List<Object> messageList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from message"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   message message=new message();
	    	   message.setId(rs.getInt("id"));
	    	   message.setMessage(rs.getString("message"));
	    	   message.setUsername(rs.getString("username"));
	    	   message.setTime(rs.getString("time"));
	    	   list.add(message);
	    	   
	       }
	       return list;
		 }
}
