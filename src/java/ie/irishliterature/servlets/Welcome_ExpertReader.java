package ie.irishliterature.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Welcome_ExpertReader
 * <br>
 * loads Expert Reader landing page<br>
 * Post/Redirect/Get (PRG) Pattern
 *
 * <br><br>
 * $LastChangedDate:: 						        $:  Date of last change<br>
 * $LastChangedRevision::                                               $:  Revision of last commit<br>
 * $Author:: markus                                                     $:  Author of last commit
 * 
 * @author Markus Rieder
 */


@WebServlet( name = "welcome_ExpertReader", urlPatterns ={    "/welcome_ExpertReader"} )


public class Welcome_ExpertReader extends HttpServlet {

 
    @Override
    protected void doGet( HttpServletRequest request,
            HttpServletResponse response ) throws ServletException, IOException {

             request.getRequestDispatcher( "/WEB-INF/views/welcome_ExpertReader.jsp" ).forward( request, response );
    }

}
