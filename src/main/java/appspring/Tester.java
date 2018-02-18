package appspring;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Tester {
	public String generateMsg() {
		
		String theMsg = "";
		
		try { 
			Class.forName("com.mysql.jdbc.Driver");  
			Connection connection=DriverManager.getConnection(  
			"jdbc:mysql://172.30.196.51:3306/EMPLOYEEDB","raman","password");

			if (connection != null) {
				String SQL = "select * from DEPARTMENT LIMIT 1;";
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(SQL);
				while (rs.next()) {
					theMsg = rs.getString("NAME");
				}
				rs.close();
				connection.close();
			}
		} catch (Exception e) {
			return "Database connection problem!";
		}
		return theMsg;
	}
}