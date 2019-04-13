/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import ie.irishliterature.dao.ApplicationDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Status;
import ie.irishliterature.model.User;
import ie.irishliterature.util.BCrypt;
import ie.irishliterature.util.GlobalConstants;
import ie.irishliterature.util.MailUtil;
import ie.irishliterature.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author markus
 */
@WebServlet(name = "AddUserStaff", urlPatterns = {"/AddUserStaff"})
public class AddUserStaff extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUserStaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserStaff at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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

        String username = request.getParameter("StaffUname");
        String firstname = request.getParameter("StaffFirstname");
        String lastname = request.getParameter("StaffLastname");
        String password = request.getParameter("StaffPassword");
        String email = request.getParameter("StaffEmail");
        String function = "Literature Ireland Staff";
        String role = "";
        int userID = 0;

        String fullname = firstname + " " + lastname;

        System.out.println("AddUserStaff doPost::username " + username);
        System.out.println("AddUserStaff doPost::firstname " + firstname);
        System.out.println("AddUserStaff doPost::lastname " + lastname);
        System.out.println("AddUserStaff doPost::password " + password);
        System.out.println("AddUserStaff doPost::email " + email);
        System.out.println("AddUserStaff doPost::function " + function);
        System.out.println("AddUserStaff doPost::fullname " + fullname);

        Status sp = new Status();
        String output = "";
        String message = "";

        User user = new User();
        user.setUSERNAME(username);
        user.setFIRST_NAME(firstname);
        user.setLAST_NAME(lastname);
        user.setFull_NAME(fullname);

        /*
         * generate hash for password
         */
        user.setPASSWORD(BCrypt.hashpw(password, GlobalConstants.SALT));

        user.setEMAIL(email);

        /*
         * generate hash code for email verification
         */
        String hash = Utils.prepareRandomString(30);

        /*
         * generate hash for password
         */
        user.setEMAIL_VERIFICATION_HASH(BCrypt.hashpw(hash, GlobalConstants.SALT));

        if (role == null) {
            role = "not assigned";
        }

        user.setROLE(role);

        user.setFUNCTION(function);

        try {

            /*
             * check whether email exists or not
             */
            if (!ApplicationDAO.isEmailExists(email)) {

                System.out.println("isEmailExists Not:: ");

                /*
                 * create account if email not exists
                 */
                userID = ApplicationDAO.insertRow(user);
                System.out.println("userID:: " + userID);


                /*
                 * send verification email
                 */
                MailUtil.sendEmailRegistrationLinkNewStaff(username, fullname, password, email, hash);

                message = "New Staff member <strong>" + fullname + "</strong> has been created  <br/><br/>and email has been sent";
            } else {
                /*
                 * tell user that the email already in use
                 */

                message = "This Email is already registered - try again";
            }

            //ENSURE signup is validated
        } catch (DBException | MessagingException e) {
            sp.setCode(-1);
            sp.setMessage(e.getMessage());
            output = Utils.toJson(sp);
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("/WEB-INF/views/AddNewStaffRegistrationMessage.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
