<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page import="javaPack.userInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
        if (null != session.getAttribute("admin") || null != request.getParameter("id")){
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
      crossorigin="anonymous"
    ></script>

    <!-- Dojo CDN Script -->
    <script
      data-dojo-Config="parseOnLoad: true"
      src="https://ajax.googleapis.com/ajax/libs/dojo/1.14.1/dojo/dojo.js"
    ></script>

    <style></style>

    <title>Licenses</title>
  </head>

  <body>
    <nav class="ps-4 navbar navbar-expand-lg" style="background-color: #e3f2fd">
      <div class="container-fluid">
        <a class="navbar-brand" href="../index.html"><img src="../image/logo_ds.svg" alt="DataServe logo" width="125" height="60" /></a>
        <span class="navbar-text">Welcome Admin</span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-link" href="logout.jsp">Logout</a>
          </div>
        </div>
      </div>
    </nav>    

    <!-- Form -->
      <div class="my-5 container">
        <form id="form" method="post">

            <div class="mx-5 my-3 row">
              <div class="col-sm-3"></div>
              <div class="col-sm-3 position-relative">
                <input type="text" id="userName" name="userName" value="" class="form-control" placeholder="User name" required>
              </div>

              <div class="col-sm-3 position-relative">
                <input type="email" id="userEmail" name="userEmail" value="<%=request.getParameter("email")%>" class="form-control" placeholder="User email" required>
              </div>
              <div class="col-sm-3"></div>
            </div>

            <div class="mx-5 my-3 row">
              <div class="col-sm-3"></div>
              <div class="col-sm-3 position-relative">
                <input type="password" id="userPassword" name="userPassword" value="" class="form-control" placeholder="User password">
              </div>
              <div class="col-sm-3">
                <div class="input-group" id="show_hide_password">
                  <select class="form-select text-center" id="userStatus" name="userStatus">
                      <option id="selected" selected value="<%=request.getParameter("status")%>">Current status: <%=request.getParameter("status")%></option>
                      <option value="active">Activate</option>
                      <option value="inactive">Deactivate</option>
                  </select>
                </div>
              </div>
              <div class="col-sm-3"></div>
            </div>

            <input type="hidden" id="oldEmail" name="oldEmail" value="<%=request.getParameter("email")%>">
            <input type="hidden" id="userId" name="userId" value="<%=request.getParameter("id")%>">

              <div class="mx-5 my-3 row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6 d-flex justify-content-between text-center">
                  <div>
                    <button type="button" id="cancelBtn" class="btn btn-secondary m-4" >Cancel</button>
                  </div>
                  <div>
                    <button type="button" id="dltRecordBtn" class="btn btn-danger m-4">Delete User</button>
                    <button type="submit" class="btn btn-success m-4">Update User</button>
                  </div>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </form>
        
    </div>

    <script>  
      require([
        "dojo",
        "dojo/dom",
        "dojo/on",
        "dojo/request",
        "dojo/dom-construct",
        "dojo/dom-form",
        "dojo/domReady!",
      ], function (dojo, dom, on, request, domConstruct, domForm) {
            var form = dom.byId("form");
            var dltRecordBtn = dom.byId("dltRecordBtn");
            var cancelBtn = dom.byId("cancelBtn");

            var name = dom.byId("userName");
            var password = dom.byId("userPassword");
            var oldPass;
            
            console.log('<%=request.getParameter("email")%>');
          
            // data collector
            dojo.ready(function () {
              request.post("edit.jsp",{
                data: {id: <%=request.getParameter("id")%>}
              }).response.then(
                function(response) {
                  var data = JSON.parse(response.data);
                  name.setAttribute("value", data.name);
                  oldPass = data.password;
                },
                function(error) {
                  console.log("error: " + error);
                });
            });

            // form submitter
            on(form, "submit", function(evt){
                evt.stopPropagation();
                evt.preventDefault();
                if (password.value === "") {
                    password.setAttribute("value", oldPass);
                }
                request.post("add.jsp",{
                    data: domForm.toObject(form)
                }).response.then(
                    function(response) {
                        if (Number(response.data) === 0) {
                          password.setAttribute("value", "");
                          alert("This email already exists!");
                        } else if (Number(response.data) === 1){
                          document.location.href = "index.jsp";
                        }
                    },
                    function(error) {
                        console.log("error: " + error);
                });
            });
            
            // user deleter
            on(dltRecordBtn, "click", function(){
              request.post("delete.jsp",{
                data: {id: <%=request.getParameter("id")%>}
              }).response.then(
                function(response) {
                  document.location.href = "index.jsp";
                },
                function(error) {
                  console.log("error: " + error);
                });
            });
            
            // cancel btn
            on(cancelBtn, "click", function(){
              document.location.href = "index.jsp";
            });
        });
    </script>
  </body>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>