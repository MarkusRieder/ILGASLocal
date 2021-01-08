package ie.irishliterature.dao;

import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import ie.irishliterature.db.EntryDb;
import ie.irishliterature.model.GrantApplication;
import ie.irishliterature.model.TranslatorTracker;
import ie.irishliterature.model.User;
import ie.irishliterature.util.GlobalConstants;
import ie.irishliterature.util.MailUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import javax.mail.MessagingException;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

public class EntryDbDAO {

    private static final Logger LOGGER = Logger.getLogger( EntryDbDAO.class.getName() );

    private static List<GrantApplication> GrantApplicationData = null;

    private static ArrayList<String> titleList = new ArrayList<>();

    /**
     * 
     * @return size
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static int getSizeOfApplications() throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        int size = 0;

        try {
            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT COUNT(*) FROM ILGAS.GrantApplication" );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    size = res.getInt( 1 );

                }
            }

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );

        return size;
    }

    /**
     * 
     * @return
     * @throws ClassNotFoundException
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static List<GrantApplication> getAllApplications() throws ClassNotFoundException, DBException {
        int counter = 1;
        if ( GrantApplicationData == null ) {

            GrantApplicationData = new LinkedList<>();
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet res = null;

            ArrayList<String> translatorTrackId; // contains array with translator id's
            ArrayList<String> authorList;
            ArrayList<String> translatorNamesList;
            ArrayList<String> singleTranslatorTrackList;
            List<List<String>> translatorTrackList;
            List<List<String>> listOfTranslatorArray;
            List<List<String>> rightsAgreementArray;
            ArrayList<String> pressCoverage;
            ArrayList<String> translatorNameList;

            String searchQuery = "SELECT * FROM ILGAS.GrantApplication ORDER BY ApplicationYear";

            try {

                conn = DBConn.getConnection();

                ps = conn.prepareStatement( searchQuery );

                res = ps.executeQuery( searchQuery );

                while ( res.next() ) {

                    //  System.out.println("\n\n================================= Start: " + counter + "  =================================================\n\n");
                    GrantApplication application = new GrantApplication();

                    String ReferenceNumber = res.getString( "ReferenceNumber" );

                    application.setApplicationNumber( res.getInt( "ApplicationNumber" ) );
                    application.setApplicationYear( res.getString( "ApplicationYear" ) );
                    application.setReferenceNumber( ReferenceNumber );
                    application.setCompany( res.getString( "company" ) );
                    application.setPublisherID( res.getInt( "publisherID" ) );
                    application.setUserID( res.getInt( "userID" ) );

                    String[] bookTitle = getBookTitle( ReferenceNumber );
                    //  System.out.println("bookTitle:  " + bookTitle[0]);

                    application.setBookTitle( bookTitle[ 0 ] );

//                    ArrayList<String[]> documentListing = new ArrayList<>();
//
//                    documentListing = getDocuments(ReferenceNumber);
                    application.setAgreement( res.getString( "agreement" ) );
                    application.setAgreementDocName( res.getString( "agreementDocName" ) );
                    application.setContract( res.getString( "contract" ) );
                    application.setContractDocName( res.getString( "contractDocName" ) );
                    application.setProposedDateOfPublication( res.getDate( "proposedDateOfPublication" ) );
                    application.setProposedPrintRun( res.getInt( "proposedPrintRun" ) );
                    application.setPlannedPageExtent( res.getInt( "plannedPageExtent" ) );
                    application.setTranslatorCV( res.getString( "translatorCV" ) );
                    application.setTranslatorCVDocName( res.getString( "translatorCVDocName" ) );
                    application.setBreakDownTranslatorFee( res.getString( "breakDownTranslatorFee" ) );
                    application.setTranslatorFee( res.getBigDecimal( "translatorFee" ) );
                    String Notes = getBookNotes( ReferenceNumber );
                    application.setBookNotes( Notes );
                    application.setCopiesSent( res.getInt( "copiesSent" ) );
                    application.setDateCopiesWereSent( res.getDate( "dateCopiesWereSent" ) );
                    application.setCopiesTranslationSample( res.getString( "copiesTranslationSample" ) );
                    application.setCopiesTranslationSampleDocName( res.getString( "copiesTranslationSampleDocName" ) );
                    application.setTC_ACCEPTED( res.getInt( "TC_ACCEPTED" ) );
                    application.setAPPROVED( res.getInt( "APPROVED" ) );
                    application.setCover( res.getString( "cover" ) );
                    application.setCoverName( res.getString( "coverName" ) );
                    application.setOriginal( res.getString( "original" ) );
                    application.setOriginalName( res.getString( "originalName" ) );
                    application.setAddendumRightsAgreement( res.getString( "addendumRightsAgreement" ) );
                    application.setAddendumRightsAgreementName( res.getString( "addendumRightsAgreementName" ) );
                    application.setProofOfPaymentToTranslator( res.getString( "proofOfPaymentToTranslator" ) );
                    application.setProofOfPaymentToTranslatorName( res.getString( "proofOfPaymentToTranslatorName" ) );
                    application.setBankDetailsForm( res.getString( "bankDetailsForm" ) );
                    application.setBankDetailsFormName( res.getString( "bankDetailsFormName" ) );
                    application.setSignedLIContract( res.getString( "signedLIContract" ) );
                    application.setSignedLIContractName( res.getString( "signedLIContractName" ) );
                    application.setPublicationYear( res.getString( "publicationYear" ) );
                    application.setOriginalLanguage( res.getString( "originalLanguage" ) );
                    application.setOriginalPageExtent( res.getInt( "originalPageExtent" ) );
                    application.setCountryOfPublication( res.getString( "countryOfPublication" ) );
                    application.setForeignPublisher( res.getString( "foreignPublisher" ) );
                    application.setForeignCountry( res.getString( "foreignCountry" ) );
                    application.setTargetLanguage( res.getString( "targetLanguage" ) );
                    application.setAmountRequested( res.getBigDecimal( "amountRequested" ) );
                    application.setAward( res.getInt( "award" ) );
                    application.setSalesFigures( res.getInt( "salesFigures" ) );
                    application.setPreviousGrantAid( getPreviousGrantAid( ReferenceNumber ) );
                    application.setGenre( bookTitle[ 1 ] );
                    application.setBoardComments_Instructions( res.getString( "boardComments_Instructions" ) );

                    String expertReaderName = getExpertReaderName( ReferenceNumber );

                    application.setExpertReaderName( expertReaderName );

                    ArrayList<String> rightsAgreementList;
                    rightsAgreementArray = new ArrayList<>();

                    rightsAgreementList = getRightsAgreement( ReferenceNumber );
                    rightsAgreementArray.add( rightsAgreementList );

                    application.setRightsAgreement( rightsAgreementList );
                    /*
                     * get all idTranslator id's for that ReferenceNumber return
                     * ArrayList
                     * translatorTrackId: [500, 1166, 1164, 1165]
                     */
                    translatorTrackId = getTranslatorTrackId( ReferenceNumber );

                    translatorNamesList = new ArrayList<>();

                    authorList = getAuthors( ReferenceNumber );
                    application.setAuthor( authorList );

                    String[] authorName = getAuthorName( ReferenceNumber );

                    application.setAuthorName( authorName[ 0 ] );
                    application.setAuthorFirstName( authorName[ 1 ] );
                    application.setAuthorFirstName( authorName[ 2 ] );

                    System.out.println( "setAuthorName:  " + authorName[ 0 ] );
                    System.out.println( "setAuthorFirstName:  " + authorName[ 1 ] );
                    System.out.println( "setAuthorFirstName:  " + authorName[ 2 ] );

                    ArrayList<String> translatorDocsList;
                    listOfTranslatorArray = new ArrayList<>();
                    translatorDocsList = getTransDocs( ReferenceNumber );

                    listOfTranslatorArray.add( translatorDocsList );

                    translatorTrackList = new ArrayList<>();
                    /*
                     * iterate through all translators in translatorTrackId
                     */
                    for ( int i = 0; i < translatorTrackId.size(); i++ ) {

                        translatorNameList = new ArrayList<>();

                        titleList = new ArrayList<>();

                        String translatorNameForList = getTranslatorNames( translatorTrackId.get( i ) );

                        translatorNamesList.add( translatorNameForList );

                        translatorNameList.add( translatorNameForList );

//                        singleTranslatorTrackList.clear();
                        singleTranslatorTrackList = getTranslatorTracker( translatorTrackId.get( i ) );
                        translatorTrackList.add( singleTranslatorTrackList );

                        titleList = getTitles( ReferenceNumber );

                    }

                    application.setTransList( listOfTranslatorArray );
                    application.setTranslatorName( translatorNamesList );
                    application.setTranslatorTrack2( translatorTrackList );

                    List<String[]> expertReaderList;
                    expertReaderList = getExpertReader( ReferenceNumber );
                    application.setExpertReaderList( expertReaderList );

                    for ( int d = 0; d < expertReaderList.size(); d++ ) {
                        String[] strings = expertReaderList.get( d );
                        System.out.println( "Array:  " + d );
                        application.setExpertReaderList( expertReaderList );
                        for ( int j = 0; j < strings.length; j++ ) {
                            System.out.print( "expertReaderList :  " + strings[ j ] + " j: " + j );
                        }
                        System.out.println();
                    }
                    List<String> unassignedExpertReaderList;
                    unassignedExpertReaderList = getUnassignedExpertReader();

                    pressCoverage = getPressCoverage( ReferenceNumber );
                    application.setPressCoverage( pressCoverage );

                    application.setUnassignedExpertReaderList( unassignedExpertReaderList );
//                    application.setTranslatorTitles(mixedList);

//                   //  System.out.println("==================================================================================>");
//                   //  System.out.println("ReferenceNumber   " + ReferenceNumber);
//                   //  System.out.println("mixedList         " + mixedList);
//                   //  System.out.println("titleList         " + titleList);
//                   //  System.out.println("<==================================================================================");
                    application.setTitles( titleList );
                    application.setStatus( res.getString( "Status" ) );
                    application.setNotesAboutApplication( res.getString( "notesAboutApplication" ) );
                    application.setApproveWithdrawnReject( res.getString( "approveWithdrawnReject" ) );
                    application.setDirectorChairDecision( res.getInt( "directorChairDecision" ) );

                    GrantApplicationData.add( application );
                    //  System.out.println("================================= End: " + counter + "  =================================================>");
                    counter++;
                }

            } catch ( ClassNotFoundException | SQLException e ) {
                LOGGER.debug( e.getMessage() );
                DBConn.close( conn, ps, res );
                throw new DBException( "12 Excepion while accessing database" );
            }

            DBConn.close( conn, ps, res );
        }

        return GrantApplicationData;
    }

    /**
     * 
     * @return
     * @throws ClassNotFoundException
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static List<EntryDb> getEntryDb() throws ClassNotFoundException, DBException {
        System.out.println( "getEntryDb" );

        List<EntryDb> retList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        String ReferenceNumber = "";
        String company = "";
        String bookTitle = "";
        String Status = "";
        String Author = "";
        int counter = 0;
        String authorList;

        String searchQuery;

        searchQuery = "SELECT ReferenceNumber, company, Status  FROM ILGAS.GrantApplication ORDER BY ApplicationYear";
        System.out.println( "EntryDbDAO  getEntryDb searchQuery  " + searchQuery );

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( searchQuery );

            res = ps.executeQuery( searchQuery );

            while ( res.next() ) {
                counter++;
                EntryDb entries = new EntryDb( ReferenceNumber, company, bookTitle, Status, Author );

                ReferenceNumber = res.getString( "ReferenceNumber" );
                entries.setReferenceNumber( ReferenceNumber );
                entries.setCompany( res.getString( "company" ) );

                String[] bookTitles = getBookTitle( ReferenceNumber );
                entries.setBookTitle( bookTitles[ 0 ] );
                authorList = getAuthor( ReferenceNumber );
                entries.setAuthor( authorList );
                entries.setStatus( res.getString( "Status" ) );
                retList.add( entries );
            }

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );
        System.out.println( "EntryDbDAO  counter  " + counter );

        return retList;
    }

    /**
     * 
     * @param appRef
     * @return 
     */
    public static String getAuthor( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * authorList returns a list with all authors for a specific
         * ReferenceNumber
         */
        String authorList = "";

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT DISTINCT Author.Name\n"
                    + "FROM ILGAS.Author, ILGAS.Application_Author\n"
                    + "WHERE Application_Author.idAuthor = Author.idAuthor\n"
                    + "AND Application_Author.ReferenceNumber =  ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    authorList = authorList + " " + res.getString( 1 );

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( EntryDbDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return authorList.trim();
    }

    /**
     * 
     * @param status
     * @return
     * @throws ClassNotFoundException
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static List<EntryDb> getEntryDb1( String status ) throws ClassNotFoundException, DBException {
        System.out.println( "getEntryDb1" );

        List<EntryDb> retList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        String ReferenceNumber = "";
        String company = "";
        String bookTitle = "";
        String Status = "";
        String Author = "";
        int counter = 0;
        String authorList;

        String searchQuery;

        searchQuery = "SELECT ReferenceNumber, company, Status  FROM ILGAS.GrantApplication WHERE Status ='" + status + "' ORDER BY ApplicationYear";
        System.out.println( "EntryDbDAO  getEntryDb searchQuery  " + searchQuery );

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( searchQuery );

            res = ps.executeQuery( searchQuery );

            while ( res.next() ) {
                counter++;
                EntryDb entries = new EntryDb( ReferenceNumber, company, bookTitle, Status, Author );

                ReferenceNumber = res.getString( "ReferenceNumber" );
                entries.setReferenceNumber( ReferenceNumber );
                entries.setCompany( res.getString( "company" ) );

                String[] bookTitles = getBookTitle( ReferenceNumber );
                entries.setBookTitle( bookTitles[ 0 ] );
                authorList = getAuthor( ReferenceNumber );
                entries.setAuthor( authorList );
                entries.setStatus( res.getString( "Status" ) );
                retList.add( entries );
            }

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );
        System.out.println( "EntryDbDAO  counter  " + counter );

        return retList;
    }

    /**
     * 
     * @param app
     * @param ApplicationNumber
     * @param applicationYear
     * @return
     * @throws SQLException
     * @throws DBException 
     */
    public static boolean updateApplicationOld( GrantApplication app, String ApplicationNumber, String applicationYear ) throws SQLException, DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id = false;
        int committed = 0;
        ResultSet res = null;

        Set<String> VALUES = new HashSet<>( Arrays.asList(
                new String[]{
                    "ApplicationNumber", "ApplicationYear", "ReferenceNumber", "company", "publisherID", "userID", "agreement", "agreementDocName", "contract", "contractDocName", "proposedDateOfPublication", "proposedPrintRun", "plannedPageExtent", "translatorCV", "translatorCVDocName", "numberOfPages", "translatorFee", "breakDownTranslatorFee", "Notes", "copiesSent", "dateCopiesWereSent", "Original", "OriginalName",
                    "copiesTranslationSample", "copiesTranslationSampleDocName", "gdpr_ACCEPTED", "TC_ACCEPTED", "APPROVED", "Status", "Cover", "CoverName",
                    "originalDateOfPublication", "publicationYear", "originalLanguage", "originalPageExtent", "countryOfPublication", "foreignPublisher", "foreignCountry",
                    "targetLanguage", "boardMeeting", "amountRequested", "amountApproved", "publisherInformedOfMeeting", "boardComments_Instructions",
                    "contractSentToPublisher", "acknowledgementApproved", "datePublishedBooksReceived", "datePaymentMadeToPublisher", "paymentReferenceNumber",
                    "addendumRightsAgreement", "addendumRightsAgreementName", "proofOfPaymentToTranslator", "proofOfPaymentToTranslatorName", "bankDetailsForm",
                    "bankDetailsFormName", "signedLIContract", "signedLIContractName", "paymentStatus", "previousGrantAid", "award", "salesFigures", "lastUpdated",
                    "Recommendation", "Created", "bilingual", "notesAboutApplication", "approveWithdrawnReject", "directorChairDecision"
                }
        ) );
        int counter = 1;
        System.out.printf( "we are here  updateApplication   " );

        String prepStat = "UPDATE ILGAS.GrantApplication SET";

        System.out.printf( "xxx  app.getClass().getDeclaredFields().length  " + app.getClass().getDeclaredFields().length );
        int setLength = app.getClass().getDeclaredFields().length;
        for ( java.lang.reflect.Field field : app.getClass().getDeclaredFields() ) {
            try {
                field.setAccessible( true );

                String col = field.getName();
                Object value = field.get( app );
                System.out.printf( "xxx  " + counter + ":  Field name: %s, Field value: %s%n", col, value );

                if ( VALUES.contains( col ) ) {
                    if ( counter < setLength - 1 ) {
                        if ( !"ApplicationNumber".equals( col ) && !"ApplicationYear".equals( col ) ) {
                            if ( value != null ) {
                                prepStat = prepStat + " " + col + " = IFNULL(" + col + ",'" + value + "'), ";
                            }
                        }
                    } else {
//                        if (value != null) {
                        prepStat = prepStat + " " + col + " = IFNULL(" + col + ",'" + value + "') ";
                        System.out.printf( "xxx last prepStat " + prepStat );
//                        }
                    }
                }

                counter++;

            } catch ( IllegalArgumentException | IllegalAccessException ex ) {
                java.util.logging.Logger.getLogger( openApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
            }

        }

        prepStat += " WHERE ApplicationYear = " + applicationYear + " ";
        prepStat += " AND ApplicationNumber = " + ApplicationNumber + ";";

        System.out.printf( "xxx  prepStat " + prepStat );
        try {
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            ps1 = conn.prepareStatement( prepStat ); //      .prepareStatement(prepStat);

            ps1.executeUpdate();

            conn.commit();

            id = committed > 0;

            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps1, res );
            throw new DBException( "4 Excepion while accessing database" + e );
        }

        return id;
    }

    /**
     * 
     * @param app
     * @param ApplicationNumber
     * @param applicationYear
     * @return
     * @throws SQLException
     * @throws DBException
     * @throws MessagingException
     * @throws ClassNotFoundException 
     */
    public static boolean updateApplication( GrantApplication app, String ApplicationNumber, String applicationYear ) throws SQLException, DBException, MessagingException, ClassNotFoundException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id = false;
        int committed = 0;
        ResultSet res = null;
        java.sql.Timestamp timestamp = getcurrentTimeStamp();

        String author = "";
        String title = "";
        String language = "";
        String first_name = "";

        System.out.printf( "updateApplication we are here  updateApplication   " );
        System.out.printf( "updateApplication app.getApproveWithdrawnReject()   " + app.getApproveWithdrawnReject() );

        try {
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String updateQuery = "UPDATE  ILGAS.GrantApplication  SET ";
            if ( null != app.getBoardMeeting() ) {
                updateQuery += " boardMeeting = '" + app.getBoardMeeting() + "',";
            }
            if ( null != app.getPublisherInformedOfMeeting() ) {
                updateQuery += " publisherInformedOfMeeting = '" + app.getPublisherInformedOfMeeting() + "',";
            }
            if ( null != app.getContractSentToPublisher() ) {
                updateQuery += " contractSentToPublisher = '" + app.getContractSentToPublisher() + "',";
            }
            if ( null != app.getAcknowledgementApproved() ) {
                updateQuery += " acknowledgementApproved = '" + app.getAcknowledgementApproved() + "',";
            }
            if ( null != app.getDatePublishedBooksReceived() ) {
                updateQuery += " datePublishedBooksReceived ='" + app.getDatePublishedBooksReceived() + "',";
            }
            if ( null != app.getDatePaymentMadeToPublisher() ) {
                updateQuery += " datePaymentMadeToPublisher ='" + app.getDatePaymentMadeToPublisher() + "',";
            }
            if ( app.getAmountApproved().signum() > 0.00 ) {
                updateQuery += " amountApproved ='" + app.getAmountApproved() + "',";
            }
            if ( !"".equals( app.getBoardComments_Instructions() ) ) {
                updateQuery += " boardComments_Instructions ='" + app.getBoardComments_Instructions() + "',";
            }
            if ( !"".equals( app.getPaymentReferenceNumber() ) ) {
                updateQuery += " paymentReferenceNumber ='" + app.getPaymentReferenceNumber() + "',";
            }
            if ( null != app.getPaymentStatus() ) {
                updateQuery += " paymentStatus ='" + app.getPaymentStatus() + "',";
            }

            updateQuery += " award ='" + app.getAward() + "',";

            if ( app.getProposedPrintRun() > 0 ) {
                updateQuery += " proposedPrintRun ='" + app.getProposedPrintRun() + "',";
            }
            if ( app.getPlannedPageExtent() > 0 ) {
                updateQuery += " plannedPageExtent ='" + app.getPlannedPageExtent() + "',";
            }

            updateQuery += " notesAboutApplication ='" + app.getNotesAboutApplication() + "',";
            System.out.println( "updateApplication  notesAboutApplication :" + " notesAboutApplication ='" + app.getNotesAboutApplication() + "'" );

//            updateQuery += " Status ='" + app.getStatus() + "',";
            if ( null != app.getApproveWithdrawnReject() ) {
                updateQuery += "approveWithdrawnReject ='" + app.getApproveWithdrawnReject() + "',";
            }

            updateQuery += " directorChairDecision ='" + app.getDirectorChairDecision() + "',";
            System.out.println( "updateApplication  APPROVED :" + " APPROVED = " + app.getAPPROVED() + "," );
            updateQuery += " APPROVED = " + app.getAPPROVED() + ",";
            updateQuery += " lastUpdated ='" + timestamp + "'";

            updateQuery += "  WHERE ApplicationYear = '" + applicationYear + "'  AND ApplicationNumber = '" + ApplicationNumber + "';";

            System.out.println( "updateApplication  ps1:  1: " + updateQuery );

            ps1 = conn.prepareStatement( updateQuery ); //      .prepareStatement(prepStat);

            ps1.executeUpdate();

            conn.commit();

            id = committed > 0;
            System.out.println( "updateApplication  id  1: " + id );
            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps1, res );
            throw new DBException( "EntryDbDAO updateApplication 4 Excepion while accessing database" + e );
        }

        String approveWithdrawnRejectSelected = app.getApproveWithdrawnReject();
        System.out.println( "updateApplication  approveWithdrawnReject " + approveWithdrawnRejectSelected );

        String referenceNumber = ApplicationNumber + "/" + applicationYear;
        System.out.println( "updateApplication getReferenceNumber " + referenceNumber );

        String amountApproved = new DecimalFormat( "#0.00" ).format( app.getAmountApproved() );
        System.out.println( "updateApplication amountApproved " + amountApproved );

        String[] emailDataArray;
        System.out.println( "updateApplication get emailDataArray " );
        emailDataArray = ACpublisherDAO_test.getpublisherByReferenceNumber( referenceNumber );

        String Full_Name = emailDataArray[ 0 ];
        String email = emailDataArray[ 1 ];

        System.out.println( "updateApplication get Full_Name " + Full_Name );
        System.out.println( "updateApplication get email " + email );
        System.out.println( "updateApplication get referenceNumber " + referenceNumber );

        if ( !approveWithdrawnRejectSelected.isEmpty() ) {

            /*
             * get the data for
             * author, title, language, first_name ;
             * needed for the emails
             */
            conn = null;
            ps1 = null;
            res = null;

            try {

                conn = DBConn.getConnection();

                ps1 = conn.prepareStatement( "SELECT Name FROM ILGAS.Author WHERE ReferenceNumber = ?" );
                ps1.setString( 1, referenceNumber );

                res = ps1.executeQuery();

                while ( res.next() ) {

                    author = res.getString( "name" );

                    System.out.println( "updateApplication get author " + author );

                }

            } catch ( SQLException e ) {

                System.out.println( "updateApplication LOGGER.fatal " + e.getMessage() );
                LOGGER.fatal( e.getMessage() );
                DBConn.close( conn, ps1, res );
                throw new DBException( "12 Excepion while accessing database" );
            }

            DBConn.close( conn, ps1, res );

            conn = null;
            ps1 = null;
            res = null;

            try {

                conn = DBConn.getConnection();

                ps1 = conn.prepareStatement( "SELECT library.Title FROM ILGAS.library WHERE library.referenceNumber = ?" );
                ps1.setString( 1, referenceNumber );

                res = ps1.executeQuery();

                while ( res.next() ) {

                    title = res.getString( "Title" );

                    System.out.println( "updateApplication get title " + title );

                }

            } catch ( ClassNotFoundException | SQLException e ) {

                System.out.println( "updateApplication LOGGER.fatal " + e.getMessage() );
                LOGGER.fatal( e.getMessage() );
                DBConn.close( conn, ps1, res );
                throw new DBException( "12 Excepion while accessing database" );
            }

            DBConn.close( conn, ps1, res );

            conn = null;
            ps1 = null;
            res = null;

            try {

                conn = DBConn.getConnection();

                ps1 = conn.prepareStatement( "SELECT GrantApplication.targetLanguage FROM ILGAS.GrantApplication WHERE GrantApplication.ReferenceNumber = ?" );
                ps1.setString( 1, referenceNumber );

                res = ps1.executeQuery();

                while ( res.next() ) {

                    language = res.getString( "targetLanguage" );

                    System.out.println( "updateApplication get language " + language );
                }

            } catch ( ClassNotFoundException | SQLException e ) {

                System.out.println( "updateApplication LOGGER.fatal " + e.getMessage() );
                LOGGER.fatal( e.getMessage() );
                DBConn.close( conn, ps1, res );
                throw new DBException( "12 Excepion while accessing database" );
            }

            DBConn.close( conn, ps1, res );

            conn = null;
            ps1 = null;
            res = null;

            try {

                conn = DBConn.getConnection();

                ps1 = conn.prepareStatement( "SELECT first_name FROM\n"
                        + " ILGAS.users usr\n"
                        + " INNER JOIN\n"
                        + " ILGAS.GrantApplication grnt ON usr.userID = grnt.userID\n"
                        + " WHERE grnt.ReferenceNumber = ?" );
                ps1.setString( 1, referenceNumber );

                res = ps1.executeQuery();

                while ( res.next() ) {

                    first_name = res.getString( "first_name" );
                    System.out.println( "updateApplication get first_name " + first_name );
                }

            } catch ( ClassNotFoundException | SQLException e ) {

                LOGGER.fatal( e.getMessage() );
                DBConn.close( conn, ps1, res );
                throw new DBException( "12 Excepion while accessing database" );
            }

            DBConn.close( conn, ps1, res );

            System.out.println( "updateApplication approveWithdrawnRejectSelected approveWithdrawnRejectSelected " + approveWithdrawnRejectSelected );
            if ( approveWithdrawnRejectSelected.equals( "Approved" ) ) {

                /* When an award is made, the application becomes both 'approved' and 'pending'.  */
                String searchQuery = "UPDATE ILGAS.GrantApplication SET Status = 'pending' WHERE ReferenceNumber = ? ";
                System.out.println( "updateApplication approveWithdrawnRejectSelected searchQuery " + searchQuery );
                try {

                    conn = DBConn.getConnection();
                    ps1 = conn.prepareStatement( searchQuery );
                    ps1.setString( 1, referenceNumber );
                    ps1.executeUpdate();

                } catch ( ClassNotFoundException | SQLException e ) {

                    LOGGER.fatal( e.getMessage() );
                    DBConn.close( conn, ps1, res );
                    throw new DBException( "12 Excepion while accessing database" );
                }

                DBConn.close( conn, ps1, res );

                System.out.println( "updateApplication approveWithdrawnRejectSelected Approved " );
                MailUtil.informPublisherAwarded( Full_Name, first_name, email, amountApproved, referenceNumber, author, title, language );
            }

            System.out.println( "updateApplication approveWithdrawnRejectSelected approveWithdrawnRejectSelected " + approveWithdrawnRejectSelected );
            if ( approveWithdrawnRejectSelected.equals( "Rejected" ) ) {

              /* When an application is rejected, it becomes both 'rejected' and 'closed'. */
                String searchQuery = "UPDATE ILGAS.GrantApplication SET Status = 'closed' WHERE ReferenceNumber = ? ";
                System.out.println( "updateApplication approveWithdrawnRejectSelected searchQuery " + searchQuery );
                try {

                    conn = DBConn.getConnection();
                    conn = DBConn.getConnection();
                    ps1 = conn.prepareStatement( searchQuery );
                    ps1.setString( 1, referenceNumber );

                    ps1.executeUpdate();

                } catch ( ClassNotFoundException | SQLException e ) {
                    LOGGER.fatal( e.getMessage() );
                    DBConn.close( conn, ps1, res );
                    throw new DBException( "12 Excepion while accessing database" );
                }

                DBConn.close( conn, ps1, res );

                System.out.println( "updateApplication approveWithdrawnRejectSelected Rejected " );
                MailUtil.informPublisherRejected( Full_Name, first_name, email, amountApproved, referenceNumber, author, title, language );
            }
        }
        System.out.println( "updateApplication id  " + id );
        return id;

    }

    /**
     * 
     * @param appRef
     * @return bookNotes
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static String getBookNotes( String appRef ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        String bookNotes = "";

        try {
            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT referenceNumber, Notes FROM ILGAS.library WHERE referenceNumber = ?" );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    bookNotes = res.getString( 2 );

                }

            }

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );

        return bookNotes;
    }

    /**
     * 
     * @param appRef
     * @return previousGrantAid
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static ArrayList<String> getPreviousGrantAid( String appRef ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        int idx = 1;

        /*
         * previousGrantAid
         * author name, title, application year, amount awarded, etc
         */
        ArrayList<String> previousGrantAid = new ArrayList<>();

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "# previousGrantAid\n"
                    + "# author name, title, application year, amount awarded, etc \n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "SELECT \n"
                    + "a.Name as Author,\n"
                    + "l.Title  as Booktitle,\n"
                    + "    ApplicationYear,\n"
                    + "    amountApproved\n"
                    + "    \n"
                    + "FROM\n"
                    + "    ILGAS.GrantApplication g,\n"
                    + "    ILGAS.Application_Author aa,\n"
                    + "    ILGAS.Author a,\n"
                    + "    ILGAS.library l\n"
                    + "WHERE\n"
                    + "    g.ReferenceNumber = ?\n"
                    + "    AND\n"
                    + "    l.referenceNumber = g.ReferenceNumber\n"
                    + "    AND aa.ReferenceNumber = g.ReferenceNumber\n"
                    + "    AND a.idAuthor = aa.idAuthor\n"
                    + "    AND g.amountApproved > 0.00 " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    previousGrantAid.add( idx + ".  - " + res.getString( 1 ) + ", " + res.getString( 2 ) + ", " + res.getString( 3 ) + ", " + res.getString( 4 ) + "\n" );
                    idx++;
                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        System.out.print( "EntryDbDAO  previousGrantAid :  " + previousGrantAid.toString() );

        return previousGrantAid;
    }

    /**
     * 
     * @param TranslatorTrackId
     * @return testList
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static ArrayList getTranslatorTrack( String TranslatorTrackId ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        ArrayList testList = new ArrayList<>();
        ArrayList<String> auth = new ArrayList<>();
        TranslatorTracker translatorTracker;

        try {
            conn = DBConn.getConnection();

            translatorTracker = new TranslatorTracker();

            ps = conn.prepareStatement( "SELECT DISTINCT Translator.Name, TranslatorTrack.Title, TranslatorTrack.ReferenceNumber FROM ILGAS.Translator, ILGAS.TranslatorTrack WHERE TranslatorTrack.idTranslator = Translator.idTranslator AND TranslatorTrack.idTranslator = ?" );
            ps.setString( 1, TranslatorTrackId );

            res = ps.executeQuery();

            translatorTracker.setTranslatorID( TranslatorTrackId );

            int idx = 0;

            if ( res != null ) {
                while ( res.next() ) {

                    testList.add( res.getString( 1 ) );

                }

            }

            translatorTracker.setTitles( titleList );         

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );

        return testList;
    }

    /**
     * 
     * @param appRef
     * @return titles
     */
    public static ArrayList<String> getTitles( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * getTitles returns a list with all Titles for a specific
         * ReferenceNumber
         */
        ArrayList<String> titles = new ArrayList<>();

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT DISTINCT\n"
                    + " TranslatorTrack.Title\n"
                    + " FROM\n"
                    + " ILGAS.TranslatorTrack\n"
                    + " WHERE\n"
                    + " TranslatorTrack.ReferenceNumber = ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    titles.add( res.getString( 1 ) );

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return titles;
    }

    /**
     * 
     * @param translatorTrackId
     * @return aTranslatorName
     * @throws ClassNotFoundException
     * @throws SQLException 
     */
    public static String getTranslatorNames( String translatorTrackId ) throws ClassNotFoundException, SQLException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * getTranslatorNames returns a list with all translator names for a
         * specific translatorTrackId
         */
        String aTranslatorName = "";

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT Translator.Name FROM ILGAS.Translator WHERE  Translator.idTranslator = ? " );

            ps.setString( 1, translatorTrackId );

            res = ps.executeQuery();

            if ( res != null ) {
                if ( res.next() ) {

                    aTranslatorName = res.getString( 1 );

                }
            }

        } catch ( SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return aTranslatorName;
    }

    /**
     * 
     * @param appRef
     * @return translatorTrackID
     */
    public static ArrayList<String> getTranslatorTrackId( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * translatorTrackID returns a list with all translators for a specific
         * ReferenceNumber
         */
        ArrayList<String> translatorTrackID = new ArrayList<>();

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT Translator.idTranslator\n"
                    + " FROM ILGAS.Translator, ILGAS.TranslatorTrack\n"
                    + " WHERE TranslatorTrack.idTranslator = Translator.idTranslator\n"
                    + " AND TranslatorTrack.ReferenceNumber = ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    translatorTrackID.add( res.getString( 1 ) );

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        System.out.println( "EntryDbDAO getTranslatorTrackId " + translatorTrackID );

        return translatorTrackID;
    }

    /**
     * 
     * @param appRef
     * @return authorList
     */
    public static ArrayList<String> getAuthors( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * authorList returns a list with all authors for a specific
         * ReferenceNumber
         */
        ArrayList<String> authorList = new ArrayList<>();

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT Author.Name\n"
                    + "FROM ILGAS.Author, ILGAS.Application_Author\n"
                    + "WHERE Application_Author.idAuthor = Author.idAuthor\n"
                    + "AND Application_Author.ReferenceNumber =  ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    authorList.add( res.getString( 1 ) );

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return authorList;
    }

    /**
     * 
     * @param appRef
     * @return authorName
     */
    public static String[] getAuthorName( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * getBookTitle returns a String[] with the Name, FirstName and LastName for the Author of a
         * specific ReferenceNumber
         */
        String[] authorName = new String[ 3 ];

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT Author.Name, Author.FirstName , Author.LastName\n"
                    + "FROM ILGAS.Author\n"
                    + "WHERE Author.ReferenceNumber =  ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    authorName[ 0 ] = res.getString( 1 ); // Author.Name
                    authorName[ 1 ] = res.getString( 2 ); // Author.FirstName
                    authorName[ 2 ] = res.getString( 3 ); // Author.LastName

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return authorName;
    }

    /**
     * 
     * @param appRef
     * @return expertReaderName
     */
    public static String getExpertReaderName( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * expertReaderName returns a list with the expertReaderName for a
         * specific
         * ReferenceNumber
         */
        String expertReaderName = "";

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT CONCAT(first_name, ' ', last_name) AS `expertReaderName` FROM ILGAS.users, ILGAS.expertReader\n"
                    + "WHERE expertReader.expertReaderUserID = users.userID\n"
                    + "AND expertReader.referenceNumber = ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    expertReaderName = res.getString( 1 );

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return expertReaderName;
    }

    /**
     * 
     * @param appRef
     * @return bookTitle
     */
    public static String[] getBookTitle( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * getBookTitle returns a String[] with the bookTitle and Genre for a
         * specific ReferenceNumber
         */
        String[] bookTitle = new String[ 2 ];

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT Title,Genre FROM ILGAS.library\n"
                    + "WHERE library.referenceNumber  = ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    bookTitle[ 0 ] = res.getString( 1 );
                    bookTitle[ 1 ] = res.getString( 2 );

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return bookTitle;
    }

    /**
     * 
     * @param appRef
     * @return expertReaderList
     */
    public static List<String[]> getExpertReader( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * expertReaderList returns a list with the expertReaderName for a
         * specific ReferenceNumber
         */
        List<String[]> expertReaderList = new ArrayList<>();
        String[] indExpertReaderList;

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT referenceNumber, fileDestination, sampleSentOut, sampleReturned, summaryReport, "
                    + "CONCAT(first_name, ' ', last_name) AS `expertReaderName` FROM ILGAS.expertReader, ILGAS.users\n"
                    + "WHERE expertReaderUserID = userID\n"
                    + "AND referenceNumber  = ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            ResultSetMetaData metadata = res.getMetaData();
            int numcols = metadata.getColumnCount();

            while ( res.next() ) {

                indExpertReaderList = new String[ 7 ];

                int i = 1;

                while ( i <= numcols ) {

                    indExpertReaderList[ i ] = res.getString( i++ );

                }

                expertReaderList.add( indExpertReaderList );

            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return expertReaderList;
    }

    /**
     * 
     * @return UnassignedExpertReader
     */
    public static List<String> getUnassignedExpertReader() {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        
        /*
         * getUnassignedExpertReader returns a list with the expertReaderName
         * NOT
         * assigned to any reference number at the moment
         */
        List<String> UnassignedExpertReaderList = new ArrayList<>();

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT  CONCAT(first_name, ' ', last_name) AS `expertReaderName` FROM ILGAS.users\n"
                    + "LEFT JOIN ILGAS.expertReader ON users.userID = expertReader.expertReaderUserID\n"
                    + "WHERE expertReader.expertReaderUserID IS NULL\n"
                    + "AND users.function = 'Expert Reader'" );

            res = ps.executeQuery();

            while ( res.next() ) {

                UnassignedExpertReaderList.add( res.getString( 1 ) );

            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return UnassignedExpertReaderList;
    }

    /**
     * 
     * @param TranslatorTrackId
     * @return TranslatorTracker
     * @throws DBException 
     */
    @SuppressWarnings("unchecked")
    public static ArrayList<String> getTranslatorTracker( String TranslatorTrackId ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        ArrayList resultList = new ArrayList<>();
        ArrayList testList;

        TranslatorTracker translatorTracker;

        try {
            conn = DBConn.getConnection();

            translatorTracker = new TranslatorTracker();

            ps = conn.prepareStatement( "SELECT DISTINCT\n"
                    + "	ILGAS.Translator.Name,\n"
                    + "	ILGAS.TranslatorTrack.Title,\n"
                    + "	ILGAS.Author.Name,\n"
                    + "	ILGAS.TranslatorTrack.ReferenceNumber\n"
                    + "FROM\n"
                    + "	ILGAS.Author\n"
                    + "	INNER JOIN ILGAS.Application_Author\n"
                    + "	 ON ILGAS.Author.idAuthor = ILGAS.Application_Author.idAuthor\n"
                    + "	INNER JOIN ILGAS.TranslatorTrack\n"
                    + "	 ON ILGAS.Application_Author.ReferenceNumber = ILGAS.TranslatorTrack.ReferenceNumber\n"
                    + "	INNER JOIN ILGAS.Translator\n"
                    + "	 ON ILGAS.TranslatorTrack.idTranslator = ILGAS.Translator.idTranslator\n"
                    + "WHERE\n"
                    + "	ILGAS.Translator.idTranslator =  ?" );
            ps.setString( 1, TranslatorTrackId );

            res = ps.executeQuery();

            translatorTracker.setTranslatorID( TranslatorTrackId );

            while ( res.next() ) {

                testList = new ArrayList<>();

                /* add translator */
                testList.add( res.getString( 1 ) );

                /* add author */
                testList.add( res.getString( 3 ) );

                /* add book title */
                testList.add( res.getString( 2 ) );

                /* add ReferenceNumber */
                testList.add( res.getString( 4 ) );

                /* add record to resultList */
                resultList.add( testList );
            }

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );

        for ( int u = 0; u < resultList.size(); u++ ) {
            System.out.println( "EntryDbDAO resultList " + u + "  " + resultList.get( u ) );
        }

        return resultList;
    }

    /**
     * 
     * @param uname
     * @return User
     * @throws DBException 
     */
    public static User selectUSER( String uname ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        User pojo = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select uname, EMAIL, FIRST_NAME, LAST_NAME, EMAIL_VERIFICATION_HASH, EMAIL_VERIFICATION_ATTEMPTS, STATUS, CREATED_TIME from ILGAS.users where uname = ?" );
            ps.setString( 1, uname );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    pojo = new User();
                    pojo.setUSERNAME( res.getString( 1 ) );
                    pojo.setEMAIL( res.getString( 2 ) );
                    pojo.setFIRST_NAME( res.getString( 3 ) );
                    pojo.setLAST_NAME( res.getString( 4 ) );
                    pojo.setEMAIL_VERIFICATION_HASH( res.getString( 5 ) );
                    pojo.setEMAIL_VERIFICATION_ATTEMPTS( res.getInt( 6 ) );
                    pojo.setSTATUS( res.getString( 7 ) );
                    pojo.setCREATED_TIME( res.getString( 8 ) );
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps, res );
            LOGGER.debug( e.getMessage() );
            throw new DBException( "1 Excepion while accessing database" );
        }
        return pojo;
    }

    /**
     * 
     * @param uname
     * @param hash
     * @return verified
     * @throws DBException 
     */
    public static boolean verifyEmailHash( String uname, String hash ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet res = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select 1 from ILGAS.users where uname = ? and EMAIL_VERIFICATION_HASH = ?" );
            ps.setString( 1, uname );
            //  System.out.println("username dao verifyEmailHash: " + uname);
            ps.setString( 2, hash );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    verified = true;
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps, res );
            LOGGER.debug( e.getMessage() );
            throw new DBException( "2 Excepion while accessing database" );
        }
        return verified;
    }

    /**
     * 
     * @param uname
     * @return verified
     * @throws DBException 
     */
    public static boolean isEmailExists( String uname ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet res = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select 1 from ILGAS.users where uname = ?" );
            ps.setString( 1, uname );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    verified = true;
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "3 Excepion while accessing database" );
        }
        return verified;
    }

    /**
     * 
     * @param pojo
     * @return
     * @throws DBException 
     */
    public static int insertRow( User pojo ) throws DBException {
        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        ResultSet res = null;

        try {
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );
            ps1 = conn.prepareStatement( "insert into ILGAS.users (uname,FIRST_NAME,LAST_NAME,PASSWORD,EMAIL,FUNCTION,ROLE,EMAIL_VERIFICATION_HASH) values (?,?,?,?,?,?,?,?)" );
            ps1.setString( 1, pojo.getUSERNAME() );
            ps1.setString( 2, pojo.getFIRST_NAME() );
            ps1.setString( 3, pojo.getLAST_NAME() );
            ps1.setString( 4, pojo.getPASSWORD() );
            ps1.setString( 5, pojo.getEMAIL() );
            ps1.setString( 6, pojo.getFUNCTION() );
            ps1.setString( 7, pojo.getROLE() );
            ps1.setString( 8, pojo.getEMAIL_VERIFICATION_HASH() );

            String uname = pojo.getUSERNAME();

            String strF = pojo.getFUNCTION();

            String em = pojo.getEMAIL();
            
            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    id = res.getInt( 1 );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 Excepion while accessing database" );
        }

        return id;
    }

    /**
     * 
     * @param pojo 
     */
    public static void deleteRow( User pojo ) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "delete from ILGAS.users where uname = ?" );
            ps.setString( 1, pojo.getUSERNAME() );
            ps.executeUpdate();
            ps.close();
            DBConn.close( conn, ps );
        } catch ( SQLException | ClassNotFoundException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps );
        }
    }

    /**
     * 
     * @param uname
     * @param status
     * @throws DBException 
     */
    public static void updateStatus( String uname, String status ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "update ILGAS.users set STATUS = ? where uname = ?" );
            ps.setString( 1, status );
            ps.setString( 2, uname );
            ps.executeUpdate();
            DBConn.close( conn, ps );

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps );
            throw new DBException( "5 Excepion while accessing database" );
        }
    }

    /**
     * 
     * @param authorArray
     * @param gender
     * @param referenceNumber
     * @throws DBException 
     */
    public static void updateAuthorGender( String[] authorArray, String gender, String referenceNumber ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        System.out.println( "updateAuthorGender authorArray " + Arrays.toString( authorArray ) + " gender " + gender + " referenceNumber " + referenceNumber );

        for ( String authorArray1 : authorArray ) {
            try {
                conn = DBConn.getConnection();
                ps = conn.prepareStatement( "update ILGAS.Author set gender = ? where Name = ? AND ReferenceNumber = ?" );
                ps.setString( 1, gender );
                ps.setString( 2, authorArray1 );
                ps.setString( 3, referenceNumber );

                ps.executeUpdate();

                DBConn.close( conn, ps );

            } catch ( ClassNotFoundException | SQLException e ) {
                LOGGER.debug( e.getMessage() );
                DBConn.close( conn, ps );
                throw new DBException( "5 updateAuthorGender Excepion while accessing database" );
            }
        }
    }

    /**
     * 
     * @param uname
     * @param hash
     * @throws DBException 
     */
    public static void updateEmailVerificationHash( String uname, String hash ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "update ILGAS.users set EMAIL_VERIFICATION_HASH = ?, EMAIL_VERIFICATION_ATTEMPTS = ? where uname = ?" );
            ps.setString( 1, hash );
            ps.setInt( 2, 0 );
            ps.setString( 3, uname );
            ps.executeUpdate();
            DBConn.close( conn, ps );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps );
            throw new DBException( " 6 Excepion while accessing database" );
        }
    }

    /**
     * 
     * @param uname
     * @return attempts
     * @throws DBException 
     */
    public static int incrementVerificationAttempts( String uname ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet res = null;
        int attempts = 0;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "update ILGAS.users set EMAIL_VERIFICATION_ATTEMPTS = EMAIL_VERIFICATION_ATTEMPTS + 1 where uname = ?" );
            ps.setString( 1, uname );
            ps.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT EMAIL_VERIFICATION_ATTEMPTS from ILGAS.users" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    attempts = res.getInt( 1 );
                }
            }
            DBConn.close( conn, ps, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, ps2, res );
            throw new DBException( "7 Excepion while accessing database" );
        }
        return attempts;
    }

    /**
     * 
     * @param inputUsername
     * @param inputPassword
     * @return User
     * @throws DBException 
     */
    public static User verifyLogin( String inputUsername, String inputPassword ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        User pojo = null;
        ResultSet res = null;

        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select uname, EMAIL, FIRST_NAME, LAST_NAME, STATUS, CREATED_TIME, ROLE, FUNCTION from ILGAS.users where uname = ? and PASSWORD = ?" );
            ps.setString( 1, inputUsername );
            ps.setString( 2, inputPassword );

            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    pojo = new User();

                    pojo.setUSERNAME( res.getString( 1 ) );
                    pojo.setEMAIL( res.getString( 2 ) );
                    pojo.setFIRST_NAME( res.getString( 3 ) );
                    pojo.setLAST_NAME( res.getString( 4 ) );
                    pojo.setSTATUS( res.getString( 5 ) );
                    pojo.setCREATED_TIME( res.getString( 6 ) );
                    pojo.setROLE( res.getString( 7 ) );
                    pojo.setFUNCTION( res.getString( 8 ) );
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "8 Excepion while accessing database" );
        }
        return pojo;
    }

    /**
     * 
     * @param uname
     * @param inputCurrentPassword
     * @return verified
     * @throws DBException 
     */
    public static boolean verifyUserIdAndPassword( String uname,
            String inputCurrentPassword ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet res = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select 1 from ILGAS.users where uname = ? and PASSWORD = ?" );
            ps.setString( 1, uname );
            ps.setString( 2, inputCurrentPassword );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    verified = true;
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "9 Excepion while accessing database" );
        }
        return verified;
    }

    /**
     * 
     * @param uname
     * @param inputPassword
     * @throws DBException 
     */
    public static void updatePassword( String uname, String inputPassword ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "update ILGAS.users set PASSWORD = ? where uname = ?" );
            ps.setString( 1, inputPassword );
            ps.setString( 2, uname );
            ps.executeUpdate();
            DBConn.close( conn, ps );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps );
            throw new DBException( "10 Excepion while accessing database" );
        }
    }

    /**
     * 
     * @param inputEmail
     * @param hash
     * @throws DBException 
     */
    public static void updateEmailVerificationHashForResetPassword( String inputEmail,
            String hash ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "update ILGAS.users set EMAIL_VERIFICATION_HASH = ?, EMAIL_VERIFICATION_ATTEMPTS = ?, STATUS = ? where EMAIL = ?" );
            ps.setString( 1, hash );
            ps.setInt( 2, 0 );
            ps.setString( 3, GlobalConstants.IN_RESET_PASSWORD );
            ps.setString( 4, inputEmail );
            ps.executeUpdate();
            DBConn.close( conn, ps );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps );
            throw new DBException( "11 Excepion while accessing database" );
        }
    }

    /**
     * 
     * @param inputEmail
     * @return USER
     * @throws DBException 
     */
    public static User selectUSERbyEmail( String inputEmail ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        User pojo = null;
        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select uname, EMAIL, FIRST_NAME, LAST_NAME, EMAIL_VERIFICATION_HASH, EMAIL_VERIFICATION_ATTEMPTS, STATUS, CREATED_TIME from ILGAS.users where EMAIL = ?" );
            ps.setString( 1, inputEmail );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    pojo = new User();
                    pojo.setUSERNAME( res.getString( 1 ) );
                    pojo.setEMAIL( res.getString( 2 ) );
                    pojo.setFIRST_NAME( res.getString( 3 ) );
                    pojo.setLAST_NAME( res.getString( 4 ) );
                    pojo.setEMAIL_VERIFICATION_HASH( res.getString( 5 ) );
                    pojo.setEMAIL_VERIFICATION_ATTEMPTS( res.getInt( 6 ) );
                    pojo.setSTATUS( res.getString( 7 ) );
                    pojo.setCREATED_TIME( res.getString( 8 ) );
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }
        return pojo;
    }

    /**
     * 
     * @param appRef
     * @return documentList
     */
    public static ArrayList<String[]> getDocuments( String appRef ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        /*
         * getDocuments returns a list with all document for a specific
         * ReferenceNumber
         */
        ArrayList<String[]> documentList = new ArrayList<>();
        String[] documentArray = new String[ 8 ];

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT \n"
                    + "    translatorCV,\n"
                    + "    translatorCVDocName,\n"
                    + "    Agreement,\n"
                    + "    AgreementDocName,\n"
                    + "    Contract,\n"
                    + "    ContractDocName,\n"
                    + "    AddendumRightsAgreement,\n"
                    + "    AddendumRightsAgreementName\n"
                    + "FROM\n"
                    + "    ILGAS.TranslatorTrack\n"
                    + "WHERE ReferenceNumber =  ? " );

            ps.setString( 1, appRef );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    documentArray[ 0 ] = res.getString( 1 );
                    documentArray[ 1 ] = res.getString( 2 );
                    documentArray[ 2 ] = res.getString( 3 );
                    documentArray[ 3 ] = res.getString( 4 );
                    documentArray[ 4 ] = res.getString( 5 );
                    documentArray[ 5 ] = res.getString( 6 );
                    documentArray[ 6 ] = res.getString( 7 );
                    documentArray[ 7 ] = res.getString( 8 );

                    documentList.add( documentArray );
                    
                    documentArray = new String[ 8 ];

                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( ApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return documentList;
    }

    /**
     *
     * @param ReferenceNumber
     * @return rightsAgreementArray
     */
    public static ArrayList<String> getRightsAgreement( String ReferenceNumber ) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        ArrayList<String> rightsAgreementArray = new ArrayList<>();
        String[] columnList;// = new String[4];

        /*
         * getUnassignedExpertReader returns a list with the expertReaderName
         * NOT
         * assigned to any reference number at the moment
         */
        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT "
                    + "Agreement, AgreementDocName, "
                    + "Contract, ContractDocName, "
                    + "AddendumRightsAgreement, AddendumRightsAgreementName"
                    + " FROM ILGAS.TranslatorTrack WHERE referenceNumber = ?" );

            ps.setString( 1, ReferenceNumber );

            res = ps.executeQuery();

            final ResultSetMetaData meta = res.getMetaData();
            final int columnCount = meta.getColumnCount();

            while ( res.next() ) {

                columnList = new String[ 6 ];

                /*
                      0  Agreement, 
                      1  AgreementDocName, 
                      2  Contract, 
                      3  ContractDocName, 
                      4  AddendumRightsAgreement, 
                      5  AddendumRightsAgreementName    
                      0  translatorCV, 
                      1  translatorCVDocName, 
                      2  copiesTranslationSample, 
                      3  copiesTranslationSampleDocName, 
                      4  Agreement, 
                      5  AgreementDocName, 
                      6  Contract, 
                      7  ContractDocName, 
                      8  AddendumRightsAgreement, 
                      9  AddendumRightsAgreementName
                 */
                columnList[ 0 ] = res.getString( 1 );
                columnList[ 1 ] = res.getString( 2 );
                columnList[ 2 ] = res.getString( 3 );
                columnList[ 3 ] = res.getString( 4 );
                columnList[ 4 ] = res.getString( 5 );
                columnList[ 5 ] = res.getString( 6 );

                rightsAgreementArray.add( Arrays.toString( columnList ) );

//                for ( int s = 0; s < columnList.length; s++ ) {
//                     System.out.println("getRightsAgreement columnList[" + s + "] " + columnList[s]);
//
//                }
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            java.util.logging.Logger.getLogger( openApplicationDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        DBConn.close( conn, ps, res );

        return rightsAgreementArray;
    }

    /**
     *
     * @param ReferenceNumber
     * @return translatorDocsLst
     * @throws DBException
     */
    @SuppressWarnings("unchecked")
    public static ArrayList<String> getTransDocs( String ReferenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        String[] translatorCVLst;// = new String[4];
        ArrayList<String> translatorDocsLst = new ArrayList<>();

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT Translator.Name, TranslatorTrack.translatorCVDocName, TranslatorTrack.translatorCV, TranslatorTrack.copiesTranslationSample, TranslatorTrack.copiesTranslationSampleDocName \n"
                    + "FROM ILGAS.TranslatorTrack\n"
                    + "INNER JOIN ILGAS.Translator ON TranslatorTrack.idTranslator = Translator.idTranslator\n"
                    + "WHERE TranslatorTrack.translatorCVDocName IS NOT NULL  \n"
                    + "AND  TranslatorTrack.ReferenceNumber = ? \n"
                    + "order by TranslatorTrack.idTranslator" );

            ps.setString( 1, ReferenceNumber );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    translatorCVLst = new String[ 5 ];
                    translatorCVLst[ 0 ] = res.getString( 1 );
                    translatorCVLst[ 1 ] = res.getString( 2 );
                    translatorCVLst[ 2 ] = res.getString( 3 );
                    translatorCVLst[ 3 ] = "TEST"; //res.getString(3);
                    translatorCVLst[ 4 ] = "TEST"; //res.getString(4);

                    translatorDocsLst.add( Arrays.toString( translatorCVLst ) );
                }

            }

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );

        return translatorDocsLst;
    }

    /**
     *
     * @param ReferenceNumber
     * @return pressCoverageLst
     * @throws DBException
     */
    @SuppressWarnings("unchecked")
    public static ArrayList<String> getPressCoverage( String ReferenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        ArrayList<String> pressCoverageLst = new ArrayList<>();
        String[] pressCoverageArray;
        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT PressCuttings, PressCuttingsName \n"
                    + "FROM ILGAS.PressCuttings\n"
                    + "WHERE ReferenceNumber = ?" );

            ps.setString( 1, ReferenceNumber );

            res = ps.executeQuery();
            pressCoverageArray = new String[ 4 ];
            int idx = 1;
            if ( res != null ) {
                while ( res.next() ) {

                    System.out.println( "idx  " + idx );
                    System.out.println( "getPressCoverage pressCoverageLst Loop res.getString(1)  " + res.getString( 1 ) );
                    System.out.println( "getPressCoverage pressCoverageLst Loop res.getString(2)  " + res.getString( 2 ) );

                    String fileName = res.getString( 1 ).trim();
                    String basename = FilenameUtils.getBaseName( fileName );
                    String fullPath = FilenameUtils.getFullPath( fileName );
                    String extension = FilenameUtils.getExtension( fileName );

                    pressCoverageArray[ 0 ] = "https://www.literatureirelandgrantapplication.com" + fileName;
                    pressCoverageArray[ 1 ] = res.getString( 2 ).trim();
                    System.out.println( " !Thumbs res.getString(1)   " + res.getString( 1 ) );
                    System.out.println( " !Thumbs  res.getString(2)  " + res.getString( 2 ) );

                    if ( "pdf".equals( extension ) ) {
                        System.out.println( " IS PDF   " );

                        String thumbFilename = basename + ".jpg";
                        String thumbFullPath = fullPath + "Thumbs/" + thumbFilename;

                        System.out.println( " thumbFilename   " + thumbFilename );
                        System.out.println( " thumbFullPath   " + thumbFullPath );

                        pressCoverageArray[ 2 ] = "https://www.literatureirelandgrantapplication.com" + thumbFullPath;
                        pressCoverageArray[ 3 ] = thumbFilename;

                    }

                    pressCoverageLst.add( Arrays.toString( pressCoverageArray ) );
                    pressCoverageArray = new String[ 4 ];
                    idx++;

                }

            }

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "12 Excepion while accessing database" );
        }

        DBConn.close( conn, ps, res );
        System.out.println( "getPressCoverage pressCoverageLst  " + pressCoverageLst.toString() );
        return pressCoverageLst;
    }

    /**
     *
     * @return CurrentTimeStamp
     */
    public static java.sql.Timestamp getCurrentTimeStamp() {

        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp( today.getTime() );

    }

    /**
     *
     * @return currentTimestamp
     */
    public static java.sql.Timestamp getcurrentTimeStamp() {

        Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp( now.getTime() );

        return currentTimestamp;

    }

    /**
     * convert Java Date to SQL Date
     *
     * @param javaDate
     * @return convertSqlDate
     */
    public static java.sql.Date sqlDate( java.util.Date javaDate ) {
        System.out.println( "convert Java Date to SQL Date  " + javaDate );
        java.util.Date utilStartDate = javaDate;
        java.sql.Date convertSqlDate = new java.sql.Date( utilStartDate.getTime() );

        return convertSqlDate;
    }

    /**
     *
     * @param authorName
     * @return authorId
     * @throws DBException
     */
    public static int ifAuthorExist( String authorName ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        int authorId = 0;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT idAuthor FROM ILGAS.Author WHERE Name = ?" );
            ps.setString( 1, authorName );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    authorId = res.getInt( 1 );
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "3 Excepion while accessing database" );
        }

        return authorId;
    }

}
