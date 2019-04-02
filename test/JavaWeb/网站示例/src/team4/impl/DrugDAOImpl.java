package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import team4.dao.DrugDAO;
import team4.entity.Drug;
import team4.util.DBHelper;

public class DrugDAOImpl implements DrugDAO{
	
	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	ResultSet rs = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public boolean addDrug(Drug c, String username) {
		// TODO 自动生成的方法存根
		System.out.println("向数据库添加药品信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into drug(  drug_ID,  name_ch,  name_en, flag,  level,  ins_level,  hos_level, app_flag,  max_price,  form,  measure,drug_usage,  times,  standard,  days,drug_factory,  state,  usable_range,national_coding,  origin,  notes) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c.getDrug_ID());
			stmt.setString(2, c.getName_ch());
			stmt.setString(3, c.getName_en());
			stmt.setString(4, c.getFlag());
			stmt.setString(5, c.getLevel());
			stmt.setString(6, c.getIns_level());
			stmt.setString(7, c.getHos_level());
			stmt.setString(8, c.getApp_flag());
			stmt.setString(9, c.getMax_price());
			stmt.setString(10,c.getForm());
			stmt.setString(11,c.getMeasure());
			stmt.setString(12,c.getUsage());
			stmt.setString(13, c.getTimes());
			stmt.setString(14, c.getStandard());
			stmt.setString(15,c.getDays());
			stmt.setString(16,c.getDrug_factory());
			stmt.setString(17,c.getState());
			stmt.setString(18,c.getUsable_range());
			stmt.setString(19, c.getNational_coding());
			stmt.setString(20, c.getOrigin());
			stmt.setString(21, c.getNotes());
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
				stmt2.setString(3, "药品信息表(disease)");
				stmt2.setString(4,  c.getDrug_ID());
				stmt2.setString(5,  c.getName_ch());
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
	public boolean updDrug(Drug c, String username) {
		// TODO 自动生成的方法存根
		System.out.println("向数据库更新药品信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "update drug set name_ch=?, name_en=?, type=?, flag=?, level=?, ins_level=?, hos_level=?,app_flag=?, max_price=?, form=?, measure=?,drug_usage=?, times=?, standard=?, days=?,drug_factory=?, state=?,usable_range=?,national_coding=?,  origin=?,  notes=? where drug_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c.getName_ch());
			stmt.setString(2, c.getName_en());
			stmt.setString(3, "药品");
			stmt.setString(4, c.getFlag());
			stmt.setString(5, c.getLevel());
			stmt.setString(6, c.getIns_level());
			stmt.setString(7, c.getHos_level());
			stmt.setString(8, c.getApp_flag());
			stmt.setString(9, c.getMax_price());
			stmt.setString(10,c.getForm());
			stmt.setString(11,c.getMeasure());
			stmt.setString(12,c.getUsage());
			stmt.setString(13, c.getTimes());
			stmt.setString(14, c.getStandard());
			stmt.setString(15,c.getDays());
			stmt.setString(16,c.getDrug_factory());
			stmt.setString(17,c.getState());
			stmt.setString(18,c.getUsable_range());
			stmt.setString(19, c.getNational_coding());
			stmt.setString(20, c.getOrigin());
			stmt.setString(21, c.getNotes());
			stmt.setString(22, c.getDrug_ID());
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
				stmt2.setString(3, "药品信息表(disease)");
				stmt2.setString(4,  c.getDrug_ID());
				stmt2.setString(5,  c.getName_ch());
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
	public boolean delDrug(String drug_ID, String username) {
		// TODO 自动生成的方法存根
		System.out.println("向数据库删除药品信息");
	    Drug f=new Drug();
	    f=getDrugById(drug_ID);
		
		boolean flag = false;
		boolean flag2 = false;
	try {
		conn = DBHelper.getConnection();
		String sql = "delete from Drug where drug_ID=?;";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, drug_ID);
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
			stmt2.setString(3, "药品信息表(Drug)");
			stmt2.setString(4, drug_ID);
			stmt2.setString(5, f.getName_ch());
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
	public ArrayList<Drug> getAllDrug() {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public int getDrugCount() {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Drug";
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
	public ArrayList<Drug> getAllDrugPage(int start, int length) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, start);
			stmt.setInt(2, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public ArrayList<Drug> getDrugByNameCh(String name_ch) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where name_ch=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name_ch);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public ArrayList<Drug> getDrugByNameChPage(String name_ch, int start,
			int length) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where name_ch=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name_ch);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public int getDrugByNameChCount(String name_ch) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Drug where name_ch=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name_ch);
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
	public Drug getDrugById(String drug_ID) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where drug_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, drug_ID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				return Drug;
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

	@Override
	public ArrayList<Drug> getDrugByLevel(String level) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where level=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, level);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public ArrayList<Drug> getDrugByLevelPage(String level, int start,
			int length) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where level=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, level);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public int getDrugByLevelCount(String level) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Drug where level=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, level);
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
	public ArrayList<Drug> getDrugByInsLevel(String ins_level) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where ins_level=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ins_level);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public ArrayList<Drug> getDrugByInsLevelPage(String ins_level, int start,
			int length) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where ins_level=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ins_level);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public int getDrugByInsLevelCount(String ins_level) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Drug where ins_level=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ins_level);
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
	public ArrayList<Drug> getDrugByDrugFactory(String drug_factory) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where drug_factory=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, drug_factory);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public ArrayList<Drug> getDrugByDrugFactoryPage(String drug_factory,
			int start, int length) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where drug_factory=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, drug_factory);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public int getDrugByDrugFactoryCount(String drug_factory) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Drug where drug_factory=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, drug_factory);
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
	public ArrayList<Drug> getDrugByCoding(String coding) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where national_coding=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, coding);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public ArrayList<Drug> getDrugByCodingPage(String coding, int start,
			int length) {
		// TODO 自动生成的方法存根
		ArrayList<Drug> list = new ArrayList<Drug>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Drug where national_coding=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, coding);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Drug Drug = new Drug();
				Drug.setDrug_ID(rs.getString("drug_ID"));
				Drug.setName_ch(rs.getString("name_ch"));
				Drug.setName_en(rs.getString("name_en"));
				Drug.setType(rs.getString("type"));
				Drug.setFlag(rs.getString("flag"));
				Drug.setLevel(rs.getString("level"));
				Drug.setIns_level(rs.getString("ins_level"));
				Drug.setHos_level(rs.getString("hos_level"));
				Drug.setApp_flag(rs.getString("app_flag"));
				Drug.setMax_price(rs.getString("max_price"));
				Drug.setForm(rs.getString("form"));
				Drug.setMeasure(rs.getString("measure"));
				Drug.setUsage(rs.getString("drug_usage"));
				Drug.setTimes(rs.getString("times"));
				Drug.setStandard(rs.getString("standard"));
				Drug.setDays(rs.getString("days"));
				Drug.setDrug_factory(rs.getString("drug_factory"));
				Drug.setState(rs.getString("state"));
				Drug.setNational_coding(rs.getString("national_coding"));
				Drug.setOrigin(rs.getString("origin"));
				Drug.setUsable_range(rs.getString("usable_range"));
				Drug.setNotes(rs.getString("notes"));
				list.add(Drug);
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
	public int getDrugByCodingCount(String coding) {
		// TODO 自动生成的方法存根
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Drug where national_coding=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, coding);
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
