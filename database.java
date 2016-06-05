/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author simbah
 */
public class database {
    private String host="jdbc:oracle:thin:@localhost:1521:xe";
    private String username="system";
    private Connection conn=null;
    private String password ="hr";
    private Statement statement;

    
    public database(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(host,username,password);
            System.out.println("koneksi berhasil");
            
                    } catch(Exception ex){
                        System.out.println("massage"+ex.getMessage());
                    }
    }

    public boolean issconnect(){
        if(conn!=null){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean getClose(){
        if(issconnect()){
        try{
            conn.close();
            conn=null;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return true;
    }else{
            return false;
        } 
    }
    
    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String pass) {
        this.password = password;
    }

    public void setStatement(Statement statement) {
        this.statement = statement;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Statement getStatement() {
        return statement;
    }
    public void executeUpdate(String query) throws SQLException{
        try{
            java.sql.Statement statement=getConn().createStatement();
            java.sql.ResultSet result=statement.executeQuery(query);
            statement.close();
        }catch(Exception ex){
            
        }
        
    }
    public ResultSet login(String username, String pass) throws SQLException{
        Statement statement = conn.createStatement();
        String sql="select username,pasword from mahasiswa_login where username='"+username+"'and password='"+password+"'";
        ResultSet rest = statement.executeQuery(sql);
        return rest;
    }

    public ResultSet mata_kuliah() throws SQLException{
        ResultSet rest2=null;
        
        try{
            System.out.println("Show data");
            String query="select * form mahasiswa";
            statement = conn.createStatement();
            rest2 = statement.executeQuery(query);
            
        }catch(Exception ex){
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rest2;
    }
    
    
}

