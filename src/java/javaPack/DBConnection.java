package javaPack;

import java.sql.*;
import java.util.*;

public class DBConnection {
	
    public static Connection getConnection() {
        Connection con = null;
        String urlString = "jdbc:mysql://localhost:3306/form_crud?characterEncoding=utf8";
        String user = "root";
        String pass = "Amali12$";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(urlString, user, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    
    public static int create(LicensesInfo info) {
        int status = 0;
        try {
            Connection con = getConnection();
            if(con != null){               
                PreparedStatement ps = con.prepareStatement("INSERT INTO forms(customerName, customerNumber, siteNumber, projectName, christeningNumber, christeningDate, poNumber, poDate, customerContact, address, quantity, kind, description, partNumber, counter) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, info.getCustomerName());
                ps.setString(2, info.getCustomerNumber());
                ps.setString(3, info.getSiteNumber());
                ps.setString(4, info.getProjectName());
                ps.setString(5, info.getChristeningNumber());
                ps.setString(6, info.getChristeningDate());
                ps.setInt(7, info.getPoNumber());
                ps.setString(8, info.getPoDate());
                ps.setString(9, info.getCustomerContact());
                ps.setString(10, info.getAddress());
                ps.setString(11, info.getQuantity());
                ps.setString(12, info.getKind());
                ps.setString(13, info.getDescription());
                ps.setString(14, info.getPartNumber());
                ps.setInt(15, info.getCounter());
                status = ps.executeUpdate();
            } else {
                System.out.println("Problem with connection please try again later!");
            }
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        
        return status;
    }
    
    public static List<LicensesInfo> getAllRecords() {
        List<LicensesInfo> list = new ArrayList<LicensesInfo>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from forms");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LicensesInfo info = new LicensesInfo();
                info.setPoNumber(rs.getInt("poNumber"));
                info.setCounter(rs.getInt("counter"));
                
                info.setCustomerName(rs.getString("customerName"));
                info.setCustomerNumber(rs.getString("customerNumber"));
                info.setSiteNumber(rs.getString("siteNumber"));
                info.setProjectName(rs.getString("projectName"));
                info.setChristeningNumber(rs.getString("christeningNumber"));
                info.setChristeningDate(rs.getString("christeningDate"));
                info.setPoDate(rs.getString("poDate"));
                info.setCustomerContact(rs.getString("customerContact"));
                info.setAddress(rs.getString("address"));
                info.setQuantity(rs.getString("quantity"));
                info.setKind(rs.getString("kind"));
                info.setDescription(rs.getString("description"));
                info.setPartNumber(rs.getString("partNumber"));
                list.add(info);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
}
