<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (null != session.getAttribute("name") && null != request.getParameter("poNumber")){
        // in here we try to make a connection with the DB
        System.out.print("inside delete");
        try{
            // we create a new object of the class defiend in java that makes the connection
            DBConnection con = new DBConnection();

            // create new object of this class to store all form passed data into it        
            int status = con.deleteRecord((Integer)session.getAttribute("id"), Integer.parseInt(request.getParameter("poNumber")));

            if (status == 1) {
                out.print("Record has been deleted");
            } else {
                out.print("Record has NOT been deleted");
            }

        } catch (Exception e){
            out.print(e);
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>