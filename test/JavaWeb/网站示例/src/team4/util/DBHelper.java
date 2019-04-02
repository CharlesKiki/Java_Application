package team4.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {
	private static final String driver = "com.mysql.jdbc.Driver"; // ���ݿ�����
	// �������ݿ��URL��ַ
	private static final String url = "jdbc:mysql://localhost:3306/insurance?useUnicode=true&characterEncoding=UTF-8";
	private static final String username = "root";// ���ݿ���û���
	private static final String password = "root";// ���ݿ������

	private static Connection conn = null;

	// ��̬������������
	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ����ģʽ�������ݿ����Ӷ���
	public static Connection getConnection() throws Exception {
		if (conn == null) {
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		} else {
			return conn;
		}

	}

	public static void main(String[] args) {
		try {			
			Connection conn = DBHelper.getConnection();
			if (conn != null) {
				System.out.println("���ݿ�����������");
			} else {
				System.out.println("���ݿ������쳣��");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
