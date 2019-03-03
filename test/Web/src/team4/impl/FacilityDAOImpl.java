package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import team4.entity.Facility;
import team4.util.DBHelper;
import team4.dao.FacilityDAO;

public class FacilityDAOImpl implements FacilityDAO {

	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	ResultSet rs = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	public boolean addFacility(Facility f,String username) {
		System.out.println("向数据库添加服务设施信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into facility(ser_ID,name,usable_range,notes) value(?,?,?,?);";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, f.getSer_ID());
			stmt.setString(2, f.getName());
			stmt.setString(3, f.getUsable_range());
			stmt.setString(4, f.getNotes());
			stmt.execute();
			flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = false;
			e.printStackTrace();
		}
		
		if (flag) {
			try {
				String sql2 = "insert into log(username,action,table_name,record_ID,record_name,time) value(?,?,?,?,?,?);";
				stmt2 = conn.prepareStatement(sql2);
				stmt2.setString(1, username);
				stmt2.setString(2, "添加");
				stmt2.setString(3, "服务设施信息表(facility)");
				stmt2.setString(4,  f.getSer_ID());
				stmt2.setString(5,  f.getName());
				stmt2.setString(6, df.format(new Date()));
				stmt2.execute();
				flag2 = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				flag2 = false;
				e.printStackTrace();
			}
		}
		return flag2;
	}

	public boolean updFacility(Facility f,String username) {
        System.out.println("向数据库更新服务设施信息");
				
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "update facility set name=?,usable_range=?,notes=? where ser_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, f.getName());
			stmt.setString(2, f.getUsable_range());
			stmt.setString(3, f.getNotes());
			stmt.setString(4, f.getSer_ID());
			stmt.execute();
			flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = false;
			e.printStackTrace();
		}
		if (flag) {
			try {
				
				String record_ID=f.getSer_ID();
				String record_name=f.getName();
				
				String sql2 = "insert into log(username,action,table_name,record_ID,record_name,time) value(?,?,?,?,?,?);";
				stmt2 = conn.prepareStatement(sql2);
				stmt2.setString(1, username);
				stmt2.setString(2, "更新");
				stmt2.setString(3, "服务设施信息表(facility)");
				stmt2.setString(4, record_ID);
				stmt2.setString(5, record_name);
				stmt2.setString(6, df.format(new Date()));
				stmt2.execute();
				flag2 = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				flag2 = false;
				e.printStackTrace();
			}
		}
		return flag2;
	}

	public boolean delFacility(String ser_ID,String username) {
		    System.out.println("向数据库删除服务设施信息");
		    Facility f=new Facility();
		    f=getFacilityById(ser_ID);
			
			boolean flag = false;
			boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from facility where ser_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ser_ID);
			stmt.execute();
			flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = false;
			e.printStackTrace();
		}
		if (flag) {
			try {
				String sql2 = "insert into log(username,action,table_name,record_ID,record_name,time) value(?,?,?,?,?,?);";
				stmt2 = conn.prepareStatement(sql2);
				stmt2.setString(1, username);
				stmt2.setString(2, "删除");
				stmt2.setString(3, "服务设施信息表(facility)");
				stmt2.setString(4, ser_ID);
				stmt2.setString(5, f.getName());
				stmt2.setString(6, df.format(new Date()));
				stmt2.execute();
				flag2 = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				flag2 = false;
				e.printStackTrace();
			}
		}
		return flag2;
	}

	// 获取所有的服务设施信息
	public ArrayList<Facility> getAllFacility() {

		ArrayList<Facility> list = new ArrayList<Facility>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from facility;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Facility facility = new Facility();
				facility.setSer_ID(rs.getString("ser_ID"));
				facility.setName(rs.getString("name"));
				facility.setUsable_range(rs.getString("usable_range"));
				facility.setNotes(rs.getString("notes"));
				list.add(facility);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	// 获取指定条数的服务设施信息
	public ArrayList<Facility> getAllFacilityPage(int start,int length) {

			ArrayList<Facility> list = new ArrayList<Facility>();
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from facility limit ?,?;";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1,start);
				stmt.setInt(2,length);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Facility facility = new Facility();
					facility.setSer_ID(rs.getString("ser_ID"));
					facility.setName(rs.getString("name"));
					facility.setUsable_range(rs.getString("usable_range"));
					facility.setNotes(rs.getString("notes"));
					list.add(facility);
				}
				return list;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			} finally {
				// 释放数据集对象
				if (rs != null) {
					try {
						rs.close();
						rs = null;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

	// 获取特定条数的记录
	public ArrayList<Facility> getFacilityByName(String name) {
		ArrayList<Facility> list = new ArrayList<Facility>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from facility where name=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Facility facility = new Facility();
				facility.setSer_ID(rs.getString("ser_ID"));
				facility.setName(rs.getString("name"));
				facility.setUsable_range(rs.getString("usable_range"));
				facility.setNotes(rs.getString("notes"));
				list.add(facility);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	// 根据编号返回服务设施信息
	public Facility getFacilityById(String ser_ID) {
		
		System.out.println("通过id得到数据库中服务设施信息");
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from facility where ser_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ser_ID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Facility facility = new Facility();
				facility.setSer_ID(rs.getString("ser_ID"));
				facility.setName(rs.getString("name"));
				facility.setUsable_range(rs.getString("usable_range"));
				facility.setNotes(rs.getString("notes"));
				return facility;
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	
	@Override
	public int getFacilityCount() {
		// TODO Auto-generated method stub		
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from facility";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			} else {
				return 0;
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	

	@Override
	public ArrayList<Facility> getFacilityByNamePage(String name, int start,
			int length) {
		// TODO Auto-generated method stub
		ArrayList<Facility> list = new ArrayList<Facility>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from facility where name=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,name);
			stmt.setInt(2,start);
			stmt.setInt(3,length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Facility facility = new Facility();
				facility.setSer_ID(rs.getString("ser_ID"));
				facility.setName(rs.getString("name"));
				facility.setUsable_range(rs.getString("usable_range"));
				facility.setNotes(rs.getString("notes"));
				list.add(facility);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public int getFacilityByNameCount(String name) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from facility where name=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();			
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			} else {
				return 0;
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

}
