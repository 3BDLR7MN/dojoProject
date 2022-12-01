<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (null != session.getAttribute("name")){
        // in here we try to make a connection with the DB
        try{
            // we create a new object of the class defiend in java that makes the connection
            DBConnection con = new DBConnection();
            out.print(con.getAllUserRecords((Integer)session.getAttribute("id")));
        } catch (Exception e){
            out.print(e);
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>