<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
    if (null != session.getAttribute("name")) {
        session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>