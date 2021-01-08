/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ie.irishliterature.DataTables.DataTableApplications;
import ie.irishliterature.dao.openApplicationDAO;
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
@WebServlet( name = "openApplicationPublisherDataServlet", urlPatterns =
{
    "/openApplicationPublisherDataServlet"
} )
public class openApplicationPublisherDataServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public openApplicationPublisherDataServlet()
    {

        super();
    }

    @Override
    @SuppressWarnings( "unchecked" )
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        System.out.println( "openApplicationPublisherDataServlet:  " );

        int publisherID = 0;

        HttpSession session = request.getSession();
        System.out.println( "############################### /openApplicationPublisherDataServlet ####################################" );

        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() )
        {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );

            System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + session.getValue( key ) );
            
            if(key.equals( "publisherID" )){
//                publisherID = (String) session.getValue("publisherID");
            }

        }

//            int publisherID = (Integer) request.getSession().getAttribute( "publisherID" );
             publisherID = Integer.parseInt(request.getParameter( "publisherID" ));


        System.out.println( "###################################################################" );

//        int pID = (Integer) session.getAttribute("publisherID");
//        String publisherID = (String) Integer.toString(pID);
//        String publisherID = String.valueOf(request.getSession().getAttribute("publisherID"));
//        publisherID = request.getParameter( "publisherID" );
        System.out.println( "openApplicationPublisherDataServlet publisherID: " + publisherID );

        response.setContentType( "application/json" );
        response.setCharacterEncoding( "UTF-8" );

        PrintWriter out = response.getWriter();

        List listApplications = null;

        try
        {
  System.out.println( "openApplicationPublisherDataServlet publisherID:2 " + publisherID );
            listApplications = openApplicationDAO.getAllApplicationsPublisher( publisherID );

//                System.out.println("ApplicationDataServlet listApplications: " + listApplications + " publisherID  "  + publisherID);
        }
        catch ( ClassNotFoundException | DBException | ParseException ex )
        {
            Logger.getLogger( openApplicationPublisherDataServlet.class.getName() ).log( Level.SEVERE, null, ex );
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
