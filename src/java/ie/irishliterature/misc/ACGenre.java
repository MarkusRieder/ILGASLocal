/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.misc;

import com.google.gson.Gson;
import ie.irishliterature.dao.ACCGenreDAO;
import ie.irishliterature.model.ACgenre;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
 *
 * AC for AutoComplete
 */
@WebServlet( urlPatterns = "/ACGenre" )
public class ACGenre extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ACGenre()
    {

        super();

    }

    @Override
    @SuppressWarnings( "unchecked" )
    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException
    {

        try {
            String text = request.getParameter( "term" );
            
            System.out.println( "ACGenre term:: " + text );
            
            ACCGenreDAO genreDAO = new ACCGenreDAO();
            
            
            
            ArrayList<ACgenre> genres = genreDAO.getGenre( text );

            genres.stream().map( ( genre ) ->
            {
                  System.out.println(genre.getValue());
                return genre;
            } ).forEachOrdered( ( ACgenre genre ) ->
            {
                      System.out.println(genre.getId());
            } );

            String searchResult = new Gson().toJson( genres );
            response.setContentType( "application/json" );
            response.setCharacterEncoding( "UTF-8" );
            PrintWriter writer = response.getWriter();
            writer.write( searchResult );
        }
        catch ( InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException ex ) {
            Logger.getLogger( ACGenre.class.getName() ).log( Level.SEVERE, null, ex );
        }



    }
}
