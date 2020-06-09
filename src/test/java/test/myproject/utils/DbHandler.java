//This class is only use for MySQL Database ##########################################################3

package test.myproject.utils;
import test.myproject.base.TestBase;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbHandler extends TestBase{

    private static String dbUrl;
    private static String dbUsername;
    private static String dbPassword;
    private static Connection con;
    private static Statement stm;
    private List<Map<String, Object>> lastQueryResult;

    private void initConnection() throws  ClassNotFoundException, SQLException{
        dbUrl = prop.getProperty("dbUrl");
        dbUsername = prop.getProperty("db.username");
        dbPassword = prop.getProperty("db.password");
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
        stm = con.createStatement();
    }

    public void exe_select(String query) throws SQLException, ClassNotFoundException {
        this.initConnection();
        try{
            ResultSet rs = stm.executeQuery(query);
            this.lastQueryResult = resultSetToList(rs);
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
                con.close();
            }
        }
    }

    public List<Map<String, Object>> getLastQueryResult(){
        return this.lastQueryResult;
    }

    private List<Map<String, Object>> resultSetToList(ResultSet rs) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int columns = md.getColumnCount();
        List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
        while (rs.next()){
            Map<String, Object> row = new HashMap<String, Object>(columns);
            for(int i = 1; i <= columns; ++i){
                row.put(md.getColumnName(i), rs.getObject(i));
            }
            rows.add(row);
        }
        return rows;
    }
}
