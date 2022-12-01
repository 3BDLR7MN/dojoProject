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
    
    public static int save(int login_id, LicensesInfo info) {
        int status = 0;
        String sql = "";
        LicensesInfo infoExists = getRecordById(info.getPoNumber());
        try {
            Connection con = getConnection();
            if(con != null){ 
                
                if(infoExists != null) {
                    sql = "UPDATE forms SET customerName = ?, customerNumber = ?, siteNumber = ?, projectName = ?, christeningNumber = ?, christeningDate = ?, poDate = ?, customerContact = ?, address = ?, quantity = ?, kind = ?, description = ?, partNumber = ?, counter = ?, login_id = ? WHERE forms.poNumber = ?";
                } else if (infoExists == null) {
                    sql = "INSERT INTO forms(customerName, customerNumber, siteNumber, projectName, christeningNumber, christeningDate, poDate, customerContact, address, quantity, kind, description, partNumber, counter, login_id, poNumber) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                } else {
                    return status;
                }
                
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, info.getCustomerName());
                ps.setString(2, info.getCustomerNumber());
                ps.setString(3, info.getSiteNumber());
                ps.setString(4, info.getProjectName());
                ps.setString(5, info.getChristeningNumber());
                ps.setString(6, info.getChristeningDate());
                ps.setString(7, info.getPoDate());
                ps.setString(8, info.getCustomerContact());
                ps.setString(9, info.getAddress());
                ps.setString(10, info.getQuantity());
                ps.setString(11, info.getKind());
                ps.setString(12, info.getDescription());
                ps.setString(13, info.getPartNumber());
                ps.setInt(14, info.getCounter());
                ps.setInt(15, login_id);
                ps.setInt(16, info.getPoNumber());
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
    
    public static LicensesInfo getRecordById(int customerPONumber) {
        LicensesInfo info = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from forms where poNumber = ?");
            ps.setInt(1, customerPONumber);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                info = new LicensesInfo();
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return info;
    }
    
    public static LicensesInfo getUserRecordById(int login_id, int customerPONumber) {
        LicensesInfo info = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from forms where login_id = ? AND poNumber = ?");
            ps.setInt(1, login_id);
            ps.setInt(2, customerPONumber);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                info = new LicensesInfo();
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return info;
    }
    
    public static userInfo getUserById(int id) {
        userInfo user = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from user where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new userInfo();
                user.setId(rs.getInt("id"));
                
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public static userInfo userLogin(String email, String password) {
        userInfo user = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from user where email = ? AND password = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new userInfo();
                user.setId(rs.getInt("id"));
                
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public static List<LicensesInfo> getAllRecords() {
        List<LicensesInfo> list = new ArrayList<LicensesInfo>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from forms ORDER BY id DESC");
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
    
    public static List<LicensesInfo> getAllUserRecords(int login_id) {
        List<LicensesInfo> list = new ArrayList<LicensesInfo>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from forms where login_id = ? ORDER BY id DESC");
            ps.setInt(1, login_id);
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
    
    public static List<userInfo> getAllUsers() {
        List<userInfo> list = new ArrayList<userInfo>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from user ORDER BY id DESC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                userInfo user = new userInfo();
                user.setId(rs.getInt("id"));
                
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setStatus(rs.getString("status"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public static int deleteRecord(int login_id,int customerPONumber) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE from forms where login_id = ? AND poNumber = ?");
            ps.setInt(1, login_id);
            ps.setInt(2, customerPONumber);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
