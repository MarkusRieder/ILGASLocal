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


public class UpdateStatusDAO {

          public static boolean updateStatus( String cStatus, String referenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id;
        int committed = 0;
        ResultSet res = null;

        System.out.println( "doing updateStatus::  "  + cStatus + " ReferenceNumber  " + referenceNumber);
        try {
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = ( "UPDATE ILGAS.GrantApplication SET Status = ?" );
            sql += " WHERE ReferenceNumber = '" + referenceNumber + "'";
            
            ps1 = conn.prepareStatement( sql );
            ps1.setString( 1, cStatus);

            ps1.executeUpdate();

            conn.commit();

            id = committed > 0;

            DBConn.close( conn, ps1, res );

        }
        catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps1, res );
            throw new DBException( "UpdateStatusDAO updateStatus 4 Excepion while accessing database" + e );
        }
        
        return id;
    }
}
