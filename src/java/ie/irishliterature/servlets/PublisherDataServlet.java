/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ie.irishliterature.DataTables.DataTableApplications;
import ie.irishliterature.dao.PublisherDAO;
import ie.irishliterature.db.DBException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author markus
 */
@WebServlet(name = "PublisherDataServlet", urlPatterns = {"/PublisherDataServlet"})
public class PublisherDataServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public PublisherDataServlet() {

        super();
    }

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PublisherDataServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PublisherDataServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
      @SuppressWarnings( "unchecked" )
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("PublisherDataServlet:  ");

        String publisherId = "";

        HttpSession session = request.getSession();

        System.out.println("############################### /PublisherDataServlet ####################################");

        Enumeration en = request.getParameterNames();

        while (en.hasMoreElements()) {
            Object objOri = en.nextElement();

            String param = (String) objOri;

            String value = request.getParameter(param);

            System.out.println("Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n");

        }

        System.out.println("Enumeration keys   ");
        Enumeration keys = session.getAttributeNames();
        while (keys.hasMoreElements()) {
            String key = (String) keys.nextElement();
            System.out.println("key  :" + key + ": " + session.getValue(key));

            if (key.equals("publisherID")) {
//                publisherID = (String) session.getValue("publisherID");
            }

        }

        publisherId = request.getParameter("publisherId");

        System.out.println("###################################################################");

        System.out.println("PublisherDataServlet publisherId: " + publisherId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        List listPublishers = null;

        try {

            listPublishers = PublisherDAO.getPublisherDetails(publisherId);

        } catch (DBException ex) {
            Logger.getLogger(PublisherDataServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        DataTableApplications dta = new DataTableApplications();
        dta.setAaData(listPublishers);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(dta);
        System.out.println("json:  " + json);
        out.print(json);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
