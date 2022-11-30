<%  
    if (null != request.getParameter("password")){
        String password = request.getParameter("password");
        if(password.equals("1234")) {
            session.setAttribute("admin","admin");
            out.print(1);
        } else {
            out.print(0);
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>