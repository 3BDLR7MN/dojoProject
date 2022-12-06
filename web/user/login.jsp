<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page import="javaPack.userInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    if (null != request.getParameter("password")){
        try{
            // we create a new object of the class defiend in java that makes the connection
            DBConnection con = new DBConnection();

            // create new object of this class to store all form passed data into it
            userInfo user = con.userLogin(request.getParameter("email"), request.getParameter("password"));
            if (user == null) {
                out.print(0);
            } else {
                if(user.getStatus().equals("inactive")) {
                    out.print(1);
                } else {
                    session.setAttribute("id", user.getId());
                    session.setAttribute("name",user.getName());
                    out.print(2);
                }
            }

        } catch (Exception e){
            out.print(e);
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>