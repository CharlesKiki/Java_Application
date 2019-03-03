package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import team4.dao.DiseaseDAO;
import team4.entity.Disease;
import team4.util.DBHelper;

public class DiseaseDAOImpl implements DiseaseDAO{
	
	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	ResultSet rs = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public boolean addDisease(Disease c, String username) {
		// TODO 自动生成的方法存根
		System.out.println("向数据库添加病种信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into disease( dis_ID, name, flag, notes) value(?,?,?,?);";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c.getDis_ID());
			stmt.setString(2, c.getName());
			stmt.setString(3, c.getFlag());
			stmt.setString(4, c.getNotes());
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
				stmt2.setString(3, "病种信息表(disease)");
				stmt2.setString(4,  c.getDis_ID());
				stmt2.setString(5,  c.getName());
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

	@Override
	public boolean updDisease(Disease c, String username) {
		// TODO 自动生成的方法存根
		System.out.println("向数据库更新病种信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "update disease set name=?, flag=?, notes=? where dis_ID=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c.getName());
			stmt.setString(2, c.getFlag());
			stmt.setString(3, c.getNotes());
			stmt.setString(4, c.getDis_ID());
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
				stmt2.setString(2, "更新");
				stmt2.setString(3, "病种信息表(disease)");
				stmt2.setString(4,  c.getDis_ID());
				stmt2.setString(5,  c.getName());
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

	@Override
	public boolean delDisease(String dis_ID, String username) {
		// TODO 自动生成的方法存根
		System.out.println("向数据库删除病种信息");
		Disease f=new Disease();
	    f=getDiseaseById(dis_ID);
		
		boolean flag = false;
		boolean flag2 = false;
	try {
		conn = DBHelper.getConnection();
		String sql = "delete from Disease where dis_ID=?;";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, dis_ID);
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
			stmt2.setString(3, "病种信息表(Disease)");
			stmt2.setString(4, dis_ID);
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

	@Override
	public ArrayList<Disease> getAllDisease() {
		// TODO 自动生成的方法存根
		ArrayList<Disease> list = new ArrayList<Disease>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Disease;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Disease Disease = new Disease();
				Disease.setDis_ID(rs.getString("dis_ID"));
				Disease.setName(rs.getString("name"));
				Disease.setFlag(rs.getString("flag"));
				Disease.setNotes(rs.getString("notes"));
				list.add(Disease);
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
	public int getDiseaseCount() {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Disease";
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
	public ArrayList<Disease> getAllDiseasePage(int start, int length) {
		// TODO 自动生成的方法存根
		ArrayList<Disease> list = new ArrayList<Disease>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Disease limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, start);
			stmt.setInt(2, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Disease Disease = new Disease();
				Disease.setDis_ID(rs.getString("dis_ID"));
				Disease.setName(rs.getString("name"));
				Disease.setFlag(rs.getString("flag"));
				Disease.setNotes(rs.getString("notes"));
				list.add(Disease);
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
	public ArrayList<Disease> getDiseaseByName(String name) {
		// TODO 自动生成的方法存根
		ArrayList<Disease> list = new ArrayList<Disease>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Disease where name=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Disease Disease = new Disease();
				Disease.setDis_ID(rs.getString("dis_ID"));
				Disease.setName(rs.getString("name"));
				Disease.setFlag(rs.getString("flag"));
				Disease.setNotes(rs.getString("notes"));
				list.add(Disease);
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
	public ArrayList<Disease> getDiseaseByNamePage(String name, int start,
			int length) {
		// TODO 自动生成的方法存根
		ArrayList<Disease> list = new ArrayList<Disease>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Disease where name=?limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Disease Disease = new Disease();
				Disease.setDis_ID(rs.getString("dis_ID"));
				Disease.setName(rs.getString("name"));
				Disease.setFlag(rs.getString("flag"));
				Disease.setNotes(rs.getString("notes"));
				list.add(Disease);
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
	public int getDiseaseByNameCount(String name) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Disease where name=?";
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

	@Override
	public Disease getDiseaseById(String dis_ID) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Disease where dis_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, dis_ID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Disease Disease = new Disease();
				Disease.setDis_ID(rs.getString("dis_ID"));
				Disease.setName(rs.getString("name"));
				Disease.setFlag(rs.getString("flag"));
				Disease.setNotes(rs.getString("notes"));
				return Disease;
			}else{
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

}
