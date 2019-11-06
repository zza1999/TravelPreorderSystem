package lib;
//处理房间信息，对应room表
import java.sql.*;
public class RoomData extends Database {

	private int singleRoom = 0;//剩余单间
	private int doubleRoom = 0;//剩余双间
	
	public RoomData() {
		init();
	}
	
	public int getSingleRoom() {
		return singleRoom;
	}

	public int getDoubleRoom() {
		return doubleRoom;
	}

	public void check(String start, String end) throws SQLException {//核算预订区间内可用的房间数
		String sql = String.format("select * from room where isBooked=0 or (start>\"%s\" or end<\"%s\") ",end,start);
		ResultSet res = query(sql);
		while(res.next()){//查询在预订区间外尚未预订的房间
			if(res.getString("type").equals("单人间")) singleRoom++;
			else doubleRoom++;
		}
	}
	
	public int check(int sr, int dr, int count) {//核验用户选择方案是否可行
		if(sr > singleRoom) {
			System.out.printf("单人间不足，剩余%d间\n",singleRoom);
			return 2;
		}else if(dr > doubleRoom) {
			System.out.printf("双人间不足，剩余%d间\n",doubleRoom);
			return 3;
		}else if(sr + 2 * dr < count) {			
			System.out.println("所选方案无法正常满足人数要求");
			return 1;
		}
		System.out.println("所选方案合理");
		return 0;
	}
	
	public String getRooms(int sr, int dr, String start, String end) throws SQLException {//获得分配的房间号
		String rooms = "";
		String sql = String.format("select * from room where isBooked=0 or (start>\"%s\" or end<\"%s\") ",end,start);
		ResultSet res = query(sql);
		int i=sr, j=dr;
		while(res.next()){
			if(i > 0 && res.getString("type").equals("单人间")){
				rooms  += res.getString("id");
				i--;
				if(i + j != 0) rooms += ",";
			}else if(j > 0 && res.getString("type").equals("双人间")){
				rooms += res.getString("id");
				j--;
				if(i + j != 0) rooms += ",";
			}else if(i + j == 0){
				break;
			}
		}
		return rooms;
	}
	
	public void updateRoom(String rooms, String start, String end) {//更新room表信息
		String[] idss = rooms.split(",");
		int[] ids = new int[idss.length];
		for(int k=0; k<idss.length; k++){
			ids[k] = Integer.parseInt(idss[k]);
			String sql = String.format("update room set isBooked=1, start=\"%s\", end=\"%s\" where id=%d;",start,end,ids[k]);
			update(sql);
		}
	}
}
