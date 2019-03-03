package team4.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import team4.dao.InstitutionDAO;
import team4.entity.Institution;
import team4.util.DBHelper;

public class InstitutionDAOImpl implements InstitutionDAO{
	
	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	ResultSet rs = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public boolean addInstitution(Institution c, String username) {
		// TODO �Զ����ɵķ������
		System.out.println("�����ݿ����ҽ�ƻ�����Ϣ");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into institution( ins_ID, name, level, postcode, legal_person_name, legal_person_contact, contact_name, contact, address, notes) value(?,?,?,?,?,?,?,?,?,?);";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c.getIns_ID());
			stmt.setString(2, c.getName());
			stmt.setString(3, c.getLevel());
			stmt.setString(4, c.getPostcode());
			stmt.setString(5, c.getLegal_person_name());
			stmt.setString(6, c.getLegal_person_contact());
			stmt.setString(7, c.getContact_name());
			stmt.setString(8, c.getContact());
			stmt.setString(9, c.getAddress());
			stmt.setString(10, c.getNotes());
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
				stmt2.setString(2, "���");
				stmt2.setString(3, "ҽ�ƻ�����Ϣ��(institution)");
				stmt2.setString(4,  c.getIns_ID());
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
	public boolean updInstitution(Institution c, String username) {
		// TODO �Զ����ɵķ������
		System.out.println("�����ݿ����ҽ�ƻ�����Ϣ");
		
		boolean flag = false;
		boolean flag2 = false;
		try {
			conn = DBHelper.getConnection();
			String sql = "update institution set name=?, level=?, postcode=?, legal_person_name=?, legal_person_contact=?, contact_name=?, contact=?, address=?, notes=? where ins_ID=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, c.getName());
			stmt.setString(2, c.getLevel());
			stmt.setString(3, c.getPostcode());
			stmt.setString(4, c.getLegal_person_name());
			stmt.setString(5, c.getLegal_person_contact());
			stmt.setString(6, c.getContact_name());
			stmt.setString(7, c.getContact());
			stmt.setString(8, c.getAddress());
			stmt.setString(9, c.getNotes());
			stmt.setString(10, c.getIns_ID());
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
				stmt2.setString(2, "����");
				stmt2.setString(3, "ҽ�ƻ�����Ϣ��(institution)");
				stmt2.setString(4,  c.getIns_ID());
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
	public boolean delInstitution(String ins_ID, String username) {
		// TODO �Զ����ɵķ������
		System.out.println("�����ݿ�ɾ��ҽ�ƻ�����Ϣ");
	    Institution f=new Institution();
	    f=getInstitutionById(ins_ID);
		
		boolean flag = false;
		boolean flag2 = false;
	try {
		conn = DBHelper.getConnection();
		String sql = "delete from Institution where ins_ID=?;";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, ins_ID);
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
			stmt2.setString(2, "ɾ��");
			stmt2.setString(3, "ҽ�ƻ�����Ϣ��(Institution)");
			stmt2.setString(4, ins_ID);
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
	public ArrayList<Institution> getAllInstitution() {
		// TODO �Զ����ɵķ������
		ArrayList<Institution> list = new ArrayList<Institution>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Institution;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Institution institution = new Institution();
				institution.setIns_ID(rs.getString("ins_ID"));
				institution.setName(rs.getString("name"));
				institution.setLevel(rs.getString("level"));
				institution.setPostcode(rs.getString("postcode"));
				institution.setLegal_person_name(rs.getString("legal_person_name"));
				institution.setLegal_person_contact(rs.getString("legal_person_contact"));
				institution.setContact_name(rs.getString("contact_name"));
				institution.setContact(rs.getString("contact"));
				institution.setAddress(rs.getString("address"));
				institution.setNotes(rs.getString("notes"));
				list.add(institution);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public int getInstitutionCount() {
		// TODO �Զ����ɵķ������
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Institution";
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
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public ArrayList<Institution> getAllInstitutionPage(int start, int length) {
		// TODO �Զ����ɵķ������
		ArrayList<Institution> list = new ArrayList<Institution>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Institution limit?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, start);
			stmt.setInt(2, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Institution institution = new Institution();
				institution.setIns_ID(rs.getString("ins_ID"));
				institution.setName(rs.getString("name"));
				institution.setLevel(rs.getString("level"));
				institution.setPostcode(rs.getString("postcode"));
				institution.setLegal_person_name(rs.getString("legal_person_name"));
				institution.setLegal_person_contact(rs.getString("legal_person_contact"));
				institution.setContact_name(rs.getString("contact_name"));
				institution.setContact(rs.getString("contact"));
				institution.setAddress(rs.getString("address"));
				institution.setNotes(rs.getString("notes"));
				list.add(institution);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public ArrayList<Institution> getInstitutionByName(String name) {
		// TODO �Զ����ɵķ������
		ArrayList<Institution> list = new ArrayList<Institution>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Institution where name=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Institution institution = new Institution();
				institution.setIns_ID(rs.getString("ins_ID"));
				institution.setName(rs.getString("name"));
				institution.setLevel(rs.getString("level"));
				institution.setPostcode(rs.getString("postcode"));
				institution.setLegal_person_name(rs.getString("legal_person_name"));
				institution.setLegal_person_contact(rs.getString("legal_person_contact"));
				institution.setContact_name(rs.getString("contact_name"));
				institution.setContact(rs.getString("contact"));
				institution.setAddress(rs.getString("address"));
				institution.setNotes(rs.getString("notes"));
				list.add(institution);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public ArrayList<Institution> getInstitutionByNamePage(String name,
			int start, int length) {
		// TODO �Զ����ɵķ������
		ArrayList<Institution> list = new ArrayList<Institution>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Institution where name=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setInt(2, start);
			stmt.setInt(3, length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Institution institution = new Institution();
				institution.setIns_ID(rs.getString("ins_ID"));
				institution.setName(rs.getString("name"));
				institution.setLevel(rs.getString("level"));
				institution.setPostcode(rs.getString("postcode"));
				institution.setLegal_person_name(rs.getString("legal_person_name"));
				institution.setLegal_person_contact(rs.getString("legal_person_contact"));
				institution.setContact_name(rs.getString("contact_name"));
				institution.setContact(rs.getString("contact"));
				institution.setAddress(rs.getString("address"));
				institution.setNotes(rs.getString("notes"));
				list.add(institution);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public int getInstitutionByNameCount(String name) {
		// TODO �Զ����ɵķ������
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Institution where name=?";
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
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public Institution getInstitutionById(String ins_ID) {
		// TODO �Զ����ɵķ������
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Institution where ins_ID=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ins_ID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Institution institution = new Institution();
				institution.setIns_ID(rs.getString("ins_ID"));
				institution.setName(rs.getString("name"));
				institution.setLevel(rs.getString("level"));
				institution.setPostcode(rs.getString("postcode"));
				institution.setLegal_person_name(rs.getString("legal_person_name"));
				institution.setLegal_person_contact(rs.getString("legal_person_contact"));
				institution.setContact_name(rs.getString("contact_name"));
				institution.setContact(rs.getString("contact"));
				institution.setAddress(rs.getString("address"));
				institution.setNotes(rs.getString("notes"));
				return institution;
			}else{
			return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public ArrayList<Institution> getInstitutionByLevel(String level) {
		// TODO �Զ����ɵķ������
		ArrayList<Institution> list = new ArrayList<Institution>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Institution where level=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, level);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Institution institution = new Institution();
				institution.setIns_ID(rs.getString("ins_ID"));
				institution.setName(rs.getString("name"));
				institution.setLevel(rs.getString("level"));
				institution.setPostcode(rs.getString("postcode"));
				institution.setLegal_person_name(rs.getString("legal_person_name"));
				institution.setLegal_person_contact(rs.getString("legal_person_contact"));
				institution.setContact_name(rs.getString("contact_name"));
				institution.setContact(rs.getString("contact"));
				institution.setAddress(rs.getString("address"));
				institution.setNotes(rs.getString("notes"));
				list.add(institution);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public ArrayList<Institution> getInstitutionByLevelPage(String level,
			int start, int length) {
		// TODO �Զ����ɵķ������
		ArrayList<Institution> list = new ArrayList<Institution>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Institution where level=? limit ?,?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, level);
			stmt.setInt(2, start);
			stmt.setInt(3,length);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Institution institution = new Institution();
				institution.setIns_ID(rs.getString("ins_ID"));
				institution.setName(rs.getString("name"));
				institution.setLevel(rs.getString("level"));
				institution.setPostcode(rs.getString("postcode"));
				institution.setLegal_person_name(rs.getString("legal_person_name"));
				institution.setLegal_person_contact(rs.getString("legal_person_contact"));
				institution.setContact_name(rs.getString("contact_name"));
				institution.setContact(rs.getString("contact"));
				institution.setAddress(rs.getString("address"));
				institution.setNotes(rs.getString("notes"));
				list.add(institution);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
	public int getInstitutionByLevelCount(String level) {
		// TODO �Զ����ɵķ������
		try {
			conn = DBHelper.getConnection();
			String sql = "select count(*) from Institution where level=?";
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
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// �ͷ�������
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
