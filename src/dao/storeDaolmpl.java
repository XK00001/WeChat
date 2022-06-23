package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import pojo.store;
import pojo.storelook;
import util.DBUtil;

public class storeDaolmpl implements storeDao {
	   @Override
	   public List<Object> storeList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from store"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   store sto1=new store();
	    	   sto1.setId(rs.getInt("id"));
	    	   sto1.setScode(rs.getString("sCode"));
	    	   sto1.setSname(rs.getString("sName"));
	    	   sto1.setSpeccode(rs.getString("specCode"));
	    	   sto1.setSaddress(rs.getString("sAddress"));
	    	   list.add(sto1);
	       }
	       return list;
		 
		 }
	   public List<Object> storeListByName(String sname) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from store where sname like ?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+sname+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   store sto1=new store();
	    	   sto1.setId(rs.getInt("id"));
	    	   sto1.setScode(rs.getString("sCode"));
	    	   sto1.setSname(rs.getString("sName"));
	    	   sto1.setSpeccode(rs.getString("specCode"));
	    	   sto1.setSaddress(rs.getString("sAddress"));
	    	   list.add(sto1);
	       }
	       return list;
		 
		 }
	   public void delstoreById(int id) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="delete from store where id=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,id);
	       ps.executeUpdate();
	       return;
		 }
	   public void addstore(String scode,String sname,String speccode,String saddress) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into store (scode,sname,speccode,saddress) values(?,?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,scode);
	       ps.setString(2,sname);
	       ps.setString(3,speccode);
	       ps.setString(4,saddress);
	       ps.executeUpdate();
	       return;
		 
		 }
	   public void updatestore(int id,String scode,String sname,String speccode,String saddress) throws SQLException {
		   DBUtil db=new DBUtil();   
	       String sql="update store set scode=?,sname=?,speccode=?,saddress=? where id="+id; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,scode);
	       ps.setString(2,sname);
	       ps.setString(3,speccode);
	       ps.setString(4,saddress);
	       ps.executeUpdate();
	       return;
		 }
	   public List<Object> storeList1() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from store inner join goodspec on store.specCode=goodspec.specCode inner join goods on goodspec.specCode=goods.specCode order by sName"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   storelook stk1=new storelook();
	    	   stk1.setSname(rs.getString("sName"));
	    	   stk1.setSaddress(rs.getString("sAddress"));
	    	   stk1.setSpecname(rs.getString("specName"));
	    	   stk1.setGname(rs.getString("gName"));
	    	   stk1.setCount(rs.getInt("count"));
	    	   stk1.setGunit(rs.getString("gunit"));
	    	   list.add(stk1);
	       }
	       return list;
		 
		 }
	   public List<Object> storeList1ByName(String sname) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from store inner join goodspec on store.specCode=goodspec.specCode inner join goods on goodspec.specCode=goods.specCode where sName like ? order by sName"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+sname+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   storelook stk1=new storelook();
	    	   stk1.setSname(rs.getString("sName"));
	    	   stk1.setSaddress(rs.getString("sAddress"));
	    	   stk1.setSpecname(rs.getString("specName"));
	    	   stk1.setGname(rs.getString("gName"));
	    	   stk1.setCount(rs.getInt("count"));
	    	   stk1.setGunit(rs.getString("gunit"));
	    	   list.add(stk1);
	       }
	       return list;
	       
		 }
	   public List<Object> store1(String speccode) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from store where speccode=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,speccode);
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   store sto1=new store();
	    	   sto1.setScode(rs.getString("sCode"));
	    	   sto1.setSname(rs.getString("sName"));
	    	   list.add(sto1);
	       }
	       return list;
		 
		 }
}
