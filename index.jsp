<%-- 
    Document   : index
    Created on : Jun 3, 2016, 3:25:51 PM
    Author     : simbah
--%>
<%@page import="connect.database" %>
<%@page  import="java.sql.ResultSet" %>
<%@page  import="java.sql.Statement" %>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="POST">
            <table>
                <tr>
                    <td> Mata kuliah :   
                    </td>
                            <td> <select name="makul">
                                    <option value="kosong"> pilih mata kuliah </option>
                                        <% 
                                            String nama_makul = request.getParameter("nama_makul");
                                            database conn=new database();
                                        conn.getConn();
                                            try{
                                            String query = "select * from mahasiswa";
                                            Statement ss = conn.getConn().createStatement();
                                            ResultSet rs = ss.executeQuery(query);
                                            while( rs.next()){
                                                out.print("<option value ='"+rs.getString("nama_makul")+"'>"+rs.getString("nama_makul")+"</option>" );
                                            }
                                            
                                            }catch(Exception ex){
                                           
                                        }
                                            
                                            
                                            %>
                                        
                                   
                           </select>
                    </td>
                </tr>
                <td><input type="submit" name="submit" value="view"/>
            </table>
        </form>
            <table border ="1">
                <tr>
                    <td>
                        OPTION
                    </td>
                    <td>
                    Kode Mata Kuliah
                </td>
                <td>
                    Mata Kuliah
                </td>
                <td>
                    SKS
                </td>
                <td>
                    DOSEN PENGAMPU
                </td>
                <td>
                    JAM 
                </td>
                <td>
                    HARI
                </td>
                    </tr>
                    <tr>
                    <% try{
                        String query2="select * from mahasiswa where nama_makul = '"+request.getParameter("makul")+"'";
                        Statement ss2 = conn.getConn().createStatement();
                        ResultSet rs2 = ss2.executeQuery(query2);
                        while(rs2.next()){
                            String nm_matakuliah = rs2.getString("nama_makul");
                            session.setAttribute("makulNama", nm_matakuliah);
                            
                            String kd_maktakuliah = rs2.getString("kodemakul");
                            session.setAttribute("kd_makul", kd_maktakuliah);
                            
                            String sks_matakuliah = rs2.getString("sks");
                            session.setAttribute("sks_makul", sks_matakuliah);
                            
                             String dosen_matakuliah = rs2.getString("dosen");
                            session.setAttribute("dosen_makul", dosen_matakuliah);
                               
                            String hari_matakuliah = rs2.getString("hari");
                            session.setAttribute("hari_makul", hari_matakuliah); 
                            
                            String jam_matakuliah = rs2.getString("jam");
                            session.setAttribute("jam_makul", jam_matakuliah);
                            
                            %>
                            <td> <a href="procesinput"> dada </a> </td>
                            <td><%=rs2.getString("kodemakul")%></td>
                            <td><%=rs2.getString("nama_makul")%></td>
                            <td><%=rs2.getString("sks")%></td>
                            <td><%=rs2.getString("dosen")%></td>
                            <td><%=rs2.getString("hari")%></td>
                            <td><%=rs2.getString("jam")%></td>



                        <%
                        }
                    }catch(Exception ex){
                        ex.getMessage();
                    }
                                            
                                            %>
                    </tr>
                    
         </table>         
                    </form>
                    <table>
                        <tr>
                 <%
                    
                    try{
                        String sql = "select kul.NAMA_MAKUL, kul.KODEMAKUL, kul.DOSEN"+"from MAHSISWA mhs,DATA dat, PILIH_MAKUL mak"+
                                "where dat.NIM="+session.getAttribute("username");
                                Statement ss2 = conn.getConn().createStatement();
                                ResultSet res2 = ss2.executeQuery(sql);
                                while(res2.next()){        
                          %>
                          <td><%=res2.getString("nama_makul")%></td>
                                                  </tr>

                    </table>
                                                  
                                 <%} 
                                }catch(Exception ex){
                                        ex.getMessage();
                                         }
                                 
                                 %>
                        
    </body>
</html>
