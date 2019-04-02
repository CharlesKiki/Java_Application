package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import team4.dao.PersonDAO;
import team4.entity.Person;
import team4.util.DBHelper;

public class PersonDAOImpl implements PersonDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	ResultSet rs = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public boolean addPerson(Person p,String username) {
		// TODO Auto-generated method stub
		System.out.println("向数据库添加人员信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into person(ID_number, name, birthday, sex, nation, reg_cha, reg_pla, cul_stan, pol_sta, mar_sta, resident_f, dep_number,state, per_category, ins_number) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, p.getID_number());
			stmt.setString(2, p.getName());
			stmt.setString(3, p.getBirthday());
			stmt.setString(4, p.getSex());
			stmt.setString(5, p.getNation());
			stmt.setString(6, p.getReg_cha());
			stmt.setString(7, p.getReg_pla());
			stmt.setString(8, p.getCul_stan());
			stmt.setString(9, p.getPol_sta());
			stmt.setString(10, p.getMar_sta());
			stmt.setString(11, p.getResident_f());
			stmt.setString(12, p.getDep_number());
			stmt.setString(13, p.getState());
			stmt.setString(14, p.getPer_category());
			stmt.setString(15, p.getIns_number());
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
				stmt2.setString(3, "人员信息表(person)");
				stmt2.setString(4, p.getID_number());
				stmt2.setString(5, p.getName());
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
	public boolean updPerson(Person p,String username) {
		// TODO Auto-generated method stub
		System.out.println("向数据库更新人员信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "update person set name=?, birthday=?, sex=?, nation=?, reg_cha=?, reg_pla=?, cul_stan=?, pol_sta=?, mar_sta=?, resident_f=?, dep_number=?,state=?, per_category=?, ins_number=? where ID_number=?;";
			stmt = conn.prepareStatement(sql);			
			stmt.setString(1, p.getName());
			stmt.setString(2, p.getBirthday());
			stmt.setString(3, p.getSex());
			stmt.setString(4, p.getNation());
			stmt.setString(5, p.getReg_cha());
			stmt.setString(6, p.getReg_pla());
			stmt.setString(7, p.getCul_stan());
			stmt.setString(8, p.getPol_sta());
			stmt.setString(9, p.getMar_sta());
			stmt.setString(10, p.getResident_f());
			stmt.setString(11, p.getDep_number());
			stmt.setString(12, p.getState());
			stmt.setString(13, p.getPer_category());
			stmt.setString(14, p.getIns_number());
			stmt.setString(15, p.getID_number());
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
				stmt2.setString(3, "人员信息表(person)");
				stmt2.setString(4, p.getID_number());
				stmt2.setString(5, p.getName());
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
	public boolean delPerson(String ID_number,String username) {
		
		// TODO Auto-generated method stub
        System.out.println("向数据库删除人员信息");
        
        Person p=new Person();
        p=getPersonById(ID_number);
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from person where ID_number=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ID_number);
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
				stmt2.setString(3, "人员信息表(person)");
				stmt2.setString(4, ID_number);
				stmt2.setString(5, p.getName());
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
	public ArrayList<Person> getAllPerson() {
		// TODO Auto-generated method stub
		ArrayList<Person> list = new ArrayList<Person>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from person;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Person person = new Person();
				person.setID_number(rs.getString("ID_number"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setSex(rs.getString("sex"));
				person.setNation(rs.getString("nation"));
				person.setReg_cha(rs.getString("reg_cha"));
				person.setReg_pla(rs.getString("reg_pla"));
				person.setCul_stan(rs.getString("cul_stan"));
				person.setPol_sta(rs.getString("pol_sta"));
				person.setMar_sta(rs.getString("mar_sta"));
				person.setResident_f(rs.getString("resident_f"));
				person.setDep_number(rs.getString("dep_number"));
				person.setState(rs.getString("state"));
				person.setPer_category(rs.getString("per_category"));
				person.setIns_number(rs.getString("ins_number"));
				list.add(person);
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
	public ArrayList<Person> getPersonByName(String name) {
		// TODO Auto-generated method stub
		ArrayList<Person> list = new ArrayList<Person>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from person where name=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Person person = new Person();
				person.setID_number(rs.getString("ID_number"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setSex(rs.getString("sex"));
				person.setNation(rs.getString("nation"));
				person.setReg_cha(rs.getString("reg_cha"));
				person.setReg_pla(rs.getString("reg_pla"));
				person.setCul_stan(rs.getString("cul_stan"));
				person.setPol_sta(rs.getString("pol_sta"));
				person.setMar_sta(rs.getString("mar_sta"));
				person.setResident_f(rs.getString("resident_f"));
				person.setDep_number(rs.getString("dep_number"));
				person.setState(rs.getString("state"));
				person.setPer_category(rs.getString("per_category"));
				person.setIns_number(rs.getString("ins_number"));
				list.add(person);
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
	public Person getPersonById(String ID_number) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from person where ID_number=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ID_number);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Person person = new Person();
				person.setID_number(rs.getString("ID_number"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setSex(rs.getString("sex"));
				person.setNation(rs.getString("nation"));
				person.setReg_cha(rs.getString("reg_cha"));
				person.setReg_pla(rs.getString("reg_pla"));
				person.setCul_stan(rs.getString("cul_stan"));
				person.setPol_sta(rs.getString("pol_sta"));
				person.setMar_sta(rs.getString("mar_sta"));
				person.setResident_f(rs.getString("resident_f"));
				person.setDep_number(rs.getString("dep_number"));
				person.setState(rs.getString("state"));
				person.setPer_category(rs.getString("per_category"));
				person.setIns_number(rs.getString("ins_number"));
				return person;
			}else {
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
	public int getPersonCount() {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from person;";
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
	public ArrayList<Person> getAllPersonPage(int start, int length) {
		// TODO Auto-generated method stub
		ArrayList<Person> list = new ArrayList<Person>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from person limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, start);
			stmt.setInt(2, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Person person = new Person();
				person.setID_number(rs.getString("ID_number"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setSex(rs.getString("sex"));
				person.setNation(rs.getString("nation"));
				person.setReg_cha(rs.getString("reg_cha"));
				person.setReg_pla(rs.getString("reg_pla"));
				person.setCul_stan(rs.getString("cul_stan"));
				person.setPol_sta(rs.getString("pol_sta"));
				person.setMar_sta(rs.getString("mar_sta"));
				person.setResident_f(rs.getString("resident_f"));
				person.setDep_number(rs.getString("dep_number"));
				person.setState(rs.getString("state"));
				person.setPer_category(rs.getString("per_category"));
				person.setIns_number(rs.getString("ins_number"));
				list.add(person);
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
	public int getPersonByNameCount(String name) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from person where name=?;";
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
	public ArrayList<Person> getPersonByNamePage(String name, int start,
			int length) {
		// TODO Auto-generated method stub
		ArrayList<Person> list = new ArrayList<Person>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from person where name=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Person person = new Person();
				person.setID_number(rs.getString("ID_number"));
				person.setName(rs.getString("name"));
				person.setBirthday(rs.getString("birthday"));
				person.setSex(rs.getString("sex"));
				person.setNation(rs.getString("nation"));
				person.setReg_cha(rs.getString("reg_cha"));
				person.setReg_pla(rs.getString("reg_pla"));
				person.setCul_stan(rs.getString("cul_stan"));
				person.setPol_sta(rs.getString("pol_sta"));
				person.setMar_sta(rs.getString("mar_sta"));
				person.setResident_f(rs.getString("resident_f"));
				person.setDep_number(rs.getString("dep_number"));
				person.setState(rs.getString("state"));
				person.setPer_category(rs.getString("per_category"));
				person.setIns_number(rs.getString("ins_number"));
				list.add(person);
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
