package lib;
//处理旅馆预订，对应book表
import java.sql.*;
public class BookData extends Database{
	
	private String usrname;
	
	public BookData(String usr) {
		usrname = usr;
		init();
	}
	
	public String info() throws SQLException {//获取当前用户预订信息
		ResultSet res = query("select * from book");
		String str = "";
		while(res.next()){
			if(res.getString("usrname").equals(usrname)){
				str += res.getInt("id")+";"+res.getInt("count")+";"+res.getDate("start")+";"+res.getDate("end")+";"+res.getString("rooms")+"#";
			}
		}
		return str;
	}
	
	public int addBook(int count, String start, String end, String rooms) throws SQLException{//增加预订
		String sql = String.format("insert into book(usrname,count,start,end,rooms) values(\"%s\",\"%d\",\"%s\",\"%s\",\"%s\");",usrname,count,start,end,rooms);
		insert(sql);
		sql = "select max(id) from book;";
		ResultSet res = query(sql);
		res.next();
		return res.getInt(1);
	}
}
