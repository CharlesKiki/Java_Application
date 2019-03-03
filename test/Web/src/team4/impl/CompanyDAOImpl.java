package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import team4.dao.CompanyDAO;
import team4.entity.Company;
import team4.factory.CompanyDAOFactory;
import team4.util.DBHelper;

public class CompanyDAOImpl implements CompanyDAO{
	
	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	ResultSet rs = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public boolean addCompany(Company c, String username) {
		// TODO Auto-generated method stub
		System.out.println("向数据库添加单位信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into company(con_ID,name,address,contact,postcode) value(?,?,?,?,?);";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c.getCon_ID());
			stmt.setString(2, c.getName());
			stmt.setString(3, c.getAddress());
			stmt.setString(4, c.getContact());
			stmt.setString(5, c.getPostcode());
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
				stmt2.setString(3, "单位信息表(company)");
				stmt2.setString(4,  c.getCon_ID());
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
	public boolean updCompany(Company c, String username) {
		// TODO Auto-generated method stub
		System.out.println("向数据库更新单位信息");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "update company set name=?,address=?,contact=?,postcode=? where con_ID=?;";
			stmt = conn.prepareStatement(sql);			
			stmt.setString(1, c.getName());
			stmt.setString(2, c.getAddress());
			stmt.setString(3, c.getContact());
			stmt.setString(4, c.getPostcode());
			stmt.setString(5, c.getCon_ID());
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
				stmt2.setString(3, "单位信息表(company)");
				stmt2.setString(4,  c.getCon_ID());
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
	public boolean delCompany(String con_ID, String username) {
		// TODO Auto-generated method stub
		System.out.println("向数据库删除单位信息");
		
		Company c=new Company();
		CompanyDAO cd=CompanyDAOFactory.getCompanyInstance();
		
		c=cd.getCompanyById(con_ID);
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from company where con_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, con_ID);
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
				stmt2.setString(3, "单位信息表(company)");
				stmt2.setString(4,  c.getCon_ID());
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
	public ArrayList<Company> getAllCompany() {
		// TODO Auto-generated method stub
		ArrayList<Company> list=new ArrayList<Company>();
		
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from company;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				company.setCon_ID(rs.getString("con_ID"));
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setContact(rs.getString("contact"));
				company.setPostcode(rs.getString("postcode"));
				list.add(company);
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
	public ArrayList<Company> getCompanyByName(String name) {
		// TODO Auto-generated method stub
		ArrayList<Company> list=new ArrayList<Company>();
		
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from company where name=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				company.setCon_ID(rs.getString("con_ID"));
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setContact(rs.getString("contact"));
				company.setPostcode(rs.getString("postcode"));
				list.add(company);
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
	public Company getCompanyById(String con_ID) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from company where con_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, con_ID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Company company = new Company();
				company.setCon_ID(rs.getString("con_ID"));
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setContact(rs.getString("contact"));
				company.setPostcode(rs.getString("postcode"));
				return company;
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
	public ArrayList<Company> getAllCompanyPage(int start, int length) {
		// TODO Auto-generated method stub
ArrayList<Company> list=new ArrayList<Company>();
		
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from company limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,start);
			stmt.setInt(2,length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				company.setCon_ID(rs.getString("con_ID"));
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setContact(rs.getString("contact"));
				company.setPostcode(rs.getString("postcode"));
				list.add(company);
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
	public ArrayList<Company> getCompanyByNamePage(String name, int start,
			int length) {
		// TODO Auto-generated method stub
ArrayList<Company> list=new ArrayList<Company>();
		
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from company where name=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setInt(2,start);
			stmt.setInt(3,length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				company.setCon_ID(rs.getString("con_ID"));
				company.setName(rs.getString("name"));
				company.setAddress(rs.getString("address"));
				company.setContact(rs.getString("contact"));
				company.setPostcode(rs.getString("postcode"));
				list.add(company);
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
	public int getCompanyCount() {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from company";
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
	public int getCompanyByNameCount(String name) {
		// TODO Auto-generated method stub
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from company where name=?";
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
