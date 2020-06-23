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


/**
 *
 * @author Markus Rieder
 */


public class UpdateGenderDAO {

      public static boolean updateGender( String gender, String referenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id;
        int committed = 0;
        ResultSet res = null;

        System.out.println( "UpdateGenderDAO doing updateGender::  "  + gender + " ReferenceNumber  " + referenceNumber);
        try {
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = ( "UPDATE ILGAS.Author SET gender = ?" );
            sql += " WHERE ReferenceNumber = '" + referenceNumber + "'";
            
            ps1 = conn.prepareStatement( sql );
            ps1.setString( 1, gender);

            ps1.executeUpdate();

            conn.commit();

            id = committed > 0;

            DBConn.close( conn, ps1, res );

        }
        catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps1, res );
            throw new DBException( "UpdateGenderDAO updateGender 4 Excepion while accessing database" + e );
        }
        
        return id;
    }
}
