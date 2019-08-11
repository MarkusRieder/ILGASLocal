/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import ie.irishliterature.dao.ExpertReaderDAO;
import ie.irishliterature.db.DBException;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet( name = "ExpertReaderDelete", urlPatterns =
{
    "/ExpertReaderDelete"
} )
public class ExpertReaderDelete extends HttpServlet {

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
            out.println( "<title>Servlet ExpertReaderDelete</title>" );
            out.println( "</head>" );
            out.println( "<body>" );
            out.println( "<h1>Servlet ExpertReaderDelete at " + request.getContextPath() + "</h1>" );
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
            throws ServletException, IOException
    {

        System.out.println( "ExpertReaderDelete doPost " );

        System.out.println( "ID  " + request.getParameter( "id" ) );

//        int id = Integer.parseInt(request.getParameter("id"));
        String id = request.getParameter( "id" );

        boolean result = false;

        try
        {
            result = ExpertReaderDAO.deleteExpertReader( id );
        }
        catch ( DBException ex )
        {
            Logger.getLogger( ExpertReaderDelete.class.getName() ).log( Level.SEVERE, null, ex );
        }

        System.out.println( "ExpertReaderDelete result  " + result );

        response.setContentType( "text/html" );
        PrintWriter out = response.getWriter();

//        out.println("<html><body>");
//        out.println("<script type=\"text/javascript\">");
//        out.println("var popwin = window.open(\"pag/WEB-INF/views/welcome_Staff_1.jsp\")");
//        out.println("setTimeout(function(){ popwin.close(); window.location.href='/WEB-INF/views/welcome_Staff_1';},5000)");
//        out.println("</script>");
//        out.println("</body></html>");
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
