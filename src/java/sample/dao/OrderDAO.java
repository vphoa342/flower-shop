/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import sample.dto.Order;
import sample.dto.OrderDetail;
import sample.utils.DBUtils;

/**
 *
 * @author vphoa
 */
public class OrderDAO {
    
    public static ArrayList<Order> getOrders(int accId) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [OrderID]\n" +
                            ",[OrdDate]\n" +
                            ",[shipdate]\n" +
                            ",[status]\n" +
                            ",[AccID] FROM dbo.Orders\n" + 
                            "WHERE AccID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int orderId = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipDate");
                        int status = rs.getInt("status");
                        Order ord = new Order(orderId, orderDate, shipDate, accId, status);
                        list.add(ord);
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        return list; 
    }
    
    public static ArrayList<OrderDetail> getOrderDetail(int orderId) {
        Connection cn = null;
        ArrayList<OrderDetail> list = new ArrayList<>();
        
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT DetailId, OrderId, PID, PName, price, imgPath, quantity\n"
                        + "FROM OrderDetails, Plants\n"
                        + "WHERE OrderId = ? AND OrderDetails.FID = Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int detailId = rs.getInt("DetailId");
                        int plantId = rs.getInt("PID");
                        String plantName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderDetail = new OrderDetail(detailId, orderId, plantId, plantName, price, imgPath, quantity);
                        list.add(orderDetail);
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return list;
    }
    
    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accId = 0;
                int orderId = 0;
                cn.setAutoCommit(false);
                String sql = "SELECT accID FROM dbo.Accounts WHERE email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accId = rs.getInt("accID");
                }
                System.out.println("account id: " + accId);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date: " + d);
                sql = "INSERT dbo.Orders(OrdDate, status, AccID) VALUES(?, ?, ?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accId);
                pst.executeUpdate();
                
                sql = "SELECT TOP 1 orderID FROM Orders\n"
                        + "order by orderID DESC";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderId = rs.getInt("orderID");
                }
                System.out.println("order id: " + orderId);
                Set<String> pids = cart.keySet();
                for (String pid: pids) {
                    sql = "INSERT OrderDetails VALUES(?, ?, ?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderId);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("Cannot insert order");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            if (cn != null)
                try {
                    cn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                    
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
}
