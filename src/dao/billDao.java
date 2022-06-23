package dao;

import java.sql.SQLException;
import java.util.List;

public interface billDao {
	public void addbill(String gcode,String speccode,String scode,String procode,String gunit,String time,String username,String remark,int count) throws SQLException;
	
	public List<Object> replenishList() throws SQLException;
	public List<Object> replenishListByName(String gname) throws SQLException;
	public void addreplenish(String specname,String gname,String sname,String proname,int count,String gunit,String username,String time,int state) throws SQLException;
	public void delreplenishById(int id) throws SQLException;
	public void replenishstate(int id) throws SQLException;
	
	public List<Object> infoList() throws SQLException;
	public List<Object> infoListByName(String username) throws SQLException;
	public void addinfo(String time,String username,String info) throws SQLException;
	public void delinfoById(int id) throws SQLException;
	
	public void addmessage(String time,String username,String message) throws SQLException;
	public List<Object> messageListByName(String username) throws SQLException;
	public List<Object> messageList() throws SQLException;
}
