package lib;
//����Ʊģ�⣬��Ӧorders��
import java.sql.*;
public class OrdersData extends Database {

	public boolean check() {//�����ģ�ⶩƱ�Ƿ�ɹ�
		return (int)(Math.random()*100) % 2 == 0;
	}
	
	public void addOrder(String usrname, String line, String date) {//���Ӷ�Ʊ��Ϣ
		init();
		String sql = String.format("insert into orders(usrname,line,date) values(\"%s\",\"%s\",\"%s\");",usrname,line,date);
		insert(sql);
		System.out.println("��Ʊ��Ϣ�ѱ���");
	}
}
