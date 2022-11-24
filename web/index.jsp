<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
<%@page import="java.util.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- this stylesheet is for dojo dijit style (claro specifically) -->
    <link
      rel="stylesheet"
      href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.4/dijit/themes/claro/claro.css"
      media="screen"
    />

    <!-- CSS -->
    <style>
      html,
      body {
        width: 100%;
        height: 100%;
      }
      form {
        display: flex;
        flex-direction: column;
        gap: 10px;
        align-items: center;
      }
      form > div {
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      div > label {
        width: 25%;
      }
      label:last-child {
        text-align: right;
      }
      table {
        margin: 0 auto;
        width: 80%;
        text-align: center;
      }
      button {
        margin-top: 20px;
      }
    </style>

    <title>Dojo Form Project</title>
  </head>

  <!-- in order for the dijit style to apply you have to link a class to the body -->
  <body class="claro">
    <!-- Container -->
    <div
      id="BorderContainer"
      data-dojo-type="dijit/layout/BorderContainer"
      style="width: 100%; height: 100%"
    >
      <!-- center pane -->
      <div
        id="centerPane"
        data-dojo-type="dijit/layout/ContentPane"
        data-dojo-props="region: 'center'"
      >
        <%
            // in here we try to make a connection with the DB
            try{
                // we create a new object of the class defiend in java that makes the connection
                DBConnection con = new DBConnection();
                
                List<LicensesInfo> infoList = con.getAllRecords();
                for (LicensesInfo info : infoList) {
                out.print("<a href='test.jsp?poNumber="+info.getPoNumber() + "'>"+info.getProjectName()+"</a><br>");
            }
            } catch (Exception e){
                out.print(e);
            }
        %>
      </div>
    </div>

    <!-- Dojo CDN Script -->
    <!-- http: IMPORTANT -->
    <script
      src="http://ajax.googleapis.com/ajax/libs/dojo/1.14.1/dojo/dojo.js"
      data-dojo-config="has:{'dojo-firebug': true}, parseOnLoad: true, foo: 'bar', async: 1"
    ></script>

    <!-- Dojo Script -->
    <script>
      // to count how many rows, default is 1
      var cnt = 1;

      require([
        "dojo/dom",
        "dojo/on",
        "dojo/dom-construct",
        // ----------
        "dojo/parser",
        "dijit/layout/BorderContainer",
        "dijit/layout/ContentPane",
        "dijit/form/TextBox",
        "dijit/form/NumberTextBox",
        "dijit/form/DateTextBox",
        "dojo/domReady!",
      ], function (dom, on, domConstruct) {
        var form = dom.byId("form");
        var table = dom.byId("table");
        var rowsbtn = dom.byId("rowsbtn");

        // to add counter value as a passable argument for pdf.js
        var counter = dom.byId("counter");
        counter.value = 1;

        // func for when "new row" button is clicked
        on(rowsbtn, "click", function (e) {
          // notice this will be retrieved as string in pdf.js!
          counter.value = ++cnt;

          // creating a new row with 4 cells
          var row = domConstruct.toDom(
            `<tr>
                <td>
                  <input
                    id="quantity${cnt}"
                    name="quantity${cnt}"
                    type="number"
                  />
                </td>
                <td>
                  <input
                    id="kind${cnt}"
                    name="kind${cnt}"
                    type="text"
                  />
                </td>
                <td>
                  <input
                    id="description${cnt}"
                    name="description${cnt}"
                    type="text"
                  />
                </td>
                <td>
                  <input
                    id="partNumber${cnt}"
                    name="partNumber${cnt}"
                    type="text"
                  />
                </td>
              </tr>`
          );

          // place the new row as the last child element of the table
          domConstruct.place(row, table, "last");
        });

        // func for when form is submitted
        on(form, "submit", function () {
          // this will redirect the user to pdf.jsp
          // window.location.href = "pdf.jsp";
        });
      });
    </script>
  </body>
</html>
