package lib;
//�����û���¼����Ӧlogin��
import java.sql.*;
public class LoginData extends Database {
	
	private String usrname;
	private String passwd;
	
	public LoginData(String usr, String psd) {
		usrname = usr;
		passwd = psd;
		init();
	}
	
	public int check() throws SQLException {//�����û�������
		ResultSet res = query("select usrname,passwd from login");
		while(res.next()) {
			String un = res.getString("usrname");
			String pd = res.getString("passwd");
			if(un.equals(usrname)){
				if(pd.equals(passwd)){
					System.out.println("��¼�ɹ�"+usrname);
					return 0;//��¼�ɹ�
				}else{
					System.out.println("�û������벻ƥ��");
					return 1;//�û������벻ƥ��
				}
			}
		}
		System.out.println("�û�������");
		return 2;//�û�������
	}
	
	public int check(String psd) throws SQLException {//����ע����Ϣ
		ResultSet res = query("select usrname from login");
		while(res.next()){
			String un = res.getString("usrname");
			if(usrname.equals(un)){//�û����Ѵ���
				System.out.println("�û����Ѵ���");
				return 1;
			}
		}
		if(passwd.equals(psd)){//��������������ͬ��ע��ɹ�
			System.out.println("ע��ɹ�");
			return 0;
		}else{//�����������벻ͬ
			System.out.println("�����������벻һ��");
			return 2;
		}
	}
	
	public void addUser() {//�����û�
		String sql = String.format("insert into login(usrname,passwd) values(\"%s\",\"%s\");",usrname,passwd);
		insert(sql);
		System.out.println("�����û�"+usrname);
	}
}
