package lib;
//��������Ϣ����Ӧroom��
import java.sql.*;
public class RoomData extends Database {

	private int singleRoom = 0;//ʣ�൥��
	private int doubleRoom = 0;//ʣ��˫��
	
	public RoomData() {
		init();
	}
	
	public int getSingleRoom() {
		return singleRoom;
	}

	public int getDoubleRoom() {
		return doubleRoom;
	}

	public void check(String start, String end) throws SQLException {//����Ԥ�������ڿ��õķ�����
		String sql = String.format("select * from room where isBooked=0 or (start>\"%s\" or end<\"%s\") ",end,start);
		ResultSet res = query(sql);
		while(res.next()){//��ѯ��Ԥ����������δԤ���ķ���
			if(res.getString("type").equals("���˼�")) singleRoom++;
			else doubleRoom++;
		}
	}
	
	public int check(int sr, int dr, int count) {//�����û�ѡ�񷽰��Ƿ����
		if(sr > singleRoom) {
			System.out.printf("���˼䲻�㣬ʣ��%d��\n",singleRoom);
			return 2;
		}else if(dr > doubleRoom) {
			System.out.printf("˫�˼䲻�㣬ʣ��%d��\n",doubleRoom);
			return 3;
		}else if(sr + 2 * dr < count) {			
			System.out.println("��ѡ�����޷�������������Ҫ��");
			return 1;
		}
		System.out.println("��ѡ��������");
		return 0;
	}
	
	public String getRooms(int sr, int dr, String start, String end) throws SQLException {//��÷���ķ����
		String rooms = "";
		String sql = String.format("select * from room where isBooked=0 or (start>\"%s\" or end<\"%s\") ",end,start);
		ResultSet res = query(sql);
		int i=sr, j=dr;
		while(res.next()){
			if(i > 0 && res.getString("type").equals("���˼�")){
				rooms  += res.getString("id");
				i--;
				if(i + j != 0) rooms += ",";
			}else if(j > 0 && res.getString("type").equals("˫�˼�")){
				rooms += res.getString("id");
				j--;
				if(i + j != 0) rooms += ",";
			}else if(i + j == 0){
				break;
			}
		}
		return rooms;
	}
	
	public void updateRoom(String rooms, String start, String end) {//����room����Ϣ
		String[] idss = rooms.split(",");
		int[] ids = new int[idss.length];
		for(int k=0; k<idss.length; k++){
			ids[k] = Integer.parseInt(idss[k]);
			String sql = String.format("update room set isBooked=1, start=\"%s\", end=\"%s\" where id=%d;",start,end,ids[k]);
			update(sql);
		}
	}
}
