package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import pojo.goods;
import pojo.goodspec;
import util.DBUtil;

public class goodspecDaolmpl implements goodspecDao {
	@Override
	public List<Object> goodspecList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from goodspec"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   goodspec gos=new goodspec();
	    	   gos.setId(rs.getInt("id"));
	    	   gos.setSpeccode(rs.getString("specCode"));
	    	   gos.setSpecname(rs.getString("specName"));
	    	   list.add(gos);
	    	   
	       }
	       return list;
		 }
	public List<Object> goodspecListByName(String specname) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from goodspec where specname like ?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,'%'+specname+'%');
	       ResultSet rs=ps.executeQuery();
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   goodspec gos=new goodspec();
	    	   gos.setId(rs.getInt("id"));
	    	   gos.setSpeccode(rs.getString("specCode"));
	    	   gos.setSpecname(rs.getString("specName"));
	    	   list.add(gos);
	    	   
	       }
	       return list;
		 
		 }
	public void delgoodspecById(int id) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="delete from goodspec where id=?"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setInt(1,id);
	       ps.executeUpdate();
	       return;
		 }
	public void addgoodspec(String speccode,String specname) throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="insert into goodspec (speccode,specname) values(?,?)"; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,speccode);
	       ps.setString(2,specname);
	       ps.executeUpdate();
	       return;
		 
		 }
	public void updategoodspec(int id,String speccode,String specname) throws SQLException {
		   DBUtil db=new DBUtil();   
	       String sql="update goodspec set specCode=?,specName=? where id="+id; 
	       PreparedStatement ps=(PreparedStatement) db.getPreparedStatement(sql);
	       ps.setString(1,speccode);
	       ps.setString(2,specname);
	       ps.executeUpdate();
	       return;
		 }
	public List<Object> specList() throws SQLException {
	       DBUtil db=new DBUtil();   
	       String sql="select * from goodspec"; 
	       Statement st=(Statement) db.getStatement();
	       ResultSet rs=st.executeQuery(sql);
	       List<Object> list=new ArrayList<Object>();
	       while(rs.next()) {
	    	   goodspec gos=new goodspec();
	    	   gos.setSpeccode(rs.getString("specCode"));
	    	   gos.setSpecname(rs.getString("specName"));
	    	   list.add(gos);
	    	   
	       }
	       return list;
		 }
}
