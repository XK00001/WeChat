package dao;

import java.sql.SQLException;
import java.util.List;

public interface goodspecDao {
	public List<Object> goodspecList() throws SQLException;
	public List<Object> goodspecListByName(String specname) throws SQLException;
	public void delgoodspecById(int id) throws SQLException;
	public void addgoodspec(String speccode,String specname) throws SQLException;
	public void updategoodspec(int id,String speccode,String specname) throws SQLException;
	public List<Object> specList() throws SQLException;
}
