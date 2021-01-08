package ie.irishliterature.servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ie.irishliterature.DataTables.DataTableUser;
import ie.irishliterature.dao.UserDAO;
import ie.irishliterature.db.DBException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class StaffServlet
 * <br>
 * returns json list of staff members
 *
 * <br><br>
 * $LastChangedDate:: 						        $:  Date of last change<br>
 * $LastChangedRevision::                                               $:  Revision of last commit<br>
 * $Author:: markus                                                     $:  Author of last commit
 * 
 * @author Markus Rieder
 */


@WebServlet( name = "StaffUserDataServlet", urlPatterns ={    "/StaffUserDataServlet"} )


public class StaffUserDataServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public StaffUserDataServlet() {

        super();
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
    @SuppressWarnings( "unchecked" )
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        System.out.println( "StaffUserDataServlet:  " );
        response.setCharacterEncoding( "UTF-8" );
        response.setContentType( "application/json" );

        PrintWriter out = response.getWriter();

        List listUsers = null;

        try
        {

            listUsers = UserDAO.getAllStaff();

        }
        catch ( ClassNotFoundException | DBException ex )
        {
            Logger.getLogger( StaffUserDataServlet.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DataTableUser dtu = new DataTableUser();
        dtu.setAaData( listUsers );

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson( dtu );
//        System.out.println( "StaffUserDataServlet json:  " + json );
        out.print( json );
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

        System.out.println( "UserDataServlet:  " );
        doGet( request, response );
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
