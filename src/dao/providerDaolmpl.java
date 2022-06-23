package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import pojo.provider;
import util.DBUtil;

public class providerDaolmpl implements providerDao{
	@Override
	public List<Object> providerList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from provider"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   provider pro=new provider();
	    	   pro.setId(rs.getInt("id"));
	    	   pro.setProcode(rs.getString("proCode"));
	    	   pro.setProname(rs.getString("proName"));
	    	   pro.setProdesc(rs.getString("proDesc"));
	    	   pro.setProcontact(rs.getString("proContact"));
	    	   pro.setProphone(rs.getString("proPhone"));
	    	   pro.setProaddress(rs.getString("proAddress"));
	    	   list.add(pro);
	    	   
	       }
	       return list;
		 }
	public List<Object> providerListByName(String proname) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from provider where proname like ?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+proname+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   provider pro=new provider();
	    	   pro.setId(rs.getInt("id"));
	    	   pro.setProcode(rs.getString("proCode"));
	    	   pro.setProname(rs.getString("proName"));
	    	   pro.setProdesc(rs.getString("proDesc"));
	    	   pro.setProcontact(rs.getString("proContact"));
	    	   pro.setProphone(rs.getString("proPhone"));
	    	   pro.setProaddress(rs.getString("proAddress"));
	    	   list.add(pro);
	    	   
	       }
	       return list;
		 
		 }
	public void delproviderById(int id) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="delete from provider where id=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,id);
	       ps.executeUpdate();
	       return;
		 }
	public void addprovider(String procode,String proname,String prodesc,String procontact,String prophone,String proaddress) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into provider (proCode,proName,proDesc,proContact,proPhone,proAddress) values(?,?,?,?,?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,procode);
	       ps.setString(2,proname);
	       ps.setString(3,prodesc);
	       ps.setString(4,procontact);
	       ps.setString(5,prophone);
	       ps.setString(6,proaddress);
	       ps.executeUpdate();
	       return;
		 
		 }
	public void updateprovider(int id,String procode,String proname,String prodesc,String procontact,String prophone,String proaddress) throws SQLException {
		   DBUtil db=new DBUtil();   
	       String sql="update provider set proCode=?,proName=?,proDesc=?,proContact=?,proPhone=?,proAddress=? where id="+id; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,procode);
	       ps.setString(2,proname);
	       ps.setString(3,prodesc);
	       ps.setString(4,procontact);
	       ps.setString(5,prophone);
	       ps.setString(6,proaddress);
	       ps.executeUpdate();
	       return;
		 }
	public List<Object> prolist1(String speccode) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from provider inner join goodspec on provider.proDesc=goodspec.specName where speccode=? "; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,speccode);
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   provider pro=new provider();
	    	   pro.setProcode(rs.getString("proCode"));
	    	   pro.setProname(rs.getString("proName"));
	    	   list.add(pro);
	    	   
	       }
	       return list;
		 
		 }
}
