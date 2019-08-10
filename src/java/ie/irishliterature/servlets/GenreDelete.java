/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import ie.irishliterature.dao.GenresDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet( name = "GenreDelete", urlPatterns =
{
    "/GenreDelete"
} )
public class GenreDelete extends HttpServlet {

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
            throws ServletException, IOException
    {
        response.setContentType( "text/html;charset=UTF-8" );
        try ( PrintWriter out = response.getWriter() )
        {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println( "<!DOCTYPE html>" );
            out.println( "<html>" );
            out.println( "<head>" );
            out.println( "<title>Servlet GenreDelete</title>" );
            out.println( "</head>" );
            out.println( "<body>" );
            out.println( "<h1>Servlet GenreDelete at " + request.getContextPath() + "</h1>" );
            out.println( "</body>" );
            out.println( "</html>" );
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
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        System.out.println( "GenreDelete doGet " );
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
            throws ServletException, IOException
    {

        System.out.println( "GenreDelete doPost " );
//        Enumeration en = request.getParameterNames();
//
//        while (en.hasMoreElements()) {
//            Object objOri = en.nextElement();
//
//            String param = (String) objOri;
//
//            String value = request.getParameter(param);
//
//            System.out.println("pendingApplicationDataServlet Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n");
//
//        }
//
//        Enumeration<String> attributes = request.getSession().getAttributeNames();
//        while (attributes.hasMoreElements()) {
//            String attribute = attributes.nextElement();
//            System.out.println("pendingApplicationDataServlet attribute '" + attribute + " and Parameter Value is " + request.getSession().getAttribute(attribute));
//        }

        System.out.println( "ID  " + request.getParameter( "id" ) );

        int id = Integer.parseInt( request.getParameter( "id" ) );

        boolean result = false;
        try
        {
            result = GenresDAO.deleteGenre( id );
        } catch ( SQLException ex )
        {
            Logger.getLogger( GenreDelete.class.getName() ).log( Level.SEVERE, null, ex );
        }

        System.out.println( "result  " + result );
//        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); // Your Input Date Format
//        Date date = null;
//        try {
//            date = sdf.parse(request.getParameter("date"));
//        } catch (ParseException ex) {
//            Logger.getLogger(GenreDelete.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        SimpleDateFormat ft = new SimpleDateFormat("EEEE");

//        out.print("<h2 align=\"left\">" + ft.format(date) + "</h2>");
//        out.print("<h2 align=\"left\">" + id + "</h2>");
        response.setContentType( "text/html" );
        PrintWriter out = response.getWriter();

        out.println( "<html><body>" );
        out.println( "<script type=\"text/javascript\">" );
        out.println( "var popwin = window.open(\"pag/WEB-INF/views/welcome_Staff_1.jsp\")" );
        out.println( "setTimeout(function(){ popwin.close(); window.location.href='/WEB-INF/views/welcome_Staff_1';},5000)" );
        out.println( "</script>" );
        out.println( "</body></html>" );

//        out.println("<HTML>");
//        out.println("<HEAD><TITLE>Hello World</TITLE></HEAD>");
//        out.println("<BODY>");
//        out.println("<BIG>Hello World</BIG>");
//        out.println("<h2 align=\"left\">" + ft.format(date) + "</h2>");
//        out.println("</BODY></HTML>");
////        request.setAttribute("activeTab", "Genres");
//        request.setAttribute("errorMessage", "Invalid Credentials!!");
//        request.getRequestDispatcher("/WEB-INF/views/welcome_Staff_1.jsp").forward(request, response);
//    get id from jsp then delete via GenresDAO - return message 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
