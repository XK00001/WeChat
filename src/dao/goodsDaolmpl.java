package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import pojo.goods;
import pojo.provider;
import util.DBUtil;

public class goodsDaolmpl implements goodsDao {
	@Override
	public List<Object> goodsList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from goods"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   goods goo=new goods();
	    	   goo.setId(rs.getInt("id"));
	    	   goo.setProcode(rs.getString("proCode"));
	    	   goo.setGname(rs.getString("gName"));
	    	   goo.setGunit(rs.getString("gUnit"));
	    	   goo.setGcode(rs.getString("gCode"));
	    	   goo.setSpeccode(rs.getString("specCode"));
	    	   list.add(goo);
	    	   
	       }
	       return list;
		 }
	public List<Object> goodsListByName(String gname) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from goods where gname like ?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+gname+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   goods goo=new goods();
	    	   goo.setId(rs.getInt("id"));
	    	   goo.setProcode(rs.getString("proCode"));
	    	   goo.setGname(rs.getString("gName"));
	    	   goo.setGunit(rs.getString("gUnit"));
	    	   goo.setGcode(rs.getString("gCode"));
	    	   goo.setSpeccode(rs.getString("specCode"));
	    	   list.add(goo);
	    	   
	       }
	       return list;
		 
		 }
	public void delgoodsById(int id) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="delete from goods where id=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,id);
	       ps.executeUpdate();
	       return;
		 }
	public void addgoods(String gcode,String gname,String speccode,String gunit,String procode) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into goods (gCode,gName,specCode,gUnit,proCode) values(?,?,?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,gcode);
	       ps.setString(2,gname);
	       ps.setString(3,speccode);
	       ps.setString(4,gunit);
	       ps.setString(5,procode);
	       ps.executeUpdate();
	       return;
		 
		 }
	public void updategoods(int id,String gcode,String gname,String speccode,String gunit,String procode) throws SQLException {
		   DBUtil db=new DBUtil();   
	       String sql="update goods set gCode=?,gName=?,specCode=?,gUnit=?,proCode=? where id="+id; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,gcode);
	       ps.setString(2,gname);
	       ps.setString(3,speccode);
	       ps.setString(4,gunit);
	       ps.setString(5,procode);
	       ps.executeUpdate();
	       return;
		 }
	public List<Object> goodsList1(String speccode) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from goods where speccode=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,speccode);
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   goods goo=new goods();
	    	   goo.setGname(rs.getString("gName"));
	    	   goo.setGcode(rs.getString("gCode"));
	    	   list.add(goo);
	    	   
	       }
	       return list;
		 
		 }
	public List<Object> gunitlist(String gcode) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from goods where gcode=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,gcode);
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   goods goo=new goods();
	    	   goo.setGunit(rs.getString("gUnit"));
	    	   goo.setGcode(rs.getString("gCode"));
	    	   list.add(goo);
	    	   
	       }
	       return list;
		 
		 }
	public void updatecount(String gcode,int count) throws SQLException {
		   DBUtil db=new DBUtil();   
	       String sql="update goods set count=count+? where gcode=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,count);
	       ps.setString(2,gcode);
	       ps.executeUpdate();
	       return;
		 }
}
