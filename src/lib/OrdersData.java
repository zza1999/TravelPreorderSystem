package lib;
//处理订票模拟，对应orders表
import java.sql.*;
public class OrdersData extends Database {

	public boolean check() {//随机数模拟订票是否成功
		return (int)(Math.random()*100) % 2 == 0;
	}
	
	public void addOrder(String usrname, String line, String date) {//增加订票信息
		init();
		String sql = String.format("insert into orders(usrname,line,date) values(\"%s\",\"%s\",\"%s\");",usrname,line,date);
		insert(sql);
		System.out.println("订票信息已保存");
	}
}
