/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ie.irishliterature.DataTables.DataTableApplications;
import ie.irishliterature.dao.closedApplicationDAO;
import ie.irishliterature.db.DBException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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
@WebServlet( name = "closedApplicationPublisherDataServlet", urlPatterns =
{
    "/closedApplicationPublisherDataServlet"
} )
public class ClosedApplicationPublisherDataServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ClosedApplicationPublisherDataServlet()
    {

        super();
    }

    @Override
    @SuppressWarnings( "unchecked" )
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        System.out.println( "closedApplicationPublisherDataServlet:  " );
        String publisherID = "";
        String Company_Number = publisherID;
        HttpSession session = request.getSession();

        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() )
        {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );
            if ( param.equals( "publisherID" ) )
            {
                publisherID = value;
            }
            System.out.println( "closedApplicationPublisherDataServlet Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        Enumeration<String> attributes = request.getSession().getAttributeNames();
        while ( attributes.hasMoreElements() )
        {
            String attribute = attributes.nextElement();
            System.out.println( "closedApplicationPublisherDataServlet attribute '" + attribute + " and Parameter Value is " + request.getSession().getAttribute( attribute ) );
        }

        publisherID = String.valueOf( request.getSession().getAttribute( "Company_Number" ) );
        System.out.println( "closedApplicationPublisherDataServlet Company_Number: " + Company_Number );
        System.out.println( "closedApplicationPublisherDataServlet publisherID: " + publisherID );

        response.setContentType( "application/json" );
        response.setCharacterEncoding( "UTF-8" );

        PrintWriter out = response.getWriter();

        List listApplications = null;

        try
        {

            listApplications = closedApplicationDAO.getAllApplicationsPublisher( publisherID );

        } catch ( ClassNotFoundException | DBException | ParseException ex )
        {
            Logger.getLogger( ClosedApplicationPublisherDataServlet.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DataTableApplications dta = new DataTableApplications();
        dta.setAaData( listApplications );

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson( dta );
        System.out.println( "json:  " + json );
        out.print( json );
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        // doGet(request, response);
    }
}
