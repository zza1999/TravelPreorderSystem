package lib;
//�����ù�Ԥ������Ӧbook��
import java.sql.*;
public class BookData extends Database{
	
	private String usrname;
	
	public BookData(String usr) {
		usrname = usr;
		init();
	}
	
	public String info() throws SQLException {//��ȡ��ǰ�û�Ԥ����Ϣ
		ResultSet res = query("select * from book");
		String str = "";
		while(res.next()){
			if(res.getString("usrname").equals(usrname)){
				str += res.getInt("id")+";"+res.getInt("count")+";"+res.getDate("start")+";"+res.getDate("end")+";"+res.getString("rooms")+"#";
			}
		}
		return str;
	}
	
	public int addBook(int count, String start, String end, String rooms) throws SQLException{//����Ԥ��
		String sql = String.format("insert into book(usrname,count,start,end,rooms) values(\"%s\",\"%d\",\"%s\",\"%s\",\"%s\");",usrname,count,start,end,rooms);
		insert(sql);
		sql = "select max(id) from book;";
		ResultSet res = query(sql);
		res.next();
		return res.getInt(1);
	}
}
