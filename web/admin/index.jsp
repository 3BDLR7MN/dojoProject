<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page import="javaPack.userInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
        if (null != session.getAttribute("admin")){
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
          <div class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" id="myInput" placeholder="Search" aria-label="Search">
          </div>
        </div>
      </div>
    </nav> 
    
    <!-- Button trigger modal -->
    <div class="mt-5 text-center">
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Add New User</button>
    </div>

    <!-- Striped table -->
    <div class="container mt-3">
      <table id="myTable" class="table table-striped text-center">
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Status</th>
            <th class="skip-filter" scope="col">Edit</th>
          </tr>
        </thead>
        <tbody id="tbody"></tbody>
      </table>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          
          <!-- Modal header -->
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">New User</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form method="post" id="myForm">
              <div class="mb-3 row">
                  <div class="col-sm-6">
                    <input type="text" class="form-control text-center" id="userName" name="userName" placeholder="Full Name" required/>
                </div>
                  <div class="col-sm-6">
                    <input type="email" class="form-control text-center" id="userEmail" name="userEmail" placeholder="Email" required/>
                </div>
              </div>
              
              <div class="mb-3 row">
                  <div class="col-sm-12">
                    <input type="password" class="form-control text-center" id="showPassword" name="showPassword" placeholder="Password" required/>
                </div>
<!--                  <div class="col-sm-3">
                    <select class="form-select text-center" id="userStatus" name="userStatus">
                        <option selected value="">Current Status: </option>
                        <option value="active">Activate</option>
                        <option value="inactive">Deactivate</option>
                    </select>
                  </div>-->
              </div>
              
              <input type="hidden" id="userPassword" name="userPassword"/>
              <input type="hidden" id="userStatus" name="userStatus" value="active" />
              
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="myForm" class="btn btn-success">Save User</button>
          </div>
        </div>
      </div>
    </div>

    <script>
      var editIcon = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"><path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/><path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/></svg>`
      
      require([
        "dojo",
        "dojo/dom",
        "dojo/on",
        "dojo/request",
        "dojo/dom-construct",
        "dojo/dom-form",
        "dojo/domReady!",
      ], function (dojo, dom, on, request, domConstruct, domForm) {
        var tbody = dom.byId("tbody");
        var form = dom.byId("myForm");
        var showPassword = dom.byId("showPassword");
        var password = dom.byId("userPassword");
        
        function utf8_to_b64(str) {
            return window.btoa(unescape(encodeURIComponent(str)));
        }

        function b64_to_utf8(str) {
            return decodeURIComponent(escape(window.atob(str)));
        }
        
        // striped table builder
        dojo.ready(function () {
          request.post("view.jsp", { handleAs: "json" }).response.then(
            function (response) {
              console.log(response.data)
              var dataStore = response.data;
              for (obj of dataStore) {
                var row = domConstruct.toDom(
                  `<tr>
                    <td>`+obj.name+`</td>
                    <td>`+obj.email+`</td>
                    <td>`+obj.status+`</td>
                    <td><a href="user.jsp?id=`+obj.id+`&email=`+obj.email+`&status=`+obj.status+`">`+editIcon+`</a></td>
                  </tr>`
                );
                domConstruct.place(row, tbody, "last");
              }
            },
            function (error) {
              console.log("error: " + error);
            }
          );
        });
        
        // form submitter
        on(form, "submit", function(evt) {
          evt.stopPropagation();
          evt.preventDefault();
          password.setAttribute("value", utf8_to_b64(showPassword.value));
          request.post("add.jsp",{
        	data: domForm.toObject(form),
          }).response.then(
        	function(response) {
              if (Number(response.data) === 0) {
                password.setAttribute("value", "");
                alert("This email already exists!");
              } else if (Number(response.data) === 1){
                form.reset();
                location.reload();
              }
        	},
        	function(error) {
              console.log("error: " + error);
        	});
        })
      });
    </script>
    
    <!-- search algorithm -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="ddtf.js"></script>
    <script>
      $('#myTable').ddTableFilter();
    </script>
    <script>
      $(document).ready(function(){
        $("#myInput").on("keyup", function() {
          var value = $(this).val().toLowerCase();
          $("#tbody tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
          });
        });
      });
    </script>
  </body>
</html>
<%
    } else {
        response.sendRedirect("loginPage.jsp");
    }
%>