<%@page import="javaPack.LicensesInfo"%>
<%@page import="javaPack.DBConnection"%>
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
        <!-- form -->
        <form action="edit.jsp" method="post" id="form">
          <div>
            <label for="customerName">DataServe Customer name</label>
            <input
              id="customerName"
              name="customerName"
              data-dojo-type="dijit/form/TextBox"
              data-dojo-props=""
            />
            <label for="customerName">اسم العميل لدى داتاسيرف</label>
          </div>

          <div>
            <label for="customerNumber">DataServe Customer Number</label>
            <input
              id="customerNumber"
              name="customerNumber"
              data-dojo-type="dijit/form/NumberTextBox"
              data-dojo-props="constraints: {min: 10, max: 90}, required: true, invalidMessage: 'Only numbers 10-90'"
            />
            <label for="customerNumber">رقم العميل لدى داتاسيرف</label>
          </div>

          <div>
            <label for="siteNumber">DataServe Site Number</label>
            <input
              id="siteNumber"
              name="siteNumber"
              data-dojo-type="dijit/form/TextBox"
              data-dojo-props=""
            />
            <label for="siteNumber">رقم موقع داتاسيرف</label>
          </div>

          <div>
            <label for="projectName">Project Name as per RFP</label>
            <input
              id="projectName"
              name="projectName"
              data-dojo-type="dijit/form/TextBox"
              data-dojo-props=""
            />
            <label for="projectName">اسم المشرو ع</label>
          </div>

          <div>
            <label for="christeningNumber">Christening Number</label>
            <input
              id="christeningNumber"
              name="christeningNumber"
              data-dojo-type="dijit/form/NumberTextBox"
              data-dojo-props=""
            />
            <label for="christeningNumber">رقم التعميد</label>
          </div>

          <div>
            <label for="christeningDate">Christening Date</label>
            <input
              id="christeningDate"
              name="christeningDate"
              data-dojo-type="dijit/form/DateTextBox"
              data-dojo-props=""
            />
            <label for="christeningDate">تاريخ التعميد</label>
          </div>

          <div>
            <label for="poNumber">Customer P.O Reference Number</label>
            <input
              id="poNumber"
              name="poNumber"
              data-dojo-type="dijit/form/NumberTextBox"
              data-dojo-props=""
            />
            <label for="poNumber">رقم العقد</label>
          </div>

          <div>
            <label for="poDate">P.O Date</label>
            <input
              id="poDate"
              name="poDate"
              data-dojo-type="dijit/form/DateTextBox"
              data-dojo-props=""
            />
            <label for="poDate">تاريخ العقد</label>
          </div>

          <div>
            <label for="customerContact">Customer Contact</label>
            <input
              id="customerContact"
              name="customerContact"
              data-dojo-type="dijit/form/TextBox"
              data-dojo-props=""
            />
            <label for="customerContact">رقم التواصل بالعميل</label>
          </div>

          <div>
            <label for="address">Address</label>
            <textarea
              id="address"
              name="address"
              data-dojo-type="dijit/form/SimpleTextarea"
              data-dojo-props="cols: 30, rows: 7"
            ></textarea>
            <label for="address">عنوان العميل</label>
          </div>

          <!-- table -->
          <div>
            <table id="table">
              <tr>
                <th>الكمية<br />Quantity</th>
                <th>النوع<br />Type</th>
                <th>الوصف<br />Description</th>
                <th>الرقم<br />Part Number</th>
              </tr>
              <tr>
                <td>
                  <input id="quantity" name="quantity" type="number" />
                </td>
                <td>
                  <input id="kind" name="kind" type="text" />
                </td>
                <td>
                  <input id="description" name="description" type="text" />
                </td>
                <td>
                  <input id="partNumber" name="partNumber" type="text" />
                </td>
              </tr>
            </table>
          </div>

          <!-- buttons -->
          <div>
            <button id="submitbtn" type="submit">Submit</button>
            <button id="rowsbtn" type="button">Add Row</button>
          </div>

          <!-- counter param -->
          <input type="hidden" id="counter" name="counter" value="1" />
        </form>
      </div>
    </div>

<%
    if(request.getParameter("poNumber") != null) {s
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
            info.setQuantity(request.getParameter("quantity"));
            info.setKind(request.getParameter("kind"));
            info.setDescription(request.getParameter("description"));
            info.setPartNumber(request.getParameter("partNumber"));

            if(con.create(info) == 1) {
                %>
                <span>Added!</span>
                <%
            } else {
                %>
                <span>NOT added!</span>
                <%
            }

            // if connection is successful, else if not
    //        if(con.getConnection() != null){
    //            out.print("Successful connection!");
    //            out.print(request.getParameter("customerName"));
    //        } else{
    //            out.print("Problem with connection please try again later!");
    //        }	
        } catch (Exception e){
            out.print(e);
        }
    }
%>

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
