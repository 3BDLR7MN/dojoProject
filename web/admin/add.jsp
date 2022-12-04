<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page import="javaPack.userInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (null != session.getAttribute("admin") && null != request.getParameter("userName")){
        // in here we try to make a connection with the DB
        try{
            // we create a new object of the class defiend in java that makes the connection
            DBConnection con = new DBConnection();

            // create new object of this class to store all form passed data into it
            userInfo user = new userInfo();

            user.setName(request.getParameter("userName"));
            user.setEmail(request.getParameter("userEmail"));
            user.setPassword(request.getParameter("userPassword"));
            user.setStatus(request.getParameter("userStatus"));
            
            // check if user is old or new (!null = old)
            if (request.getParameter("oldEmail") != null) {
                // check if older email = new email, in that case just save
                if (request.getParameter("oldEmail").equals(user.getEmail())) {
                    user.setId(Integer.parseInt(request.getParameter("userId")));
                    // save user
                    con.saveUser(user);
                    out.print(1);
                // check if old email != new email, in that case check if new email exists before
                } else if (con.getUserByEmail(user.getEmail()) != null) {
                    out.print(0);
                } else if (con.getUserByEmail(user.getEmail()) == null) {
                    user.setId(Integer.parseInt(request.getParameter("userId")));
                    // save user
                    con.saveUser(user);
                    out.print(1);
                }
            } else if (request.getParameter("oldEmail") == null) {
                if (con.getUserByEmail(user.getEmail()) != null) {
                    out.print(0);
                }
                else {
                    // save user
                    con.saveUser(user);
                    out.print(1);
                }
            }

        } catch (Exception e){
            out.print(e);
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>