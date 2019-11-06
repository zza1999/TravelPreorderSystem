package lib;
//处理用户登录，对应login表
import java.sql.*;
public class LoginData extends Database {
	
	private String usrname;
	private String passwd;
	
	public LoginData(String usr, String psd) {
		usrname = usr;
		passwd = psd;
		init();
	}
	
	public int check() throws SQLException {//核验用户名密码
		ResultSet res = query("select usrname,passwd from login");
		while(res.next()) {
			String un = res.getString("usrname");
			String pd = res.getString("passwd");
			if(un.equals(usrname)){
				if(pd.equals(passwd)){
					System.out.println("登录成功"+usrname);
					return 0;//登录成功
				}else{
					System.out.println("用户名密码不匹配");
					return 1;//用户名密码不匹配
				}
			}
		}
		System.out.println("用户不存在");
		return 2;//用户不存在
	}
	
	public int check(String psd) throws SQLException {//核验注册信息
		ResultSet res = query("select usrname from login");
		while(res.next()){
			String un = res.getString("usrname");
			if(usrname.equals(un)){//用户名已存在
				System.out.println("用户名已存在");
				return 1;
			}
		}
		if(passwd.equals(psd)){//两次密码输入相同，注册成功
			System.out.println("注册成功");
			return 0;
		}else{//两次密码输入不同
			System.out.println("两次密码输入不一致");
			return 2;
		}
	}
	
	public void addUser() {//增加用户
		String sql = String.format("insert into login(usrname,passwd) values(\"%s\",\"%s\");",usrname,passwd);
		insert(sql);
		System.out.println("新增用户"+usrname);
	}
}
