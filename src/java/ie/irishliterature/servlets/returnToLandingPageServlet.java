/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import java.io.IOException;
import java.util.Enumeration;
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
@WebServlet( name = "returnToLandingPageServlet", urlPatterns
        = {
            "/returnToLandingPageServlet"
        } )
public class returnToLandingPageServlet extends HttpServlet {

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
    protected void processRequest( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        response.setContentType( "text/html;charset=UTF-8" );
        request.setCharacterEncoding( "UTF-8" );

        String name = "";

        String Company = "";

        HttpSession session = request.getSession();
        System.out.println( "############################### /returnToLandingPageServlet ####################################" );

        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() ) {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );

            System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + session.getValue( key ) );

        }

        System.out.println( "###################################################################" );

        String userID = request.getParameter( "userID" );
        name = request.getParameter( "name" );
        Company = request.getParameter( "Company" );
        String publisherID = request.getParameter( "publisherID" );
        System.out.println( "userID:1 " + userID );
        System.out.println( "name:1 " + name );
        System.out.println( "Company:1 " + Company );
        System.out.println( "PublisherID:1 " + publisherID );

//        Clear message
        session.setAttribute( "message", "" );
        request.setAttribute( "message", "" );
        session.setAttribute( "name", name );
        session.setAttribute( "publisherID", publisherID );
        request.setAttribute( "name", name );
        request.setAttribute( "userID", userID );
        request.setAttribute( "Company", Company );

        request.getRequestDispatcher( "/WEB-INF/views/welcome_Publisher.jsp" ).forward( request, response );

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
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
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
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}