/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.dao;

import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Genres;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author markus
 */
public class GenresDAO {

    private static Connection connection;
    private static final Database db = new Database();

    protected static void connect() throws SQLException
    {
        if ( connection == null || connection.isClosed() )
        {
            try
            {
                connection = db.getConnection();
            } catch ( InstantiationException | IllegalAccessException | ClassNotFoundException ex )
            {
                Logger.getLogger( GenresDAO.class.getName() ).log( Level.SEVERE, null, ex );
            }
        }
    }

    protected static void disconnect() throws SQLException
    {
        if ( connection != null && !connection.isClosed() )
        {
            connection.close();
        }
    }

    public static boolean insertGenre( String genre ) throws DBException
    {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        boolean id = false;
        ResultSet res = null;

        try
        {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            ps1 = conn.prepareStatement( "INSERT INTO ILGAS.genres ( genres ) "
                    + "VALUES( ? )" );

            ps1.setString( 1, genre );

            id = ps1.executeUpdate() > 0;

            conn.commit();
            DBConn.close( conn, ps1, ps2, res );

        } catch ( ClassNotFoundException | SQLException e )
        {
            DBConn.close( conn, ps1, ps2, res );
            e.printStackTrace();
            throw new DBException( "insertGenre 4 Excepion while accessing database" );
        }

        System.out.println( "insertGenre " + id );

        return id;

    }

    public static ArrayList<Genres> getAllGenres() throws DBException
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Genres> listGenres = new ArrayList<>();

        try
        {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT * FROM ILGAS.genres ORDER BY genres ASC" );
            rs = ps.executeQuery();

            while ( rs.next() )
            {

                Genres genres = new Genres();

                genres.setIdgenres( rs.getInt( "idgenres" ) );
                genres.setGenre( rs.getString( "genres" ) );

                listGenres.add( genres );
            }

            DBConn.close( conn, ps, rs );

        } catch ( ClassNotFoundException | SQLException e )
        {
            DBConn.close( conn, ps, rs );
            System.err.println( "Error: " + e );
            throw new DBException( "getAllGenres4 Excepion while accessing database" );
        }

        return listGenres;
    }

    public static boolean updateGenres( Genres genres, int idgenres ) throws DBException
    {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id;
        int committed = 0;
        ResultSet res = null;
        int idgenre = idgenres;

        System.out.println( "doing updateGenres::  " );
        try
        {
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = "UPDATE ILGAS.genres SET ( idgenres , genres ) VALUES ( ?,  ?)";
            sql += " WHERE idgenres = " + idgenre;

            ps1 = conn.prepareStatement( sql );

            ps1.setInt( 1, genres.getIdgenres() );
            ps1.setString( 2, genres.getGenre() );

            ps1.executeUpdate();

            conn.commit();

            id = committed > 0;

            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e )
        {
            DBConn.close( conn, ps1, res );
            throw new DBException( "updateGenres 4 Excepion while accessing database" );
        }

        return id;

    }

    public static boolean deleteGenre( int idgenres ) throws SQLException
    {

        Connection conn;
        PreparedStatement ps;
        boolean id = false;

        try
        {

            conn = DBConn.getConnection();

            String sql = "DELETE FROM ILGAS.genres where idgenres = ?";

            ps = conn.prepareStatement( sql );
            ps.setInt( 1, idgenres );

            id = ps.executeUpdate() > 0;
            ps.close();
            disconnect();

        } catch ( ClassNotFoundException ex )
        {
            Logger.getLogger( GenresDAO.class
                    .getName() ).log( Level.SEVERE, null, ex );
        }
        System.out.println( "deleteGenre " + id );
        return id;
    }
}
