<%-- 
    Document   : lihat
    Created on : Jun 6, 2016, 11:48:22 PM
    Author     : simbah
--%>

<%@page import="Model.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DataBaseConnection con = new DataBaseConnection();
        con.getConnection();
        %> 
            <% DataBaseConnection conn = new DataBaseConnection();
                try {
                    String query = "select  * from pilih_makul a, mahasiswa b where username ='145314050' and a.kd_makul = b.kodemakul ";
                    Statement statement = conn.getConnection().createStatement();
                    ResultSet result = statement.executeQuery(query);
            %> 
        <h2 align="center">Daftar Mata Kuliah Yang Tersedia</h2><br>
       
                <%
                        while (result.next()) {%>
                <tr>
                    <td><%=result.getString("kd_makul")%></td>
                      <td><%=result.getString("nama_makul")%></td>
                    
                </tr>
                <% }
                %>
                <%
                        statement.close();
                    } catch (Exception ex) {
                        out.print("messages: " + ex.getMessage());
                    }
                %>
   
        <h1>keep smile</h1>
    </body>
</html>
