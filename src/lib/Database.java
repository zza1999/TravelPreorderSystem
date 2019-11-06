package lib;

//对数据库增删改查
import java.sql.*;

public class Database {
    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/hotel?serverTimezone=UTC";
    private String user = "root";
    private String password = "000000";
    private Connection con = null;
    private Statement stmt = null;

    public int init() {
        try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("加载驱动失败");
			return 1;
		}
        try {
        	con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("连接数据库失败");
			return 2;
		}
        return 0;
    }

    public ResultSet query(String sql){
        try {
			return stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("查询失败");
			return null;
		}
    }
    
    public void insert(String sql) {
    	try {
			stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("插入失败");
		}
    }
    
    public void update(String sql) {
    	try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("修改失败");
		}
    }
    
    public void delete(String sql) {
    	try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("删除失败");
		}
    }
    
    public void close() {
    	try {
			con.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("断开数据库连接失败");
		}
    }
}