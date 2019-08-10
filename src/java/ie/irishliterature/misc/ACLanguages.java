/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.misc;

import com.google.gson.Gson;
import ie.irishliterature.dao.ACLanguagesDAO;
import ie.irishliterature.model.AClanguages;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author markus
 */
@WebServlet( name = "ACLanguages", urlPatterns =
{
    "/ACLanguages"
} )
public class ACLanguages extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ACLanguages()
    {

        super();

    }

    @Override
    @SuppressWarnings( "unchecked" )
    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
    {

        response.setContentType( "application/json" );
        response.setCharacterEncoding( "UTF-8" );

        String text = request.getParameter( "term" );

        System.out.println( "/ACLanguages term:: " + text );

        ACLanguagesDAO languagesDAO = new ACLanguagesDAO();

        try
        {

            ArrayList<AClanguages> languages = languagesDAO.getLanguage( text );

            languages.stream().map( ( language ) ->
            {
                System.out.println( language.getValue() );
                return language;
            } ).forEachOrdered( ( AClanguages language ) ->
            {
                System.out.println( language.getId() );
            } );

            String searchResult = new Gson().toJson( languages );

            PrintWriter writer = response.getWriter();
            writer.write( searchResult );

        } catch ( IOException | ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e )
        {
        }
    }
}
