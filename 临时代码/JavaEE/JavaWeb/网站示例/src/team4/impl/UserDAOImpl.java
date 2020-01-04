package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import team4.dao.UserDao;
import team4.entity.User;
import team4.util.DBHelper;

public class UserDAOImpl implements UserDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	public boolean updUser(User u) {
		boolean flag = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "update user set password=? where username=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, u.getPassword());
			stmt.setString(2, u.getUsername());
			stmt.execute();
			flag = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	public User getUserByName(String name) {
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from user where username=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			if (rs.next()) {
				User u = new User();
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setFlag(rs.getString("flag"));
				return u;
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
