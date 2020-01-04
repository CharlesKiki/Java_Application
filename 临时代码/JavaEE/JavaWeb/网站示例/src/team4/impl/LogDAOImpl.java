package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import team4.dao.LogDAO;
import team4.entity.AdminLog;
import team4.util.DBHelper;

public class LogDAOImpl implements LogDAO{
	
	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	ResultSet rs = null;

	@Override
	public ArrayList<AdminLog> getAllLog() {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogByUser(String username) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where username=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogByAction(String action) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where action=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogByTime(String time) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, time);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogFromTo(String fromtime, String totime) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time>=? and time<=? order by time;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fromtime);
			stmt.setString(2, totime);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getAllLogDay(String time) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, time);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getAllLogFromTo(String fromtime, String totime) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time>=? and time<=? order by time;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fromtime);
			stmt.setString(2, totime);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogByUserDay(String username, String time) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where username=? and time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, time);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogByUserFromTo(String username,
			String fromtime, String totime) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where username=? and time>=? and time<=? order by time;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, fromtime);
			stmt.setString(3, totime);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogByActionDay(String action, String time) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where action=? and time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			stmt.setString(2, time);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public ArrayList<AdminLog> getLogByActionFromTo(String action,
			String fromtime, String totime) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where action=? and time>=? and time<=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			stmt.setString(2, fromtime);
			stmt.setString(3, totime);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getAllLogCount() {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getAllLogPage(int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, start);
			stmt.setInt(2, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getAllLogDayCount(String time) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, time);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getAllLogDayPage(String time, int start,
			int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, time);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getAllLogFromToCount(String fromtime, String totime) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where time>=? and time<=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fromtime);
			stmt.setString(2, totime);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getAllLogFromToPage(String fromtime,
			String totime, int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time>=? and time<=? order by time limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fromtime);
			stmt.setString(2, totime);
			stmt.setInt(3, start);
			stmt.setInt(4, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogByUserCount(String username) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where username=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogByUserPage(String username, int start,
			int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where username=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogByUserDayCount(String username, String time) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where username=? and time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, time);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogByUserDayPage(String username,
			String time, int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where username=? and time=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, time);
			stmt.setInt(3,start);
			stmt.setInt(4, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogByUserFromToCount(String username, String fromtime,
			String totime) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where username=? and time>=? and time<=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, fromtime);
			stmt.setString(3, totime);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogByUserFromToPage(String username,
			String fromtime, String totime, int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where username=? and time>=? and time<=? order by time limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, fromtime);
			stmt.setString(3, totime);
			stmt.setInt(4,start);
			stmt.setInt(5, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogByActionCount(String action) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where action=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogByActionPage(String action, int start,
			int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where action=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogByActionDayCount(String action, String time) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where action=? and time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			stmt.setString(2, time);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogByActionDayPage(String action,
			String time, int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where action=? and time=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			stmt.setString(2, time);
			stmt.setInt(3, start);
			stmt.setInt(4, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogByActionFromToCount(String action, String fromtime,
			String totime) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where action=? and time>=? and time<=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			stmt.setString(2, fromtime);
			stmt.setString(3, totime);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogByActionFromToPage(String action,
			String fromtime, String totime, int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where action=? and time>=? and time<=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, action);
			stmt.setString(2, fromtime);
			stmt.setString(3, totime);
			stmt.setInt(4, start);
			stmt.setInt(5, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogByTimeCount(String time) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where time=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, time);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogByTimePage(String time, int start,
			int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, time);
			stmt.setInt(2, start);
			stmt.setInt(3,length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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
	public int getLogFromToCount(String fromtime, String totime) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from log where time>=? and time<=? ;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fromtime);
			stmt.setString(2, totime);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int count=rs.getInt(1);
				return count;
			}else{
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
	public ArrayList<AdminLog> getLogFromToPage(String fromtime, String totime,
			int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<AdminLog> list=new ArrayList<AdminLog>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from log where time>=? and time<=? order by time limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fromtime);
			stmt.setString(2, totime);
			stmt.setInt(3, start);
			stmt.setInt(4,length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				AdminLog log= new AdminLog();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setAction(rs.getString("action"));
				log.setTable_name(rs.getString("table_name"));
				log.setRecord_ID(rs.getString("record_ID"));
				log.setRecord_name(rs.getString("record_name"));
				log.setTime(rs.getString("time"));
				list.add(log);
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

}
