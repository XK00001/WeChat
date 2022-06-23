package dao;

import java.sql.SQLException;
import java.util.List;


public interface storeDao {
	public List<Object> storeList() throws SQLException;
	public List<Object> storeListByName(String sname) throws SQLException;
	public void delstoreById(int id) throws SQLException;
	public void addstore(String scode,String sname,String speccode,String saddress) throws SQLException;
	public void updatestore(int id,String scode,String sname,String speccode,String saddress) throws SQLException;
	public List<Object> storeList1() throws SQLException;
	public List<Object> storeList1ByName(String sname) throws SQLException;
	public List<Object> store1(String speccode) throws SQLException;
}
