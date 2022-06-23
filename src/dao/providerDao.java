package dao;

import java.sql.SQLException;
import java.util.List;

import pojo.provider;

public interface providerDao {
	public List<Object> providerList() throws SQLException;
	public List<Object> providerListByName(String proname) throws SQLException;
	public void delproviderById(int id) throws SQLException;
	public void addprovider(String procode,String proname,String prodesc,String procontact,String prophone,String proaddress) throws SQLException;
	public void updateprovider(int id,String procode,String proname,String prodesc,String procontact,String prophone,String proaddress) throws SQLException;
	public List<Object> prolist1(String speccode) throws SQLException;
}
