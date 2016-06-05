/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author simbah
 */
public class maindata {
    public static void main(String[] args) throws SQLException {
        database conn2= new database();
        try{
            String query = "select * from mahasiswa_login";
            Statement statement = conn2.getConn().createStatement();
            ResultSet rest3=statement.executeQuery(query);
            while(rest3.next()){
                System.out.println("Username = "+rest3.getString("username"));
                System.out.println("Pasword = "+rest3.getString("password"));
            }
            statement.close();
        }catch(Exception ex){
            System.out.println("massage "+ex.getMessage());
        }
    }
    
}
