package dao;

import java.sql.SQLException;
import java.util.List;

public interface goodsDao {
	public List<Object> goodsList() throws SQLException;
	public List<Object> goodsListByName(String gname) throws SQLException;
	public void delgoodsById(int id) throws SQLException;
	public void addgoods(String gcode,String gname,String speccode,String gunit,String procode) throws SQLException;
	public void updategoods(int id,String gcode,String gname,String speccode,String gunit,String procode) throws SQLException;
	public List<Object> goodsList1(String speccode) throws SQLException;
	public List<Object> gunitlist(String gcode) throws SQLException;
	public void updatecount(String gcode,int count) throws SQLException;
}
