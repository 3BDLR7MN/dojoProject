<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // in here we try to make a connection with the DB
    try{
        // we create a new object of the class defiend in java that makes the connection
        DBConnection con = new DBConnection();

        // create new object of this class to store all form passed data into it
        LicensesInfo info = new LicensesInfo();
        info.setPoNumber(Integer.parseInt(request.getParameter("poNumber")));
        info.setCounter(Integer.parseInt(request.getParameter("counter")));

        info.setCustomerName(request.getParameter("customerName"));
        info.setCustomerNumber(request.getParameter("customerNumber"));
        info.setSiteNumber(request.getParameter("siteNumber"));
        info.setProjectName(request.getParameter("projectName"));
        info.setChristeningNumber(request.getParameter("christeningNumber"));
        info.setChristeningDate(request.getParameter("christeningDate"));
        info.setPoDate(request.getParameter("poDate"));
        info.setCustomerContact(request.getParameter("customerContact"));
        info.setAddress(request.getParameter("address"));
        info.setQuantity(request.getParameter("quantity1"));
        info.setKind(request.getParameter("kind1"));
        info.setDescription(request.getParameter("description1"));
        info.setPartNumber(request.getParameter("partNumber1"));
        
        con.create(info);

    } catch (Exception e){
        out.print(e);
    }
%>