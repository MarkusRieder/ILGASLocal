package ie.irishliterature.dao;

import static ie.irishliterature.dao.ACpublisherDAO_test.disconnect;
import static ie.irishliterature.dao.GrantApplicationDAO.getcurrentTimeStamp;
import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.ExpertReader;
import ie.irishliterature.model.GrantApplication;
import ie.irishliterature.model.Publisher;
import ie.irishliterature.util.MailUtil;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import javax.mail.MessagingException;
import org.apache.log4j.Logger;

public class StaffDAO {

    private static final Logger LOGGER = Logger.getLogger( StaffDAO.class.getName() );

    static Calendar now = Calendar.getInstance();
    static int year = now.get( Calendar.YEAR );
    static String yearInString = String.valueOf( year );

    // selectApplication
    public static GrantApplication selectApplication( String ReferenceNumber ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        GrantApplication application = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select ReferenceNumber"
                    + "ApplicationYear,\n"
                    + "ApplicationNumber,\n"
                    + "company,\n"
                    + "publisherID,\n"
                    + "userID,\n"
                    + "agreement,\n"
                    + "agreementDocName,\n"
                    + "contract,\n"
                    + "contractDocName,\n"
                    + "proposedDateOfPublication,\n"
                    + "proposedDateOfPrintRun,\n"
                    + "plannedPageExtent,\n"
                    + "translatorCV,\n"
                    + "translatorCVDocName,\n"
                    //                    + "numberOfPages,\n"
                    + "originalPageExtent,\n"
                    + "feePerPage,\n"
                    + "translatorFee,\n"
                    + "bookNotes,\n"
                    + "copiesSent,\n"
                    + "dateCopiesWereSent,\n"
                    + "copiesTranslationSample,\n"
                    + "copiesTranslationSampleDocName,\n"
                    + "TC_ACCEPTED,\n"
                    + "gdpr_ACCEPTED,\n"
                    + "APPROVED,\n"
                    + "Status,\n"
                    + "lastUpdated from ILGAS.GrantApplication where ReferenceNumber = ?" );

            ps.setString( 1, ReferenceNumber );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    application = new GrantApplication();

                    application.setReferenceNumber( res.getString( 1 ) );
                    application.setApplicationYear( res.getString( 2 ) );
                    application.setApplicationNumber( res.getInt( 3 ) );
                    application.setCompany( res.getString( 4 ) );
                    application.setPublisherID( res.getInt( 5 ) );
                    application.setUserID( res.getInt( 6 ) );
                    application.setAgreement( res.getString( 7 ) );
                    application.setAgreementDocName( res.getString( 8 ) );
                    application.setContract( res.getString( 9 ) );
                    application.setContractDocName( res.getString( 10 ) );
                    application.setProposedDateOfPublication( res.getDate( 11 ) );
                    application.setProposedPrintRun( res.getInt( 12 ) );
                    application.setPlannedPageExtent( res.getInt( 13 ) );
                    application.setTranslatorCV( res.getString( 14 ) );
                    application.setTranslatorCVDocName( res.getString( 15 ) );
                    application.setOriginalPageExtent( res.getInt( 16 ) );
                    application.setBreakDownTranslatorFee( res.getString( 17 ) );
                    application.setTranslatorFee( res.getBigDecimal( 18 ) );
                    application.setNotesAboutApplication( res.getString( 19 ).trim() );
                    System.out.println( "setNotesAboutApplication ---->> " + res.getString( 19 ).trim() );
                    application.setCopiesSent( res.getInt( 20 ) );
                    application.setDateCopiesWereSent( res.getDate( 21 ) );
                    application.setCopiesTranslationSample( res.getString( 22 ) );
                    application.setCopiesTranslationSampleDocName( res.getString( 23 ) );
                    application.setTC_ACCEPTED( res.getInt( 24 ) );
                    application.setGdprACCEPTED( res.getInt( 25 ) );
                    application.setAPPROVED( res.getInt( 26 ) );
                    application.setStatus( res.getString( 27 ) );
                    application.setLASTUPDATED( res.getTimestamp( 28 ) );
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps, res );
            LOGGER.debug( e.getMessage() );
            throw new DBException( "1 Excepion while accessing database" );
        }

        return application;
    }

    /**
     * isApplicationNumberExists
     *
     * @param ReferenceNumber
     * @return
     * @throws ie.irishliterature.db.DBException
     */
    public static boolean isReferenceNumberExists( int ReferenceNumber ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "select 1 from ILGAS.GrantApplication where ReferenceNumber = ?" );

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

    // insertRow
//    public static String replaceRow( String ReferenceNumber, GrantApplication application ) throws DBException, MessagingException {
//        Connection conn = null;
//        PreparedStatement ps1 = null;
//        PreparedStatement ps2 = null;
//        int id = 0;
//        ResultSet res = null;
//
//        java.sql.Timestamp timestamp = getcurrentTimeStamp();
//
//        /*
//                         * ReferenceNumber contains ApplicationNumber seperated
//                         * by a "/"
//                         * find the first occurrence of "/"
//         */
//        int iend = ReferenceNumber.indexOf( "/" );
//        int ApplicationNumber = 0;
//        /*
//                         * get ApplicationNumber from ReferenceNumber
//         */
//        if ( iend != -1 ) {
//            ApplicationNumber = Integer.parseInt( ReferenceNumber.substring( 0, iend ) );
//
//            System.out.println( "ApplicationNumber ---->> " + ApplicationNumber );
//        }
////        int ApplicationNumber = getNextApplicationNumber();
////        System.out.println( "ApplicationNumber " + ApplicationNumber );
//        String Publisher = application.getCompany();
//
////        System.out.println( " DAO  ApplicationNumber: " + ApplicationNumber );
////        String ReferenceNumber = ApplicationNumber + "/" + yearInString;
//        System.out.println( " DAO  ReferenceNumber: " + ReferenceNumber );
//
//        try {
//
//            conn = DBConn.getConnection();
//            conn.setAutoCommit( false );
//            ps1 = conn.prepareStatement( "REPLACE INTO  ILGAS.GrantApplication "
//                    + "(ReferenceNumber,\n"
//                    + "ApplicationYear,\n"
//                    + "ApplicationNumber,\n"
//                    + "company,\n"
//                    + "publisherID,\n"
//                    + "userID,\n"
//                    + "agreement,\n"
//                    + "agreementDocName,\n"
//                    + "contract,\n"
//                    + "contractDocName,\n"
//                    + "proposedDateOfPublication,\n"
//                    + "proposedPrintRun,\n"
//                    + "plannedPageExtent,\n"
//                    + "translatorCV,\n"
//                    + "translatorCVDocName,\n"
//                    + "numberOfPages,\n"
//                    + "translatorFee,\n"
//                    + "breakDownTranslatorFee,\n"
//                    + "Notes,\n"
//                    + "Original,\n"
//                    + "OriginalName,\n"
//                    + "copiesTranslationSample,\n"
//                    + "copiesTranslationSampleDocName,\n"
//                    + "TC_ACCEPTED,\n"
//                    + "gdpr_ACCEPTED,\n"
//                    + "APPROVED,\n"
//                    + "Status,\n"
//                    + "Cover,\n"
//                    + "CoverName,\n"
//                    + "originalLanguage,\n"
//                    + "originalPageExtent,\n"
//                    + "countryOfPublication,\n"
//                    + "foreignPublisher,\n"
//                    + "foreignCountry,\n"
//                    + "targetLanguage,\n"
//                    + "publicationYear,\n"
//                    + "paymentReferenceNumber,\n"
//                    + "addendumRightsAgreement,\n"
//                    + "addendumRightsAgreementName,\n"
//                    + "proofOfPaymentToTranslator,\n"
//                    + "proofOfPaymentToTranslatorName,\n"
//                    + "bankDetailsForm,\n"
//                    + "bankDetailsFormName,\n"
//                    + "signedLIContract,\n"
//                    + "signedLIContractName,\n"
//                    + "award,\n"
//                    + "salesFigures,\n"
//                    + "amountRequested,\n"
//                    + "created)  values  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
//            //                                              1                   2                   3                   4                   5                   6
//            //                            1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0      
//            //  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
//            //       (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?");"
//            ps1.setString( 1, ReferenceNumber );
//            ps1.setString( 2, yearInString );
//            ps1.setInt( 3, ApplicationNumber );
//            ps1.setString( 4, application.getCompany() );
//            ps1.setInt( 5, application.getPublisherID() );
//            ps1.setString( 6, application.getUserID() );
//            ps1.setString( 7, application.getAgreement() );
//            ps1.setString( 8, application.getAgreementDocName() );
//            ps1.setString( 9, application.getContract() );
//            ps1.setString( 10, application.getContractDocName() );
//            ps1.setDate( 11, sqlDate( application.getProposedDateOfPublication() ) );
//            ps1.setInt( 12, application.getProposedPrintRun() );
//            ps1.setInt( 13, application.getPlannedPageExtent() );
//            ps1.setString( 14, application.getTranslatorCV() );
//            ps1.setString( 15, application.getTranslatorCVDocName() );
//            ps1.setInt( 16, application.getNumberOfPages() );
//            ps1.setBigDecimal( 17, application.getTranslatorFee() );
//            ps1.setString( 18, application.getBreakDownTranslatorFee() );
//            ps1.setString( 19, application.getNotesAboutApplication().trim() );
////            ps1.setInt( 20, application.getCopiesSent() );
////            ps1.setDate( 21, sqlDate( application.getDateCopiesWereSent() ) );
//            ps1.setString( 20, application.getOriginal() );
//            ps1.setString( 21, application.getOriginalName() );
//            ps1.setString( 22, application.getCopiesTranslationSample() );
//            ps1.setString( 23, application.getCopiesTranslationSampleDocName() );
//            ps1.setInt( 24, application.getTC_ACCEPTED() );
//            ps1.setInt( 25, application.getGdprACCEPTED() );
//            ps1.setInt( 26, application.getAPPROVED() );
//            ps1.setString( 27, application.getStatus() );
//            ps1.setString( 28, application.getCover() );
//            ps1.setString( 29, application.getCoverName() );
//            ps1.setString( 30, application.getOriginalLanguage() );
//            ps1.setInt( 31, application.getOriginalPageExtent() );
//            ps1.setString( 32, application.getCountryOfPublication() );
//            ps1.setString( 33, application.getForeignPublisher() );
//            ps1.setString( 34, application.getForeignCountry() );
//            ps1.setString( 35, application.getTargetLanguage() );
//            ps1.setString( 36, ( application.getPublicationYear() ) );
//            ps1.setString( 37, application.getPaymentReferenceNumber() );
//            ps1.setString( 38, application.getAddendumRightsAgreement() );
//            ps1.setString( 39, application.getAddendumRightsAgreementName() );
//            ps1.setString( 40, application.getProofOfPaymentToTranslator() );
//            ps1.setString( 41, application.getProofOfPaymentToTranslatorName() );
//            ps1.setString( 42, application.getBankDetailsForm() );
//            ps1.setString( 43, application.getBankDetailsFormName() );
//            ps1.setString( 44, application.getSignedLIContract() );
//            ps1.setString( 45, application.getSignedLIContractName() );
//            ps1.setInt( 46, application.getAward() );
//            ps1.setInt( 47, application.getSalesFigures() );
//            ps1.setBigDecimal( 48, application.getAmountRequested() );
//            ps1.setTimestamp( 49, getCurrentTimeStamp() );
//
//            System.out.println( "ps1:  1: " + ps1 );
//            ps1.executeUpdate();
//            System.out.println( "ps1:  2: " + ps1 );
//            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
//            res = ps2.executeQuery();
//
//            if ( res != null ) {
//                while ( res.next() ) {
//
//                    id = res.getInt( 1 );
////                    System.out.println("StaffDAO id::   " + id);
//                }
//            }
//
//            conn.commit();
//
//            DBConn.close( conn, ps1, ps2, res );
//        } catch ( ClassNotFoundException | SQLException e ) {
//            LOGGER.debug( e.getMessage() );
//            DBConn.close( conn, ps1, ps2, res );
//            throw new DBException( "4 StaffDAO replaceRow Excepion while accessing database" );
//        }
//
//        /*
//         * trigger newApplicationNotification
//         * Params:
//         * Publisher
//         * ReferenceNumber
//         * Date
//         */
//        SimpleDateFormat formatter = new SimpleDateFormat( "dd/MM/yyyy 'at' HH:mm:ss z" );
//        Date date = new Date( System.currentTimeMillis() );
//        System.out.println( formatter.format( date ) );
//        String datum = formatter.format( date );
//
////        MailUtil.newApplicationNotification( Publisher, ReferenceNumber, datum );
//        return ReferenceNumber;
//    }
    public static int replaceAuthors( String ReferenceNumber, String Name, String FirstName, String LastName ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        int idAuthor = 0;
        ResultSet res = null;

        System.out.println( "replaceAuthors --------------->>  ReferenceNumber " + ReferenceNumber + " Name " + Name + " FirstName  " + FirstName + " LastName " + LastName );

        try {

            /*
             * check if Author exists
             *
             */
            idAuthor = ifAuthorExist( Name );

            /*
             * if not insert the new Author
             */
            if ( idAuthor == 0 ) {

                /*
                 * Name, FirstName, LastName
                 */
                idAuthor = insertNewAuthor( ReferenceNumber, Name, FirstName, LastName );

                System.out.println( ">>>>>>>>>>>>. Author: " + Name + " idAuthor: " + idAuthor );

            }

            /*
             * then:
             * got idAuthor now insert into Application_Author
             */
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            System.out.println( "Receiving from ILGAS.GrantApplicationServlet  ReferenceNumber: " + ReferenceNumber + " , Name: "
                    + Name + " , FirstName: " + FirstName + " , LastName: " + LastName );

            ps1 = conn.prepareStatement( "REPLACE INTO  ILGAS.Application_Author"
                    + "(ReferenceNumber,\n"
                    + "idAuthor) values (?,?)" );

            ps1.setString( 1, ReferenceNumber );
            ps1.setInt( 2, idAuthor );

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

    public static int replaceTranslators( String ReferenceNumber, String Name, String Title, String moveFile, String moveFileName, String copiesTranslationSample, String copiesTranslationSampleDocName ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        int idTranslator = 0;
        ResultSet res = null;

        try {

            System.out.println( "replaceTranslators......................:" );

            /*
             * check if Translator exists
             */
            idTranslator = ifTranslatorExist( Name );

            System.out.println( ">>>>>>>>>>>>. Translator: " + Name + " idTranslator: " + idTranslator );

            /*
             * if not insert the new Translator
             */
            if ( idTranslator == 0 ) {
                // idTranslatorTrack, idTranslator, Author, Title, ReferenceNumber
                idTranslator = insertNewTranslator( Name );
            }

            /*
             * then:
             */
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            /*
             * got idTranslator now ...
             * check if we already have a record
             */
            int translatorTrackRecord = ifTranslatorTrackExist( idTranslator, ReferenceNumber, Title );
            System.out.println( ">>>>>>>>>>>>. translatorTrackRecord: " + translatorTrackRecord + " idTranslator: " + idTranslator + " ReferenceNumber: " + ReferenceNumber + " Title: " + Title );

            /*
             * if yes update TranslatorTrack
             */
            if ( translatorTrackRecord > 0 ) {

                System.out.println( "insertTranslators UPDATE ......................:" );

                ps1 = conn.prepareStatement( "UPDATE ILGAS.TranslatorTrack "
                        + "SET  "
                        + "translatorCV = ?, translatorCVDocName = ?,  "
                        + "copiesTranslationSample = ?, copiesTranslationSampleDocName = ?  "
                        + "WHERE idTranslatorTrack = ?" );

                ps1.setString( 1, moveFileName );
                ps1.setString( 2, moveFile );
                ps1.setString( 3, copiesTranslationSample );
                ps1.setString( 4, copiesTranslationSampleDocName );
                ps1.setInt( 5, translatorTrackRecord );

            } else {

                System.out.println( "insertTranslators INSERT ......................:" );

                /*
                 * if no insert into TranslatorTrack
                 */
                ps1 = conn.prepareStatement( "REPLACE INTO  ILGAS.TranslatorTrack"
                        + "(idTranslator,\n"
                        + "Title,\n"
                        + "ReferenceNumber,\n"
                        + "translatorCV,\n"
                        + "translatorCVDocName,\n"
                        + "copiesTranslationSample,\n"
                        + "copiesTranslationSampleDocName) values (?,?,?,?,?,?,?)" );

                ps1.setInt( 1, idTranslator );
                ps1.setString( 2, Title );
                ps1.setString( 3, ReferenceNumber );
                ps1.setString( 4, moveFileName );
                ps1.setString( 5, moveFile );
                ps1.setString( 6, copiesTranslationSample );
                ps1.setString( 7, copiesTranslationSampleDocName );

            }
            /*
             * else
             */

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
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

    /*
     * Agreement with the translation rights holder
     */
    public static int replaceAgreement( String ReferenceNumber, String Name, String Title, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        int idTranslator = 0;
        ResultSet res = null;
        System.out.println( "replaceAgreement......................:" );

        System.out.println( "insertAgreement.....ReferenceNumber: " + ReferenceNumber );
        System.out.println( "insertAgreement.....Name: " + Name );
        System.out.println( "insertAgreement.....Title: " + Title );
        System.out.println( "insertAgreement.....moveFileName: " + moveFileName );
        System.out.println( "insertAgreement.....moveFileNameReplaced: " + moveFileNameReplaced );

        try {

            /*
             * Method updaterightsHolderArrayContent
             * inserts rightsHolderArrayContent
             * that is:
             * ReferenceNumber
             * TranslationRightsHolderName
             *
             * now we need to insert the Agreement
             *
             */
//            
//           
//                            
//            , 
//
//            # idTranslationRightsHolder, ReferenceNumber, TranslationRightsHolderName, Agreement, AgreementDocName, AddendumRightsAgreement, AddendumRightsAgreementName
//            '134', '45/2020',  'SunshineTrans Ltd', NULL, NULL, NULL
//            , NULL we insert translation rights holder
//            both translation rights holder will get the same Agreement //if not insert the new Translator
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            /*
             * we check if we do have rightsHolderArrayContent in table
             * TranslationRightsHolder
             */
            if ( rightsHolderArrayContent( ReferenceNumber ) ) {

                /*
                 * if yes we update the record with the Agreement
                 */
                System.out.println( "insertAgreement UPDATE ......................:" );
                System.out.println( "insertAgreement UPDATE .......idTranslator...............: " + ReferenceNumber );
                System.out.println( "insertAgreement UPDATE .......moveFileNameReplaced...............: " + moveFileNameReplaced );
                System.out.println( "insertAgreement UPDATE .......AgreementDocName...............: " + moveFileName );
//idTranslationRightsHolder, ReferenceNumber, TranslationRightsHolderName, Agreement, AgreementDocName, 
//AddendumRightsAgreement, AddendumRightsAgreementName
//                ps1 = conn.prepareStatement( "UPDATE ILGAS.TranslatorTrack "
//                        + "SET  "
//                        + "Agreement = ?, AgreementDocName = ?  "
//                        + "WHERE idTranslator = ? AND  idTranslatorTrack = ?" );
                ps1 = conn.prepareStatement( "UPDATE ILGAS.TranslationRightsHolder "
                        + "SET  "
                        + "Agreement = ?, AgreementDocName = ?  "
                        + "WHERE ReferenceNumber = ? " );

                ps1.setString( 1, moveFileNameReplaced );
                ps1.setString( 2, moveFileName );
                ps1.setString( 3, ReferenceNumber );
//                ps1.setInt( 4, translatorTrackRecord );

                System.out.println( "insertAgreement UPDATE ps1...............: " + ps1 );

            } else {
                /*
                 * this should not be reched but to make sure we'll insert
                 * ReferenceNumber
                 * TranslationRightsHolderName
                 * if it does not exist
                 */

                idTranslator = ifTranslatorExist( Name );

                System.out.println( "insertAgreement INSERT ......................:" );
//idTranslatorTrack, idTranslator, ReferenceNumber, Title, translatorCV, translatorCVDocName, copiesTranslationSample, copiesTranslationSampleDocName, Agreement, AgreementDocName, Contract, ContractDocName, AddendumRightsAgreement, AddendumRightsAgreementName
                // if no insert into TranslatorTrack      
//                ps1 = conn.prepareStatement( "INSERT INTO  ILGAS.TranslatorTrack"
//                        + "(idTranslator,\n"
//                        + "Title,\n"
//                        + "ReferenceNumber,\n"
//                        + "Agreement,\n"
//                        + "AgreementDocName) values (?,?,?,?,?)" );
                ps1 = conn.prepareStatement( "REPLACE INTO  ILGAS.TranslationRightsHolder"
                        + "(idTranslator,\n"
                        + "ReferenceNumber,\n"
                        + "Agreement,\n"
                        + "AgreementDocName) values (?,?,?,?)" );

                ps1.setInt( 1, idTranslator );
                ps1.setString( 2, ReferenceNumber );
                ps1.setString( 3, moveFileNameReplaced );
                ps1.setString( 4, moveFileName );

                System.out.println( "insertAgreement INSERT ps1..............: " + ps1 );

            } // else

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 insertAgreement Excepion while accessing database" );
        }

        return id;
    }

    /*
     * Contract with the translator
     */
    public static int replaceContract( String ReferenceNumber, String Name, String Title, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        int idTranslator = 0;
        ResultSet res = null;

        System.out.println( "replaceContract......................:" );

        System.out.println( "insertContract.....ReferenceNumber: " + ReferenceNumber );
        System.out.println( "insertContract.....Name: " + Name );
        System.out.println( "insertContract.....Title: " + Title );
        System.out.println( "insertContract.....moveFileName: " + moveFileName );
        System.out.println( "insertContract.....moveFileNameReplaced: " + moveFileNameReplaced );

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            /*
             * check if Translator exists
             */
            idTranslator = ifTranslatorExist( Name );

            System.out.println( ">>>>>>>>>>>>. Translator: " + Name + " idTranslator: " + idTranslator );

            /*
             * if not insert the new Translator
             */
            if ( idTranslator == 0 ) {
                // idTranslatorTrack, idTranslator, Author, Title, ReferenceNumber
                idTranslator = insertNewTranslator( Name );
            }
            /*
             * got idTranslator now ...
             * check if we already have a record
             */
            int translatorTrackRecord = ifTranslatorTrackExist( idTranslator, ReferenceNumber, Title );
            System.out.println( ">>>>>>>>>>>>. translatorTrackRecord: " + translatorTrackRecord + " idTranslator: " + idTranslator );

            /*
             * if yes update TranslatorTrack
             */
            if ( translatorTrackRecord > 0 ) {

                System.out.println( "insertContract UPDATE ......................:" );
                System.out.println( "insertContract UPDATE .......idTranslator...............: " + ReferenceNumber );
                System.out.println( "insertContract UPDATE .......moveFileNameReplaced...............: " + moveFileNameReplaced );
                System.out.println( "insertContract UPDATE .......AgreementDocName...............: " + moveFileName );

                ps1 = conn.prepareStatement( "UPDATE ILGAS.TranslatorTrack "
                        + "SET  "
                        + "Contract = ?, ContractDocName = ?  "
                        + "WHERE ReferenceNumber = ? " );

                ps1.setString( 1, moveFileNameReplaced );
                ps1.setString( 2, moveFileName );
                ps1.setString( 3, ReferenceNumber );

                System.out.println( "insertContract UPDATE ps1...............: " + ps1 );

            } else {

                System.out.println( "insertContract INSERT ......................:" );

                idTranslator = ifTranslatorExist( Name );

                ps1 = conn.prepareStatement( "REPLACE INTO  ILGAS.TranslatorTrack"
                        + "(idTranslator,\n"
                        + "ReferenceNumber,\n"
                        + "Contract,\n"
                        + "ContractDocName) values (?,?,?,?)" );

                ps1.setInt( 1, idTranslator );
                ps1.setString( 2, ReferenceNumber );
                ps1.setString( 3, moveFileNameReplaced );
                ps1.setString( 4, moveFileName );

                System.out.println( "insertContract INSERT ps1..............: " + ps1 );

            } // else

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 insertContract Excepion while accessing database" );
        }

        return id;
    }

    /*
     * Addendum to the Agreement with the translation rights holder
     */
    public static int replaceAddendum( String ReferenceNumber, String Name, String Title, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        int idTranslator = 0;
        ResultSet res = null;

        try {

            /*
             * Method updaterightsHolderArrayContent
             * inserts rightsHolderArrayContent
             * that is:
             * ReferenceNumber
             * TranslationRightsHolderName
             *
             * now we need to insert the Addendum
             *
             */
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            /*
             * we check if we do have rightsHolderArrayContent in table
             * TranslationRightsHolder
             */
            if ( rightsHolderArrayContent( ReferenceNumber ) ) {

                /*
                 * if yes we update the record with the Addendum
                 */
                System.out.println( "replaceAddendum UPDATE ......................:" );

                ps1 = conn.prepareStatement( "UPDATE ILGAS.TranslationRightsHolder "
                        + "SET  "
                        + "AddendumRightsAgreement = ?, AddendumRightsAgreementName = ?  "
                        + "WHERE ReferenceNumber = ?" );

                ps1.setString( 1, moveFileNameReplaced );
                ps1.setString( 2, moveFileName );
                ps1.setString( 3, ReferenceNumber );

                System.out.println( "insertAddendum UPDATE ps1...............: " + ps1 );

            } else {

                /*
                 * this should not be reched but to make sure we'll insert
                 * ReferenceNumber
                 * TranslationRightsHolderName
                 * if it does not exist
                 */
                System.out.println( "insertAddendum INSERT ......................:" );

                idTranslator = ifTranslatorExist( Name );

                // if no insert into TranslatorTrack      
                ps1 = conn.prepareStatement( "REPLACE INTO  ILGAS.TranslationRightsHolder"
                        + "(TranslationRightsHolderName,\n"
                        //                        + "Title,\n"
                        + "ReferenceNumber,\n"
                        + "AddendumRightsAgreement,\n"
                        + "AddendumRightsAgreementName) values (?,?,?,?)" );

                ps1.setString( 1, Name );
//                ps1.setString( 2, Title );
                ps1.setString( 2, ReferenceNumber );
                ps1.setString( 3, moveFileNameReplaced );
                ps1.setString( 4, moveFileName );

                System.out.println( "insertAddendum INSERT ps1...............: " + ps1 );

            } // else

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 insertAddendum Excepion while accessing database" );
        }

        return id;
    }

    public static int replaceOriginal( String ApplicationNumber, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        int idTranslator = 0;
        ResultSet res = null;

        try {

            System.out.println( "replaceOriginal......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String query = "UPDATE ILGAS.GrantApplication SET  Original = ?, OriginalName = ? WHERE ApplicationNumber = ?";
            ps1 = conn.prepareStatement( query );

            ps1.setString( 1, moveFileNameReplaced );
            ps1.setString( 2, moveFileName );
            ps1.setString( 3, ApplicationNumber );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
//                    System.out.println("StaffDAO id::   " + id);
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

    public static int replaceTranslationSample( String ApplicationNumber, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        ResultSet res = null;

        try {

            System.out.println( "replaceTranslationSample......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            System.out.println( "ApplicationNumber: " + ApplicationNumber );

            System.out.println( "moveFile: " + moveFileNameReplaced );
            System.out.println( "moveFileName: " + moveFileName );

            String query = "UPDATE ILGAS.GrantApplication SET  copiesTranslationSample = ?, copiesTranslationSampleDocName = ? WHERE ApplicationNumber = ?";
            ps1 = conn.prepareStatement( query );

//
//            ps1 = conn.prepareStatement("UPDATE GrantApplication SET"
//                    + "(copiesTranslationSample,\n"
//                    + "copiesTranslationSampleDocName) values (?,?)"
//                    + " WHERE ApplicationNumber = " + ApplicationNumber);
            ps1.setString( 1, moveFileNameReplaced );
            ps1.setString( 2, moveFileName );
            ps1.setString( 3, ApplicationNumber );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
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

    public static int replaceProofPayment( String ReferenceNumber, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        ResultSet res = null;

        try {

            System.out.println( "replaceProofPayment......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            System.out.println( "ReferenceNumber: " + ReferenceNumber );

            System.out.println( "moveFile: " + moveFileNameReplaced );
            System.out.println( "moveFileName: " + moveFileName );

            String query = "UPDATE ILGAS.GrantApplication SET  proofOfPaymentToTranslator = ?, proofOfPaymentToTranslatorName = ? WHERE ReferenceNumber = ? ";
            ps1 = conn.prepareStatement( query );

            ps1.setString( 1, moveFileNameReplaced );
            ps1.setString( 2, moveFileName );
            ps1.setString( 3, ReferenceNumber );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 Excepion while accessing database " + e );
        }

        return id;
    }

    public static int replaceBankDetailForm( String ReferenceNumber, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        ResultSet res = null;

        try {

            System.out.println( "replaceBankDetailForm......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            System.out.println( "ReferenceNumber: " + ReferenceNumber );

            System.out.println( "moveFile: " + moveFileNameReplaced );
            System.out.println( "moveFileName: " + moveFileName );

            String query = "UPDATE ILGAS.GrantApplication SET  bankDetailsForm = ?, bankDetailsFormName = ? WHERE ReferenceNumber = ?";
            ps1 = conn.prepareStatement( query );

            ps1.setString( 1, moveFileNameReplaced );
            ps1.setString( 2, moveFileName );
            ps1.setString( 3, ReferenceNumber );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 Excepion while accessing database " + e );
        }

        return id;
    }

    public static int replaceSignedLIcontract( String ReferenceNumber, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        ResultSet res = null;

        try {

            System.out.println( "replaceSignedLIcontract......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            System.out.println( "ReferenceNumber: " + ReferenceNumber );
            System.out.println( "moveFile: " + moveFileNameReplaced );
            System.out.println( "moveFileName: " + moveFileName );

            String query = "UPDATE ILGAS.GrantApplication SET  signedLIContract = ?, signedLIContractName = ? WHERE ReferenceNumber = ?";
            ps1 = conn.prepareStatement( query );

            ps1.setString( 1, moveFileNameReplaced );
            ps1.setString( 2, moveFileName );
            ps1.setString( 3, ReferenceNumber );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 Excepion while accessing database " + e );
        }

        return id;
    }

    public static int insertCoverageCuttings( String ReferenceNumber, String moveFileName, String moveFileNameReplaced ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        ResultSet res = null;

        try {

            System.out.println( "insertCoverageCuttings......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            System.out.println( "ReferenceNumber: " + ReferenceNumber );

            System.out.println( "moveFile: " + moveFileNameReplaced );
            System.out.println( "moveFileName: " + moveFileName );

            ps1 = conn.prepareStatement( "INSERT INTO  ILGAS.PressCuttings "
                    + "(ReferenceNumber,\n"
                    + "PressCuttings,\n"
                    + "PressCuttingsName)  "
                    + "values  (?,?,?)" );

            ps1.setString( 1, ReferenceNumber );
            ps1.setString( 2, moveFileNameReplaced );
            ps1.setString( 3, moveFileName );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 Excepion while accessing database " + e );
        }

        return id;
    }

    //updateCover
    public static int updateCover( String ReferenceNumber, String moveFileName, String moveFileNameReplaced ) throws DBException {
        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        int id = 0;
        int idTranslator = 0;
        ResultSet res = null;

        try {

            System.out.println( "updateCover......................:" );
            System.out.println( "ReferenceNumber......................: " + ReferenceNumber );
            System.out.println( "moveFileName......................: " + moveFileName );
            System.out.println( "moveFileNameReplaced......................: " + moveFileNameReplaced );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String query = "UPDATE ILGAS.library SET  Cover = ?, CoverName = ? WHERE referenceNumber = ?";
            ps1 = conn.prepareStatement( query );

            ps1.setString( 1, moveFileNameReplaced );
            ps1.setString( 2, moveFileName );
            ps1.setString( 3, ReferenceNumber );

            ps1.executeUpdate();
            System.out.println( "ps1......................: " + ps1 );
            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
                    System.out.println( "StaffDAO id::   " + id );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, ps2, res );
            throw new DBException( "4 Excepion while accessing database" );
        }

        conn = null;
        ps1 = null;
        ps2 = null;
        id = 0;
        idTranslator = 0;
        res = null;

        try {

            System.out.println( "updateCover......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String query = "UPDATE ILGAS.GrantApplication SET  Cover = ?, CoverName = ? WHERE ReferenceNumber = ?";
            ps1 = conn.prepareStatement( query );

            ps1.setString( 1, moveFileNameReplaced );
            ps1.setString( 2, moveFileName );
            ps1.setString( 3, ReferenceNumber );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    id = res.getInt( 1 );
//                    System.out.println("StaffDAO id::   " + id);
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

    /* updateApplication */
    public static boolean updateApplication( GrantApplication app, String ReferenceNumber, ArrayList<String> Author, String Title, String company, BigDecimal amountApproved, java.util.Date today, String Email ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id = false;
        int committed = 0;
        ResultSet res = null;
        java.sql.Timestamp timestamp = getcurrentTimeStamp();

        System.out.println( " DAO updateApplication ReferenceNumber: " + ReferenceNumber );
        System.out.println( " DAO updateApplication Author: " + Author );

        /* move authors from arraylist to a string */
        String AuthorList = "";

        for ( int al = 0; al < Author.size(); al++ ) {

            AuthorList += Author.get( al );
        }

        System.out.println( " DAO updateApplication AuthorList:1: " + AuthorList );

        /* remove [] from the authors name */
        AuthorList = removeCharacter( AuthorList );

        /*
         * ReferenceNumber contains ApplicationNumber seperated
         * by a "/"
         * find the first occurrence of "/"
         */
        int iend = ReferenceNumber.indexOf( "/" );
        int ApplicationNumber = 0;

        /* get ApplicationNumber from ReferenceNumber */
        if ( iend != -1 ) {
            ApplicationNumber = Integer.parseInt( ReferenceNumber.substring( 0, iend ) );

            System.out.println( "ApplicationNumber ---->> " + ApplicationNumber );
        }

        String applicationYear = ReferenceNumber.substring( iend + 1, ReferenceNumber.length() );

        System.out.println( " DAO  applicationYear: " + applicationYear );

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String updateQuery = "UPDATE  ILGAS.GrantApplication  SET ";

            if ( null != app.getCompany() ) {
                updateQuery += " company = '" + app.getCompany() + "',";
            }
            System.out.println( "updateApplication  getProposedDateOfPublication: " + app.getProposedDateOfPublication() );
            if ( null != app.getProposedDateOfPublication() ) {
                updateQuery += " proposedDateOfPublication = '" + sqlDate( app.getProposedDateOfPublication() ) + "',";
            }
            if ( 0 != app.getPlannedPageExtent() ) {
                updateQuery += " plannedPageExtent = '" + app.getPlannedPageExtent() + "',";
            }
            if ( 0 != app.getProposedPrintRun() ) {
                updateQuery += " proposedPrintRun = '" + app.getProposedPrintRun() + "',";
            }
            if ( null != app.getBreakDownTranslatorFee() ) {
                String breakDownTranslatorFee = app.getBreakDownTranslatorFee().replace( "'", "\\'" );
                System.out.println( "updateApplication  breakDownTranslatorFee: " + breakDownTranslatorFee );
                updateQuery += " breakDownTranslatorFee = '" + breakDownTranslatorFee + "',";
            }
            if ( null != app.getTranslatorFee() ) {
                updateQuery += " translatorFee = '" + app.getTranslatorFee() + "',";
            }
            if ( null != app.getNotesAboutApplication() ) {
                updateQuery += " notesAboutApplication = '" + app.getNotesAboutApplication() + "',";
            }
            updateQuery += " APPROVED = " + app.getAPPROVED() + ",";
            if ( null != app.getStatus() ) {
                updateQuery += " Status = '" + app.getStatus() + "',";
            }
            if ( null != app.getPublicationYear() ) {
                updateQuery += " originalDateOfPublication = '" + app.getPublicationYear() + "',";
            }
            if ( null != app.getOriginalLanguage() ) {
                updateQuery += " originalLanguage = '" + app.getOriginalLanguage() + "',";
            }
            if ( 0 != app.getOriginalPageExtent() ) {
                updateQuery += " originalPageExtent = '" + app.getOriginalPageExtent() + "',";
            }
            if ( null != app.getCountryOfPublication() ) {
                updateQuery += " countryOfPublication = '" + app.getCountryOfPublication() + "',";
            }
            if ( null != app.getForeignPublisher() ) {
                updateQuery += " foreignPublisher = '" + app.getForeignPublisher() + "',";
            }
            if ( null != app.getForeignCountry() ) {
                updateQuery += " foreignCountry = '" + app.getForeignCountry() + "',";
            }
            if ( null != app.getTargetLanguage() ) {
                updateQuery += " targetLanguage = '" + app.getTargetLanguage() + "',";
            }
            System.out.println( "updateApplication  getBoardMeeting: " + app.getBoardMeeting() );
            if ( null != app.getBoardMeeting() ) {
                updateQuery += " boardMeeting = '" + sqlDate( app.getBoardMeeting() ) + "',";
            }
            if ( null != app.getAmountRequested() ) {
                updateQuery += " amountRequested = '" + app.getAmountRequested() + "',";
            }
            if ( null != app.getAmountApproved() ) {
                updateQuery += " amountApproved = '" + app.getAmountApproved() + "',";
            }
            System.out.println( "updateApplication  getPublisherInformedOfMeeting: " + app.getPublisherInformedOfMeeting() );
            if ( null != app.getPublisherInformedOfMeeting() ) {
                updateQuery += " publisherInformedOfMeeting = '" + sqlDate( app.getPublisherInformedOfMeeting() ) + "',";
            }
            if ( null != app.getBoardComments_Instructions() ) {
                updateQuery += " boardComments_Instructions = '" + app.getBoardComments_Instructions() + "',";
            }
            if ( null != app.getContractSentToPublisher() ) {
                updateQuery += " contractSentToPublisher = '" + sqlDate( app.getContractSentToPublisher() ) + "',";
            }
            if ( null != app.getAcknowledgementApproved() ) {
                updateQuery += " acknowledgementApproved = '" + sqlDate( app.getAcknowledgementApproved() ) + "'  ,";
            }
            if ( null != app.getDatePublishedBooksReceived() ) {
                updateQuery += " datePublishedBooksReceived = '" + sqlDate( app.getDatePublishedBooksReceived() ) + "',";
            }
            if ( null != app.getDatePaymentMadeToPublisher() ) {
                updateQuery += " datePaymentMadeToPublisher = '" + sqlDate( app.getDatePaymentMadeToPublisher() ) + "',";
            }
            if ( null != app.getPaymentReferenceNumber() ) {
                updateQuery += " paymentReferenceNumber = '" + app.getPaymentReferenceNumber() + "',";
            }
            if ( null != app.getPaymentStatus() ) {
                updateQuery += " paymentStatus = '" + app.getPaymentStatus() + "',";
            }
            updateQuery += " award = '" + app.getAward() + "',";
            System.out.println( "updateApplication  award: " + app.getAward() );
            updateQuery += " SendPaidEmailtoPublisher = '" + app.getSendPaidEmailtoPublisher() + "',";
            updateQuery += " SendApproveRejectEmailtoPublisher = '" + app.getSendApproveRejectEmailtoPublisher() + "',";

            String amount = NumberFormat.getCurrencyInstance().format( amountApproved );

            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat( "dd/MM/yyyy" );
            String strDate = formatter.format( date );
            System.out.println( strDate );

            System.out.println( "updateApplication  amountApproved: " + amountApproved + " Author  " + AuthorList + "  amount: " + amount + "   today: " + today + "    strDate: " + strDate );

            if ( app.getSendPaidEmailtoPublisher() == 1 ) {

                MailUtil.informPublisherofPayment( ReferenceNumber, AuthorList, Title, company, Email, amount, strDate );
            }

            System.out.println( "updateApplication  SendPaidEmailtoPublisher: " + app.getSendPaidEmailtoPublisher() );
            System.out.println( "updateApplication  SendApproveRejectEmailtoPublisher: " + app.getSendApproveRejectEmailtoPublisher() );

            updateQuery += " lastUpdated ='" + timestamp + "',";
            updateQuery += " bilingual = " + app.getBilingual_edition() + ",";

            if ( null != app.getApproveWithdrawnReject() ) {
                updateQuery += " approveWithdrawnReject = '" + app.getApproveWithdrawnReject() + "',";
            }
            updateQuery += " directorChairDecision = " + app.getDirectorChairDecision();

            updateQuery += "  WHERE ApplicationYear = '" + applicationYear + "'  AND ApplicationNumber = '" + ApplicationNumber + "';";

            System.out.println( "updateApplication  ps1:  1: " + updateQuery );

            ps1 = conn.prepareStatement( updateQuery );

            ps1.executeUpdate();

            conn.commit();

            if ( committed > 0 ) {
                id = true;
            } else {
                id = false;
            }

            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps1, res );
            throw new DBException( "4 Excepion while accessing database" );
        } catch ( MessagingException ex ) {
            java.util.logging.Logger.getLogger( StaffDAO.class.getName() ).log( Level.SEVERE, null, ex );
        }

        return id;
    }

    //updateDocuments
    public static boolean updateDocuments( GrantApplication application, String ReferenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id;
        int committed;
        ResultSet res = null;

        //  String applicationNumber = ReferenceNumber;
        java.sql.Timestamp timestamp = getcurrentTimeStamp();

        System.out.println( "updateDocuments ReferenceNumber:  " + ReferenceNumber );

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            ps1 = conn.prepareStatement( "UPDATE ILGAS.GrantApplication SET "
                    + "agreement = ?,\n"
                    + "agreementDocName = ?,\n"
                    + "contract = ?,\n"
                    + "contractDocName = ?,\n"
                    + "translatorCV = ?,\n"
                    + "translatorCVDocName = ?,\n"
                    + "Original = ?,\n"
                    + "OriginalName = ?,\n"
                    + "copiesTranslationSample = ?,\n"
                    + "copiesTranslationSampleDocName = ?,\n"
                    + "cover = ?,\n"
                    + "coverName = ?,\n"
                    + "addendumRightsAgreement = ?,\n"
                    + "addendumRightsAgreementName = ?,\n"
                    + "proofOfPaymentToTranslator = ?,\n"
                    + "proofOfPaymentToTranslatorName = ?,\n"
                    + "bankDetailsForm = ?,\n"
                    + "bankDetailsFormName = ?,\n"
                    + "signedLIContract = ?,\n"
                    + "signedLIContractName = ?,\n"
                    + "lastUpdated =  ?"
                    + " WHERE ReferenceNumber = '" + ReferenceNumber + "'"
            );

            ps1.setString( 1, application.getAgreement() );
            ps1.setString( 2, application.getAgreementDocName() );
            ps1.setString( 3, application.getContract() );
            ps1.setString( 4, application.getContractDocName() );
            ps1.setString( 5, application.getTranslatorCV() );
            ps1.setString( 6, application.getTranslatorCVDocName() );
            ps1.setString( 7, application.getOriginal() );
            ps1.setString( 8, application.getOriginalName() );
            ps1.setString( 9, application.getCopiesTranslationSample() );
            ps1.setString( 10, application.getCopiesTranslationSampleDocName() );
            ps1.setString( 11, application.getCover() );
            ps1.setString( 12, application.getCoverName() );
            ps1.setString( 13, application.getAddendumRightsAgreement() );
            ps1.setString( 14, application.getAddendumRightsAgreementName() );
            ps1.setString( 15, application.getProofOfPaymentToTranslator() );
            ps1.setString( 16, application.getProofOfPaymentToTranslatorName() );
            ps1.setString( 17, application.getBankDetailsForm() );
            ps1.setString( 18, application.getBankDetailsFormName() );
            ps1.setString( 19, application.getSignedLIContract() );
            ps1.setString( 20, application.getSignedLIContractName() );
            ps1.setTimestamp( 21, getcurrentTimeStamp() );

            System.out.println( "updateDocuments :: ps1:: " + ps1 );
            committed = ps1.executeUpdate();

            conn.commit();

            if ( committed > 0 ) {
                id = true;
            } else {
                id = false;
            }

            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps1, res );
            throw new DBException( "4 Excepion while accessing database" );
        }

        return id;
    }

    // deleteRow
    public static void deleteRow( GrantApplication application ) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "delete from ILGAS.GrantApplication where ReferenceNumber = ?" );
            ps.setString( 1, application.getReferenceNumber() );
            ps.executeUpdate();
            ps.close();
            DBConn.close( conn, ps );

        } catch ( SQLException | ClassNotFoundException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps );
        }
    }

    // updateStatus
    public static void updateStatus( int ReferenceNumber, String status ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "UPDATE ILGAS.GrantApplication set STATUS = ? where ReferenceNumber = ?" );
            ps.setString( 1, status );
            ps.setInt( 2, ReferenceNumber );
            ps.executeUpdate();
            DBConn.close( conn, ps );

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps );
            throw new DBException( "5 Excepion while accessing database" );
        }
    }

    // listAllApplications
    public static List<GrantApplication> listAllApplications() throws DBException {
        List<GrantApplication> listApplications = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT * FROM ILGAS.GrantApplication" );
            res = ps.executeQuery();

            while ( res.next() ) {
                GrantApplication application = new GrantApplication();
//                
//                        >>> Order of fieldnames:
// 1 - ApplicationNumber, 
// 2 - ApplicationYear, 
// 3 - ReferenceNumber, 
// 4 - company, 
// 5 - publisherID, 
// 6 - userID, 
// 7 - agreement, 
// 8 - agreementDocName, 
// 9 - contract, 
//10 - contractDocName, 
//11 - proposedDateOfPublication, 
//12 - proposedPrintRun, 
//13 - plannedPageExtent, 
//14 - translatorCV, 
//15 - translatorCVDocName, 
//16 - numberOfPages, 
//17 - translatorFee, 
//18 - breakDownTranslatorFee, 
//19 - Notes, 
//20 - copiesSent, 
//21 - dateCopiesWereSent, 
//22 - Original, 
//23 - OriginalName, 
//24 - copiesTranslationSample, 
//25 - copiesTranslationSampleDocName, 
//26 - TC_ACCEPTED, 
//27 - APPROVED, 
//28 - Status, 
//29 - Cover, 
//30 - CoverName, 
//31 - originalDateOfPublication, 
//32 - originalLanguage, 
//33 - originalPageExtent, 
//34 - countryOfPublication, 
//35 - foreignPublisher, 
//36 - foreignCountry, 
//37 - targetLanguage, 
//38 - boardMeeting, 
//39 - amountRequested, 
//40 - amountApproved, 
//41 - publisherInformedOfMeeting, 
//42 - boardComments_Instructions, 
//43 - contractSentToPublisher, 
//44 - acknowledgementApproved, 
//45 - datePublishedBooksReceived, 
//46 - datePaymentMadeToPublisher, 
//47 - paymentReferenceNumber, 
//48 - addendumRightsAgreement, 
//49 - addendumRightsAgreementName, 
//50 - proofOfPaymentToTranslator, 
//51 - proofOfPaymentToTranslatorName, 
//51 - bankDetailsForm, 
//53 - bankDetailsFormName, 
//54 - signedLIContract, 
//55 - signedLIContractName, 
//56 - paymentStatus, 
//57 - previousGrantAid, 
//58 - award, 
//59 - salesFigures 
//60 - lastUpdated application

                application.setApplicationNumber( res.getInt( 1 ) );
//                System.out.println("StaffDAO :: getAllApplications   ApplicationNumber:  " + res.getInt(1));
                application.setApplicationYear( res.getString( 2 ) );
//                System.out.println("StaffDAO :: getAllApplications   ApplicationYear:  " + res.getString(2));
                application.setReferenceNumber( res.getString( 3 ) );
//                System.out.println("StaffDAO :: getAllApplications   ReferenceNumber:  " + res.getString(3));
                application.setCompany( res.getString( 4 ) );
                application.setPublisherID( res.getInt( 5 ) );
                application.setUserID( res.getInt( 6 ) );
                application.setAgreement( res.getString( 7 ) );
                application.setAgreementDocName( res.getString( 8 ) );
                application.setContract( res.getString( 9 ) );
                application.setContractDocName( res.getString( 10 ) );
                application.setProposedDateOfPublication( res.getDate( 11 ) );
                application.setProposedPrintRun( res.getInt( 12 ) );
                application.setPlannedPageExtent( res.getInt( 13 ) );
                application.setTranslatorCV( res.getString( 14 ) );
                application.setTranslatorCVDocName( res.getString( 15 ) );
                application.setNumberOfPages( res.getInt( 16 ) );
                application.setTranslatorFee( res.getBigDecimal( 17 ) );
                application.setBreakDownTranslatorFee( res.getString( 18 ) );
                application.setBookNotes( res.getString( 19 ) );
                application.setCopiesSent( res.getInt( 20 ) );
                application.setDateCopiesWereSent( res.getDate( 21 ) );
                application.setOriginal( res.getString( 22 ) );
                application.setOriginalName( res.getString( 23 ) );
                application.setCopiesTranslationSample( res.getString( 24 ) );
                application.setCopiesTranslationSampleDocName( res.getString( 25 ) );
                application.setTC_ACCEPTED( res.getInt( 26 ) );
                application.setAPPROVED( res.getInt( 27 ) );
                application.setStatus( res.getString( 28 ) );
//                application.setApplicationYear(res.getString(27));
                application.setCover( res.getString( 29 ) );
                application.setCoverName( res.getString( 30 ) );
//                application.setOriginalDateOfPublication(res.getDate(31));
                application.setPublicationYear( res.getString( 31 ) );
                application.setOriginalLanguage( res.getString( 32 ) );
                application.setOriginalPageExtent( res.getInt( 33 ) );
                application.setCountryOfPublication( res.getString( 34 ) );
                application.setForeignPublisher( res.getString( 35 ) );
                application.setForeignCountry( res.getString( 36 ) );
                application.setTargetLanguage( res.getString( 37 ) );
                application.setBoardMeeting( res.getDate( 38 ) );
                application.setAmountRequested( res.getBigDecimal( 39 ) );
                application.setAmountApproved( res.getBigDecimal( 40 ) );
                application.setPublisherInformedOfMeeting( res.getDate( 41 ) );
                application.setBoardComments_Instructions( res.getString( 42 ) );
                application.setContractSentToPublisher( res.getDate( 43 ) );
                application.setAcknowledgementApproved( res.getDate( 44 ) );
                application.setDatePublishedBooksReceived( res.getDate( 45 ) );
                application.setDatePaymentMadeToPublisher( res.getDate( 46 ) );
                application.setPaymentReferenceNumber( res.getString( 47 ) );
                application.setAddendumRightsAgreement( res.getString( 48 ) );
                application.setAddendumRightsAgreementName( res.getString( 49 ) );
                application.setProofOfPaymentToTranslator( res.getString( 50 ) );
                application.setProofOfPaymentToTranslatorName( res.getString( 51 ) );
                application.setBankDetailsForm( res.getString( 52 ) );
                application.setBankDetailsFormName( res.getString( 53 ) );
                application.setSignedLIContract( res.getString( 54 ) );
                application.setSignedLIContractName( res.getString( 55 ) );
                application.setPaymentStatus( res.getString( 56 ) );
                //        application.setPreviousGrantAid(previousGrantAid);
                application.setAward( res.getInt( 58 ) );
                application.setSalesFigures( res.getInt( 59 ) );
                application.setLASTUPDATED( res.getTimestamp( 60 ) );

                listApplications.add( application );
            }

            conn.commit();
            DBConn.close( conn, ps, res );

            disconnect();

        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps, res );
            throw new DBException( "4 Excepion while accessing database" );
        }

        return listApplications;
    }

    // convert Java Date to SQL Date
    public static java.sql.Date sqlDate( java.util.Date javaDate ) {
        System.out.println( "convert Java Date to SQL Date  " + javaDate );
        java.util.Date utilStartDate = javaDate;
        java.sql.Date convertSqlDate = new java.sql.Date( utilStartDate.getTime() );

        return convertSqlDate;
    }

    public static int getLastRecordID() throws DBException {
        Connection conn = null;
        PreparedStatement ps1 = null;

        int id = 0;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            ps1 = conn.prepareStatement( "SELECT max(ApplicationNumber) FROM ILGAS.GrantApplication" );
            res = ps1.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    id = res.getInt( 1 );
                }
            }

            conn.commit();
            DBConn.close( conn, ps1, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            e.printStackTrace();
            DBConn.close( conn, ps1, res );
            throw new DBException( "getLastRecordID :: Exception while accessing database" );
        }

        return id;
    }

    public static java.sql.Timestamp getcurrentTimeStamp() {

        Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
        java.sql.Timestamp currentTimestamp = new java.sql.Timestamp( now.getTime() );

        return currentTimestamp;

    }

    public static int getNextApplicationNumber() throws DBException {

        int nextApplicationNumber = 0;

        Connection conn = null;
        PreparedStatement ps1 = null;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            ps1 = conn.prepareStatement( "SELECT * FROM ILGAS.GrantApplication where ApplicationYear = '" + yearInString + "' ORDER BY ApplicationNumber DESC" );
            res = ps1.executeQuery();

            if ( res != null ) {
                if ( res.next() ) {
                    nextApplicationNumber = res.getInt( 1 ) + 1;
                }
            }

            conn.commit();
            DBConn.close( conn, ps1, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            e.printStackTrace();
            DBConn.close( conn, ps1, res );
            throw new DBException( "getNextApplicationNumber :: Exception while accessing database" );
        }

        if ( nextApplicationNumber == 0 ) {
            nextApplicationNumber++;
        }

        System.out.println( "getNextApplicationNumber " + nextApplicationNumber );
        return nextApplicationNumber;
    }

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

    public static int ifTranslatorExist( String translatorName ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        System.out.println( ">>>>>>>>>>>>>  ifTranslatorExist: idTranslator:: <<<<<<<<<<<<<<<<<" );
        int idTranslator = 0;

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT idTranslator FROM ILGAS.Translator WHERE Name = ?" );

            ps.setString( 1, translatorName );

            res = ps.executeQuery();

            System.out.println( ">>>>>>>>>>>>>  ifTranslatorExist: idTranslator:: ps: " + ps );

            if ( res != null ) {

                while ( res.next() ) {
                    idTranslator = res.getInt( 1 );
                }
            }

            DBConn.close( conn, ps, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps, res );

            throw new DBException( "3 Excepion while accessing database" );
        }

        System.out.println( ">>>>>>>>>>>>>  ifTranslatorExist: translatorName = " + translatorName + " idTranslator::: " + idTranslator );

        return idTranslator;
    }

    public static int ifLanguageExist( String language ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int idLanguage = 0;

        language = language.trim();

        try {

            System.out.println( "ifLanguageExist: language:: " + language );

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT id FROM ILGAS.Languages WHERE lang = ?" );

            ps.setString( 1, language );

            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    idLanguage = res.getInt( 1 );

                }
            }

            DBConn.close( conn, ps, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps, res );

            throw new DBException( "3 Excepion while accessing database" );
        }

        return idLanguage;
    }

    public static int insertNewAuthor( String ReferenceNumber, String FullName, String FirstName, String LastName ) throws DBException {

        /*
         * ILGAS.Author is the main Author table where we link Author.Id with
         * the Author.Name
         */
        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        ResultSet res = null;

        int authorId = 0;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = "INSERT INTO  ILGAS.Author (ReferenceNumber, Name, FirstName, LastName) values (?,?,?,?)";

            ps1 = conn.prepareStatement( sql );
            ps1.setString( 1, ReferenceNumber );
            ps1.setString( 2, FullName );
            ps1.setString( 3, FirstName );
            ps1.setString( 4, LastName );

            ps1.executeUpdate();

            System.out.println( "insertNewAuthor  Name  " + FullName + ", FirstName  " + FirstName + ", LastName  " + LastName );

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    authorId = res.getInt( 1 );

                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps1, ps2, res );

            throw new DBException( "4 insertNewAuthor INSERT INTO  ILGAS.Author  Excepion while accessing database" );
        }

        System.out.println( "Name  " + FullName + ", authorId  " + authorId );

        /*
         * now we add the authorId into ILGAS.Author_Gender where we'll add the
         * gender later
         */
        conn = null;
        ps1 = null;
        ps2 = null;

        res = null;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = "INSERT INTO  ILGAS.Author_Gender (idAuthor) values (?)";

            ps1 = conn.prepareStatement( sql );
            ps1.setInt( 1, authorId );

            ps1.executeUpdate();

            System.out.println( "Name  " + FullName + ", FirstName  " + FirstName + ", LastName  " + LastName );

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps1, ps2, res );

            throw new DBException( "4 insertNewAuthor INSERT INTO  ILGAS.Author_Gender Excepion while accessing database" );
        }

        return authorId;
    }

    public static int insertNewTranslator( String Name ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        ResultSet res = null;

        int idTranslator = 0;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = "INSERT INTO  ILGAS.Translator (Name) values (?)";

            ps1 = conn.prepareStatement( sql );

            ps1.setString( 1, Name );

            ps1.executeUpdate();

            System.out.println( "Name  " + Name );

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    idTranslator = res.getInt( 1 );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps1, ps2, res );

            throw new DBException( "4 Excepion while accessing database" );
        }

        return idTranslator;
    }

    public static int insertLanguages_Library( int idLanguages, String lang, int bookID, String ReferenceNumber ) throws DBException {

        System.out.println( "StaffDAO.insertLanguages_Library(  " + idLanguages + " languages " + lang + " bookID " + bookID + " ReferenceNumber " + ReferenceNumber );
        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        ResultSet res = null;

        int idLanguages_Library = 0;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = "INSERT INTO  ILGAS.Languages_Library (idLanguages, lang, bookID, ReferenceNumber) values (?,?,?,?)";

            ps1 = conn.prepareStatement( sql );

            ps1.setInt( 1, idLanguages );
            ps1.setString( 2, lang );
            ps1.setInt( 3, bookID );
            ps1.setString( 4, ReferenceNumber );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    idLanguages_Library = res.getInt( 1 );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps1, ps2, res );

            throw new DBException( "4 Excepion while accessing database" );
        }

        return idLanguages_Library;
    }

    public static int getExpertReaderUserID( String expertReaderName ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        int idExpertReaderUserID = 0;
        System.out.println( "StaffDAO getExpertReaderUserID " );
        System.out.println( "StaffDAO expertReaderName " + expertReaderName );

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT userID FROM ILGAS.users WHERE fullName = ?" );
            ps.setString( 1, expertReaderName );
//            ps.setString(1, "'%" + expertReaderName + "%'");
            System.out.println( "StaffDAO ps " + ps.toString() );
            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    idExpertReaderUserID = res.getInt( 1 );
                    System.out.println( "StaffDAO getExpertReaderUserID " + idExpertReaderUserID );
                }
            }

            DBConn.close( conn, ps, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps, res );

            throw new DBException( "3 Excepion while accessing database" );
        }

        return idExpertReaderUserID;
    }

    public static int updateExpertReader( ExpertReader expertReader, java.sql.Date today ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        ResultSet res = null;

        int idExpertReader = 0;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            String sql = "INSERT INTO ILGAS.expertReader (expertReaderUserID, referenceNumber, sampleSentOut) values (?,?,?)";

            ps1 = conn.prepareStatement( sql );

            ps1.setInt( 1, expertReader.getExpertReaderUserID() );
            ps1.setString( 2, expertReader.getReferenceNumber() );
            ps1.setDate( 3, today );

            ps1.executeUpdate();

            ps2 = conn.prepareStatement( "SELECT LAST_INSERT_ID()" );
            res = ps2.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {

                    idExpertReader = res.getInt( 1 );

                }
            }

            conn.commit();

            DBConn.close( conn, ps1, ps2, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps1, ps2, res );

            throw new DBException( "4 Excepion while accessing database " + e );
        }

        return idExpertReader;
    }

    public static String getExpertReaderEmail( String expertReaderName ) throws DBException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        String expertReaderEmail = "";
        System.out.println( "StaffDAO getExpertReaderEmail " );
        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT email FROM ILGAS.users WHERE fullName = ?" );
            ps.setString( 1, expertReaderName );
//            ps.setString(1, "'%" + expertReaderName + "%'");

            System.out.println( "StaffDAO ps " + ps.toString() );
            res = ps.executeQuery();
            if ( res != null ) {
                while ( res.next() ) {
                    expertReaderEmail = res.getString( 1 );
                    System.out.println( "StaffDAO expertReaderEmail " + expertReaderEmail );
                }
            }
            DBConn.close( conn, ps, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "3 Excepion while accessing database" );
        }

        return expertReaderEmail;
    }

    public static List<String[]> getAttachments( String newAssignedReferenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        List<String[]> attachments = new ArrayList<>();

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT Original, OriginalName, copiesTranslationSample, copiesTranslationSampleDocName "
                    + "FROM ILGAS.GrantApplication WHERE ReferenceNumber = ?" );

            ps.setString( 1, newAssignedReferenceNumber );

            res = ps.executeQuery();

            ResultSetMetaData metadata = res.getMetaData();
            int numcols = metadata.getColumnCount();

            while ( res.next() ) {

                String[] attachmentDetails = new String[ 6 ];

                int i = 1;

                while ( i <= numcols ) {

                    attachmentDetails[ i ] = res.getString( i++ );

                }

                attachments.add( attachmentDetails );
            }

            DBConn.close( conn, ps, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "3 Excepion while accessing database" );
        }

        return attachments;
    }

    public static ArrayList<String> getRightsHolderArrayContent( String ReferenceNumber ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        ArrayList<String> rightsHolderArrayContent = new ArrayList<String>();
        rightsHolderArrayContent.clear();
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            ps1 = conn.prepareStatement( "SELECT TranslationRightsHolderName FROM ILGAS.TranslationRightsHolder WHERE ReferenceNumber = ?" );
            ps1.setString( 1, ReferenceNumber );
            res = ps1.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    rightsHolderArrayContent.add( res.getString( 1 ) );
                    System.out.println( "getRightsHolderArrayContent  retrieving " + res.getString( 1 ) + "......................:" );
                }
            }

            conn.commit();

            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, res );
            throw new DBException( "4 Excepion while accessing database" );
        }

        return rightsHolderArrayContent;

    }

    public static int updateRightsHolderArrayContent( String ReferenceNumber, String[] rightsHolderArrayContent ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        int id = 0;
        ResultSet res = null;

        try {

            System.out.println( "updaterightsHolderArrayContent......................:" );

            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            for ( int i = 0; i < rightsHolderArrayContent.length; i++ ) {
                String translationRightsHolderName = rightsHolderArrayContent[ i ];
                //     String query = "INSERT INTO  ILGAS.TranslationRightsHolder (ReferenceNumber, TranslationRightsHolderName ) VALUES (?,?)";

                String query = "INSERT INTO  ILGAS.TranslationRightsHolder (ReferenceNumber, TranslationRightsHolderName )SELECT * FROM (SELECT ?, ?) AS tmp WHERE NOT EXISTS ( "
                        + "SELECT TranslationRightsHolderName FROM ILGAS.TranslationRightsHolder  WHERE TranslationRightsHolderName = ? AND ReferenceNumber = ? ) LIMIT 1;";

                ps1 = conn.prepareStatement( query );

                ps1.setString( 1, ReferenceNumber );
                ps1.setString( 2, translationRightsHolderName );
                ps1.setString( 3, translationRightsHolderName );
                ps1.setString( 4, ReferenceNumber );

                System.out.println( "updaterightsHolderArrayContent  inserting " + translationRightsHolderName + "......................:" );

                ps1.executeUpdate();

                if ( res != null ) {
                    while ( res.next() ) {

                        id = res.getInt( 1 );
//                    System.out.println("StaffDAO id::   " + id);
                    }
                }
            }
            conn.commit();

            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps1, res );
            throw new DBException( "4 Excepion while accessing database" );
        }

        return id;
    }

    private static java.sql.Timestamp getCurrentTimeStamp() {

        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp( today.getTime() );

    }

    public static int ifTranslatorTrackExist( int idTranslator, String ReferenceNumber, String Title ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int idTranslatorTrack = 0;

        try {

            System.out.println( "ifTranslatorTrackExist: idTranslator:: " + idTranslator + " ReferenceNumber:: " + ReferenceNumber + " Title:: " + Title + "\n" );

            conn = DBConn.getConnection();

            ps = conn.prepareStatement( "SELECT idTranslatorTrack FROM ILGAS.TranslatorTrack\n"
                    + "WHERE  idTranslator = ? \n"
                    + "AND ReferenceNumber = ? ;" );

            ps.setInt( 1, idTranslator );
            ps.setString( 2, ReferenceNumber );
//            ps.setString(3, Title);
            System.out.println( "ifTranslatorTrackExist: ps:: " + ps );
            res = ps.executeQuery();

            if ( res != null ) {
                while ( res.next() ) {
                    idTranslatorTrack = res.getInt( 1 );

                }
            }

            DBConn.close( conn, ps, res );

        } catch ( ClassNotFoundException | SQLException e ) {

            LOGGER.debug( e.getMessage() );

            DBConn.close( conn, ps, res );

            throw new DBException( "3 Excepion while accessing database" );
        }

        return idTranslatorTrack;
    }

    public static boolean rightsHolderArrayContent( String ReferenceNumber ) throws DBException {

        System.out.println( "rightsHolderArrayContent: ReferenceNumber:: " + ReferenceNumber );

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        String rightsHolderContent = "";
        boolean rightsHolderContentExists;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT TranslationRightsHolderName FROM ILGAS.TranslationRightsHolder WHERE ReferenceNumber = ?" );
            ps.setString( 1, ReferenceNumber );
            res = ps.executeQuery();
            System.out.println( "rightsHolderArrayContent: ps:: " + ps );
            if ( res != null ) {
                while ( res.next() ) {

                    rightsHolderContent = res.getString( 1 );

                }
            }

            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e ) {
            LOGGER.debug( e.getMessage() );
            DBConn.close( conn, ps, res );
            throw new DBException( "rightsHolderArrayContent Excepion while accessing database" );
        }

        System.out.println( "rightsHolderArrayContent: rightsHolderContent:: " + rightsHolderContent );
        System.out.println( "rightsHolderArrayContent: rightsHolderContent.length():: " + rightsHolderContent.length() );

        if ( rightsHolderContent.isEmpty() ) {

            System.out.println( "rightsHolderArrayContent: rightsHolderContent.isEmpty():: " + rightsHolderContent.isEmpty() );
        }

        if ( rightsHolderContent.length() > 0 ) {

            rightsHolderContentExists = true;
        } else {
            rightsHolderContentExists = false;
        }

        return rightsHolderContentExists;
    }

    public static String removeCharacter( String word ) {

        System.out.println( "removeCharacter word  " + word );
        String[] specialCharacters = { "[", "}", "]", ",", "." };
        StringBuilder sb = new StringBuilder( word );
        for ( int i = 0; i < sb.toString().length() - 1; i++ ) {
            for ( String specialChar : specialCharacters ) {
                if ( sb.toString().contains( specialChar ) ) {
                    int index = sb.indexOf( specialChar );
                    sb.deleteCharAt( index );
                }
            }
        }
        System.out.println( "removeCharacter sb.toString()  " + sb.toString() );
        return sb.toString();
    }

    /* updatePublisher */
    public static boolean updatePublisher( Publisher publisher, int Company_Number ) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        boolean id;
        int committed;
        ResultSet res = null;
        int CompanyNumber = Company_Number;

        System.out.println( "doing updatePublisher::  " );
        try {
            conn = DBConn.getConnection();
            conn.setAutoCommit( false );

            java.sql.Timestamp timestamp = getcurrentTimeStamp();

            String sql = "UPDATE ILGAS.international_publishers SET Company = ?, Company_Number = ? ,Address1 = ? ,Address2 = ? ,Address3 = ? ,Address4 = ? ,postCode = ? ,City = ? ,Country = ? ,CountryCode = ? ,Telephone = ? ,Fax = ? ,WWW = ? ,DoNotMail = ? ,Bursaries = ?,Founded = ? ,NumberOfTitles = ? ,DateModified = ?,Notes = ?, Status = ?";
            sql += " WHERE Company_Number = " + CompanyNumber;

            System.out.println( "sql::  " + sql );
            System.out.println( "Company_Number::  " + Company_Number );

            System.out.println( "Company:  " + publisher.getCompany() );
            System.out.println( "Company_Number:  " + CompanyNumber );
            System.out.println( "Address1:  " + publisher.getAddress1() );
            System.out.println( "Address2:  " + publisher.getAddress2() );
            System.out.println( "Address3:  " + publisher.getAddress3() );
            System.out.println( "Address4:  " + publisher.getAddress4() );
            System.out.println( "postCode:  " + publisher.getPostCode() );
            System.out.println( "City:  " + publisher.getCity() );
            System.out.println( "Country:  " + publisher.getCountry() );
            System.out.println( "CountryCode:  " + publisher.getCountryCode() );
            System.out.println( "Telephone:  " + publisher.getTelephone() );
            System.out.println( "Fax:  " + publisher.getFax() );
            System.out.println( "WWW:  " + publisher.getWWW() );
            System.out.println( "DoNotMail:  " + publisher.getDoNotMail() );
            System.out.println( "Bursaries:  " + publisher.getBursaries() );
            System.out.println( "Founded:  " + publisher.getFounded() );
            System.out.println( "NumberOfTitles:  " + publisher.getNumberOfTitles() );
            System.out.println( "DateModified:  " + publisher.getDateModified() );
            System.out.println( "Notes:  " + publisher.getNotes() );
            System.out.println( "Notes:  " + publisher.getStatus() );

            ps1 = conn.prepareStatement( sql );

            ps1.setString( 1, publisher.getCompany() );
            ps1.setInt( 2, publisher.getCompany_Number() );
            ps1.setString( 3, publisher.getAddress1() );
            ps1.setString( 4, publisher.getAddress2() );
            ps1.setString( 5, publisher.getAddress3() );
            ps1.setString( 6, publisher.getAddress4() );
            ps1.setString( 7, publisher.getPostCode() );
            ps1.setString( 8, publisher.getCity() );
            ps1.setString( 9, publisher.getCountry() );
            ps1.setString( 10, publisher.getCountryCode() );
            ps1.setString( 11, publisher.getTelephone() );
            ps1.setString( 12, publisher.getFax() );
            ps1.setString( 13, publisher.getWWW() );
            ps1.setString( 14, publisher.getDoNotMail() );
            ps1.setString( 15, publisher.getBursaries() );
            ps1.setString( 16, publisher.getFounded() );
            ps1.setString( 17, publisher.getNumberOfTitles() );
            ps1.setString( 18, publisher.getDateModified() );
            ps1.setString( 19, publisher.getNotes() );
            ps1.setString( 20, publisher.getStatus() );

            System.out.println( "ps1::  " + ps1 );

            committed = ps1.executeUpdate();

            conn.commit();

            if ( committed > 0 ) {
                id = true;
            } else {
                id = false;
            }

            DBConn.close( conn, ps1, res );

        } catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps1, res );
            throw new DBException( "ACpublisherDAO_test updatePublisher - 4 Excepion while accessing database" );
        }

        return id;
    }
}
