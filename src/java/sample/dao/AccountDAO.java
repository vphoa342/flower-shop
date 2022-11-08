/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sample.dto.Account;
import sample.utils.DBUtils;

/**
 *
 * @author vphoa
 */
public class AccountDAO {
    
    public static Account getAccount(String email, String password) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role, token\n"
                        + "from dbo.Accounts\n"
                        + "where status=1 and email = ? and password = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("fullname");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    String Token = rs.getString("token");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role, Token);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }
    
    public static ArrayList<Account> getAccounts() {
        Connection cn = null;
        Account acc = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role, token\n"
                        + "from dbo.Accounts\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int AccID = rs.getInt("accID");
                        String Email = rs.getString("email");
                        String Password = rs.getString("fullname");
                        String Fullname = rs.getString("fullname");
                        String Phone = rs.getString("phone");
                        int Status = rs.getInt("status");
                        int Role = rs.getInt("role");
                        String Token = rs.getString("token");
                        acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role, Token);
                        list.add(acc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    
    public static boolean updateAccountStatus(String email, int status) {
        Connection cn = null;
        String sql = "UPDATE Accounts \n"
                + "SET Status = ? WHERE email LIKE ?";
        try {
            cn = DBUtils.makeConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setString(2, email);
            pst.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newStatus, int newRole) {
        Connection cn = null;
        String sql = "INSERT INTO Accounts \n"
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            cn = DBUtils.makeConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, newEmail);
            pst.setString(2, newPassword);
            pst.setString(3, newFullname);
            pst.setString(4, newPhone);
            pst.setInt(5, newStatus);
            pst.setInt(6, newRole);
            pst.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public static boolean updateAccount(String email, String newPassword, String newFullname, String newPhone) {
        Connection cn = null;
        String sql = "UPDATE Accounts\n"
                + "SET password=?, fullname=?, phone=? \n"
                + "WHERE email LIKE ?";
        try {
            cn = DBUtils.makeConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, newPassword);
            pst.setString(2, newFullname);
            pst.setString(3, newPhone);
            pst.setString(4, email);
            pst.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public static void updateToken(String token, String email) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE dbo.Accounts\n"
                        + "SET token = ?\n"
                        + "where email = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                pst.setString(2, email);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public static Account getAccount(String token) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role, token\n"
                        + "from dbo.Accounts\n"
                        + "where token=? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("fullname");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role, token);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        
        return acc;
    }
}
