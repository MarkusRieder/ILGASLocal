package ie.irishliterature.servlets;

import ie.irishliterature.dao.GenresDAO;
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
@WebServlet( name = "GenreAdd", urlPatterns =
{
    "/GenreAdd"
} )
public class GenreAdd extends HttpServlet {

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

        System.out.println( "GenreAdd doGet " );
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

        System.out.println( "GenreAdd doPost " );

        System.out.println( "genre:  " + request.getParameter( "genre" ) );

        String genres = request.getParameter( "genre" );

        boolean result = false;

        try
        {
            result = GenresDAO.insertGenre( genres );
        }
        catch ( DBException ex )
        {
            Logger.getLogger( GenreAdd.class.getName() ).log( Level.SEVERE, null, ex );
        }

        System.out.println( "result  " + result );

        response.setContentType( "text/html" );
        PrintWriter out = response.getWriter();

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
    }

}
