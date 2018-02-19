package appspring;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Tester {
	public String generateMsg() {

		String theMsg = "";

		try {
			String databaseURL = "jdbc:postgresql://";
			databaseURL += System.getenv("POSTGRESQL_SERVICE_HOST");
			databaseURL += "/" + System.getenv("POSTGRESQL_DATABASE");
			String username = System.getenv("POSTGRESQL_USER");
			String password = System.getenv("PGPASSWORD");
			Connection connection = DriverManager.getConnection(databaseURL, username, password);

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