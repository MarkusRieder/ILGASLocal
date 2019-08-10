/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import ie.irishliterature.util.Setup;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import static java.sql.DriverManager.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author markus
 */
@WebServlet(name = "CheckUserName", urlPatterns = {"/CheckUserName"})
public class CheckUserName extends HttpServlet {

    private static Connection connection;

    protected static void connect() throws SQLException {
        System.out.println("CheckUserName remote connect ");
        if (connection == null || connection.isClosed()) {
            System.out.println("CheckUserName remote connect if (connection == null || connection.isClosed())");
            connection = getConnection(Setup.DB_URL, Setup.DB_USERNAME, Setup.DB_PASSWORD);
            System.out.println("CheckUserName remote getConnection " + connection);
        }
    }

    protected static void disconnect() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {

            System.out.println("/CheckUserName doPost: ");
            String uname = request.getParameter("uname");

            System.out.println("/CheckUserName uname: " + uname);
            PrintWriter out = response.getWriter();

            connect();

            PreparedStatement ps = connection.prepareStatement("SELECT * FROM ILGAS.users WHERE  uname= ?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("/CheckUserName uname: " + uname + " fail");
                out.println("<font color=red>");
                out.println("Username already exists");
                out.println("</font>");

            } else {
                System.out.println("/CheckUserName uname: " + uname + " OK");
                out.println("<font color=green>");
                out.println("Available");
                out.println("</font>");

            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckUserName.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
