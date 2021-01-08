/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.dao;

import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author Markus Rieder
 */
public class UpdateGenderDAO {

    private static final Logger LOGGER = Logger.getLogger( UpdateGenderDAO.class.getName() );

    public static boolean updateGender( String gender, String referenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id = false;
        int committed = 0;
        ResultSet res = null;

        System.out.println( "UpdateGenderDAO calling updateGender::  " + gender + " referenceNumber  " + referenceNumber );

        int idAuthor = getAuthorId( referenceNumber ); // 32/2020  --->  1808
        boolean AuthorIsAlreadyInTable = checkAuthorIdInAuthor_Gender( idAuthor );

        System.out.println( "UpdateGenderDAO calling updateGender:: idAuthor  " + idAuthor + " AuthorIsAlreadyInTable  " + AuthorIsAlreadyInTable );

        if ( AuthorIsAlreadyInTable ) {

            System.out.println( "UpdateGenderDAO AuthorIsAlreadyInTable" );
            System.out.println( "UpdateGenderDAO doing updateGender::  " + gender + " idAuthor  " + idAuthor );

            try {

                conn = DBConn.getConnection();
                conn.setAutoCommit( false );

                String sql = ( "UPDATE ILGAS.Author_Gender SET gender = ?" );
                sql += " WHERE idAuthor = '" + idAuthor + "'";

                ps1 = conn.prepareStatement( sql );
                ps1.setString( 1, gender );

                ps1.executeUpdate();

                conn.commit();

                id = committed > 0;

                DBConn.close( conn, ps1, res );

            }
            catch ( ClassNotFoundException | SQLException e ) {
                DBConn.close( conn, ps1, res );
                throw new DBException( "UpdateGenderDAO updateGender 4 Excepion while accessing database" + e );
            }
        }
        else {
            System.out.println( "UpdateGenderDAO AuthorIs NOT AlreadyInTable" );
            putAuthorIdInAuthor_Gender( idAuthor, gender ); // 1808,Male, 32/2020
        }
        return id;

    }

    public static int getAuthorId( String referenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int authorId = 0;

        System.out.println( "UpdateGenderDAO getAuthorId:: for referenceNumber  " + referenceNumber );

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT idAuthor FROM ILGAS.Application_Author WHERE referenceNumber = ?" );
            ps.setString( 1, referenceNumber );
            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    authorId = res.getInt( 1 );
                }
            }

            System.out.println( "UpdateGenderDAO getAuthorId:: prepareStatement  " + ps );

            DBConn.close( conn, ps, res );
        }

        catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "3 Excepion while accessing database" );

        }

        System.out.println( "UpdateGenderDAO getAuthorId:: for referenceNumber  " + referenceNumber + " authorId  " + authorId );

        return authorId;
    }

    public static boolean checkAuthorIdInAuthor_Gender( int idAuthor ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        System.out.println( "UpdateGenderDAO checkAuthorIdInAuthor_Gender:: for idAuthor  " + idAuthor );
        boolean doesExist = false;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT idAuthor FROM ILGAS.Author_Gender WHERE idAuthor = ?" );
            ps.setInt( 1, idAuthor );
            res = ps.executeQuery();

            if ( res.next() == false ) {

                System.out.println( "ResultSet returns empty from Author_Gender" );

                doesExist = false;
            }
            else {

                do {
                    doesExist = true;
                }
                while ( res.next() );
            }

            DBConn.close( conn, ps, res );
        }
        catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "3 Excepion while accessing database" );
        }

        System.out.println( "UpdateGenderDAO checkAuthorIdInAuthor_Gender idAuthor " + idAuthor + " doesExist " + doesExist );

        return doesExist;
    }

    public static int putAuthorIdInAuthor_Gender( int idAuthor, String gender ) throws DBException {
        // 1808,Male, 32/2020
        Connection conn = null;
        PreparedStatement ps1 = null;
        ResultSet res = null;
//
//        String AuthorName = "";
        int numRows = 0;

        System.out.println( "UpdateGenderDAO putAuthorIdInAuthor_Gender idAuthor " + idAuthor + " gender " + gender );

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = " INSERT INTO  ILGAS.Author_Gender (idAuthor, gender) values (?,?)"; // 1808,Male

            ps1 = conn.prepareStatement( sql );
            ps1.setInt( 1, idAuthor );// 1808
            ps1.setString( 2, gender );// Male

            numRows = ps1.executeUpdate();

            conn.commit();

            System.out.println( "UpdateGenderDAO putAuthorIdInAuthor_Gender ps1 " + ps1 + " numRows " + numRows );

            DBConn.close( conn, ps1, res );
        }

        catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            System.out.println( "Got an exception!" );
            System.out.println( e.getMessage() );
            throw new DBException( "3 Excepion while accessing database" );
        }

        return numRows;
    }
}
