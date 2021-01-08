/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.dao;

import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Publisher;
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
public class PublisherDAO {

    private static Connection connection;
    private static final Database db = new Database();

    protected static void connect() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                connection = db.getConnection();
            } catch (InstantiationException | IllegalAccessException | ClassNotFoundException ex) {
                Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    protected static void disconnect() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

//    private String id;
//    private String value;
//    private String Company;
//    private int Company_Number;
//    private String Address1;
//    private String Address2;
//    private String Address3;
//    private String Address4;
//    private String postCode;
//    private String City;
//    private String Country;
//    private String CountryCode;
//    private String Telephone;
//    private String Fax;
//    private String Email;
//    private String WWW;
//    private String DoNotMail;
//    private String Bursaries;
//    private String Founded;
//    private String NumberOfTitles;
//    private String DateModified;
//    private String Notes;
//    private String Status;
    public static ArrayList<Publisher> getPublisherDetails(String publisherID) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Publisher> listPublisher = new ArrayList<>();

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement("SELECT * FROM ILGAS.international_publishers WHERE Company_Number = ?");

            ps.setString(1, publisherID);

            rs = ps.executeQuery();

            while (rs.next()) {

                Publisher publisher = new Publisher();

                publisher.setCompany(rs.getString("Company"));
                publisher.setCompany_Number(rs.getInt("Company_Number"));
                publisher.setAddress1(rs.getString("Address1"));
                publisher.setAddress2(rs.getString("Address2"));
                publisher.setAddress3(rs.getString("Address3"));
                publisher.setAddress4(rs.getString("Address4"));
                publisher.setPostCode(rs.getString("postCode"));
                publisher.setCity(rs.getString("City"));
                publisher.setCountry(rs.getString("Country"));
                publisher.setCountryCode(rs.getString("CountryCode"));
                publisher.setTelephone(rs.getString("Telephone"));
                publisher.setFax(rs.getString("Fax"));
                publisher.setEmail(rs.getString("Email"));
                publisher.setWWW(rs.getString("WWW"));
                publisher.setDoNotMail(rs.getString("DoNotMail"));
                publisher.setBursaries(rs.getString("Bursaries"));
                publisher.setFounded(rs.getString("Founded"));
                publisher.setNumberOfTitles(rs.getString("NumberOfTitles"));
                publisher.setDateModified(rs.getString("DateModified"));
                publisher.setNotes(rs.getString("Notes"));
                publisher.setStatus(rs.getString("Status"));

                System.out.println("getPublisherDetails " + listPublisher.toString());

                listPublisher.add(publisher);
            }

            DBConn.close(conn, ps, rs);

        } catch (ClassNotFoundException | SQLException e) {
            DBConn.close(conn, ps, rs);
            System.err.println("Error: " + e);
            throw new DBException("getPublisherDetails 4 Excepion while accessing database");
        }

        return listPublisher;
    }

}
