/*
 * Copyright 2016 Len Payne <len.payne@lambtoncollege.ca>.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package dbsample;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.*;

/**
 *
 * @author Len Payne <len.payne@lambtoncollege.ca>
 */
public class DBSample {

    private static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found exception! "
                    + e.getMessage());
        }

        String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
        String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
        String name = "people";
        String url = "jdbc:mysql://" + host + ":" + port + "/" + name;
        String username = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        String password = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
        Connection con = DriverManager.getConnection(url, username, password);
        return con;
    }

    public static String getJSON() {
        String output = "";
        try {
            JsonArray arr = new JsonArray();
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM sample");
            while (rs.next()) {
                JsonObject obj = new JsonObject();
                obj.addProperty("id", rs.getInt("id"));
                obj.addProperty("name", rs.getString("name"));
                obj.addProperty("bio", rs.getString("bio"));
                arr.add(obj);
            }
            output = arr.toString();
            conn.close();
        } catch (SQLException ex) {
            output = "SQL Exception Error: " + ex.getMessage();
        }
        return output;
    }
}
