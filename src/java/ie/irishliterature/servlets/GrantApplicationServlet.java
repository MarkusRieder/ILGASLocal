package ie.irishliterature.servlets;

import static ie.irishliterature.dao.ACpublisherDAO_test.updatePublisher;
import ie.irishliterature.dao.GrantApplicationDAO;
import static ie.irishliterature.dao.GrantApplicationDAO.getcurrentTimeStamp;
import static ie.irishliterature.dao.GrantApplicationDAO.ifLanguageExist;
import ie.irishliterature.dao.LibraryDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.GrantApplication;
import ie.irishliterature.model.Library;
import ie.irishliterature.model.Publisher;
import java.io.*;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

@WebServlet(name = "GrantApplicationServlet", urlPatterns
        = {
            "/GrantApplicationServlet"
        })
public class GrantApplicationServlet extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger( GrantApplicationServlet.class.getCanonicalName() );
    private static final long serialVersionUID = 7908187011456392847L;

    ////////////////////////////////////////////////////////////////////////////
    ///
    ///  For file upload
    ///
    ////////////////////////////////////////////////////////////////////////////
    private boolean isMultipart;
    private String filePath;
    private String rootPath;
    private final int maxFileSize = 50 * 1024;
    private final int maxMemSize = 4 * 1024;
    //  private File file;
    private String tempPath = "";

    ////////////////////////////////////////////////////////////////////////////
    ///
    ///  For Application
    ///
    ////////////////////////////////////////////////////////////////////////////
    private int ApplicationNumber = 0;
    private String ReferenceNumber;
    private String company;
    private int publisherID;
    private int userID;
    private String agreement; // path to file
    private String contract;  // path to file
    private String proposedDateOfPublication;
    private int proposedPrintRun;
    private String plannedPageExtent;
    private String translatorCV;
    private String translatorName;
    private String languages;
    private String appTargetLanguage;
    private String translatorNotes;
    private String numberOfPages;
    private String breakDownTranslatorFee;
    private String translatorFee;
    private String bookNotes;
    private String copySent;
    private String dateCopiesWereSent;
    private String copiesTranslationSample;  // path to file
    private String TCACCEPTED;
    private String gdprACCEPTED;
    private String ieAPPROVED;
    private String Status;
    private int copiesSent = 0;
    private int TC_ACCEPTED = 0;
    private int gdpr_ACCEPTED = 0;
    private int APPROVED = 0;
    private String Type;

    ////////////////////////////////////////////////////////////////////////////
    ///
    ///  For Publisher Contact details Update
    ///
    ////////////////////////////////////////////////////////////////////////////
    private String firstname;
    private String lastname;
    private String Address1;
    private String Address2;
    private String Address3;
    private String Address4;
    private String postCode;
    private String City;
    private String country;
    private String countryCode;
    private String Telephone;
    private String Email;
    private String Fax;
    private String WWW;
    private String DoNotMail;
    private String Bursaries;
    private String Founded;
    private String NumberOfTitles;
    private String companyNotes;
    private String DateModified;

    ////////////////////////////////////////////////////////////////////////////
    ///
    ///  For Book details
    ///
    ////////////////////////////////////////////////////////////////////////////
    private int bookID;

    private String referenceNumber;

    private ArrayList Author;

    private String authorName;

    private String AuthorFirstName;

    private String AuthorLastName;

    private ArrayList Translator;

    private String writerType;  // options Author, Editor, Translator

    private String Title;

    private String Publisher;

    private String publicationYear;

    private String Genre;

    private String Original;  //file path

    private String Addendum;  //file path

    private String ProofPayment;  //file path

    private String BankDetails;  //file path

    private String SignedLIContract;  //file path

    private String translationTitle;

    private String translationPublisher;

    private String translationPublisherYear;

    private String[] translatorArrayContent;

    private String[] rightsHolderArrayContent;

    private String[] authorArray;  //Array of Author/Title

    private String[] languageArray;

    private ArrayList Languages;

    private String physicalDescription;

    private int Duplicates;

    private String Copies;

    private String originalLanguage;

    private String originalPageExtent;

    private String amountRequested;

    private String targetLanguage;

    private String foreignPublisher;

    private String countryOfPublication;

    private String foreignCountry;

    private String originalDateOfPublication;

    private String ISBN;

    private String ISSN;

    private String Series = "";

    ////////////////////////////////////////////////////////////////////////////
    ///
    ///  For Irish Literature Staff
    ///
    ////////////////////////////////////////////////////////////////////////////
    private String TranslatorTrackRecord;  //Array of Author/Title
    private String Cover;                   // path to file
    private String Sample_Sent_out; //  Date
    private String Sample_Returned; //  Date
    private String Reader_Report;
    private String Date_Contract_Sent_to_Publisher; //  Date
    private String Date_ILE_Acknowlegement_Approved; //  Date
    private String Date_Published_Books_Received; //  Date
    private String Date_Payment_Made_to_Publisher; //  Date
    private String Payment_Reference_Number;
    private String Comments_re_Application;
    private String Board_Meeting;
    private String Date_publisher_informed_of_meeting; //  Date 
    private String Award;
    private String Bilingual;
    private int award = 0; //    boolean
    private int bilingual = 0; //    boolean
    private String Amount_Requested;
    private String Amount_Approved;
    private String Comments_about_Meeting;
    private String Proposed_Publication_Date; //  Date
    private String Previous_Grant_Aid; // Array of Author/Title
    private String Press_cuttings;  //  boolean
    private String Sales_figures;
    private String Anthology; //Array of Author/Title
    private String message = "";

    @Override
    public void init() {

        // Get the file location where they would be stored.
//        tempPath = "/home/glassfish/glassfish/domains/domain1/tempDir";
//        rootPath = "/home/glassfish/glassfish/domains/domain1/docroot/documents";
        tempPath = "/home/markus/test/tempDir";
        rootPath = "/home/markus/public_html/test";

        System.out.println( "file location :tempPath: " + tempPath );
        System.out.println( "file location :rootPath: " + rootPath );
    }

    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        request.setCharacterEncoding( "UTF-8" );

        String name = "";
        HttpSession session = request.getSession();
        System.out.println( "############################### /GrantApplicationServlet ####################################" );
        System.out.println( "Iterate Parameters" );
        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() ) {
            Object objOri = en.nextElement();

            String param = (String) objOri;

            String value = request.getParameter( param );

            System.out.println( "GrantApplicationServlet :: Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = (String) keys.nextElement();
            System.out.println( "GrantApplicationServlet :: key  :" + key + ": " + session.getValue( key ) );

        }

        System.out.println( "###################################################################" );

        String task = request.getParameter( "task" );
        String insert = (String) request.getAttribute( "task" );

        System.out.println( "GrantApplicationServlet :: " );
        System.out.println( "HttpSession session :: sess: task:: " + task );
        System.out.println( "HttpSession session :: sess: insert:: " + insert );

        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );
        System.out.println( "username: " + username );
        System.out.println( "password: " + password );
//        userID = request.getParameter( "userID" );
//        String userid = request.getParameter( "userID" );
//        System.out.println( "userid = request.getParameter( \"userID\" ) " + userid );
//        userID = Integer.parseInt( userid );
        String publisherName = request.getParameter( "publisherName" );
        name = request.getParameter( "name" );
        String Company = request.getParameter( "Company" );
        String PublisherID = request.getParameter( "publisherID" );

        System.out.println( "userID: " + userID );
        System.out.println( "name: " + name );
        System.out.println( "Company: " + Company );
        System.out.println( "publisherName: " + publisherName );
        System.out.println( "PublisherID: " + PublisherID );

        task = "Start New Application";
//        String lastLogon = request.getParameter("lastLogon");
//        long lastLogonForm = Long.parseLong(lastLogon);
        System.out.println( "username: " + username );
        System.out.println( "password: " + password );

        int idxFlag = 0;

        switch ( task ) {
            case "Start New Application":
                System.out.println( "Start New Application :: " );

//                session.setAttribute( "name", name );
//                session.setAttribute( "publisherID", publisherID );
//                request.setAttribute( "publisherID", publisherID );
//                request.setAttribute( "firstname", firstname );
//                request.setAttribute( "lastname", lastname );
//                request.setAttribute( "name", name );
//                request.setAttribute( "userID", userID );
////                userID = Integer.parseInt( request.getParameter( "userID" ) );
//                name = request.getParameter( "name" );
//                Company = request.getParameter( "Company" );
//                PublisherID = request.getParameter( "publisherID" );
//                System.out.println( "userID:1 " + userID );
//                System.out.println( "name:1 " + name );
//                System.out.println( "Company:1 " + Company );
//                System.out.println( "PublisherID:1 " + PublisherID );
//                session.setAttribute( "publisherName", publisherName );
//                request.setAttribute( "publisherName", publisherName );
                //set Status
                Status = "open";
                int translatorArrayLength = 0;
                int rightsHolderArrayLength = 0;
                int languageArrayLength = 0;
                //set Timestamp and format
                String timeStamp = new SimpleDateFormat( "yyyy.MM.dd.HH.mm.ss" ).format( new Date() );
                Calendar now = Calendar.getInstance();

                //set Year used in filePath
                int year = now.get( Calendar.YEAR );
                String yearInString = String.valueOf( year );
//                String fn;

                int idxFolderNames = 0;
                java.sql.Timestamp timestamp = getcurrentTimeStamp();

                String[] fileNames = new String[ 6 ];
                //   String[] justFiles = new String[6];
                List<String> filesToBeMoved = new ArrayList<>();
//                List<String> fileDir = new ArrayList<>();
                List<String> longArrayList = new ArrayList<>();
                List<String> shortArrayList = new ArrayList<>();
                message = "";
//                String[] folderNames = {
//                    "Agreement",
//                    "Contract",
//                    "Addendum",
//                    "Translator_CV",
//                    "Original",
//                    "TranslationSample"
//                };
                try {

                    /*
                     * Check that we have a file upload request
                     */
                    isMultipart = ServletFileUpload.isMultipartContent( request );
                    System.out.println( "isMultipart:: " + isMultipart );
                    response.setContentType( "text/html;charset=UTF-8" );

                    DiskFileItemFactory factory = new DiskFileItemFactory();

                    /*
                     * maximum size that will be stored in memory
                     */
                    factory.setSizeThreshold( maxMemSize );

                    /*
                     * Location to save data that is larger than maxMemSize.
                     */
                    factory.setRepository( new File( tempPath ) );

                    /*
                     * Create a new file upload handler
                     */
                    ServletFileUpload upload = new ServletFileUpload( factory );
                    /*
                     * maximum file size to be uploaded.
                     */
                    //  upload.setSizeMax(maxFileSize);

                    /*
                     * Parse the request to get file items.
                     */
                    List<FileItem> items = upload.parseRequest( request );

                    for ( FileItem item : items ) {
                        if ( item.isFormField() ) {

                            /*
                             * Process regular form field (input
                             * type="text|radio|checkbox|etc", select, etc).
                             * collect all data input from input fileds
                             */
                            String fieldname = item.getFieldName();
//                            String fieldvalue = item.getString();
                            String fieldvalue = item.getString( "UTF-8" ).trim();

                            System.out.println( "fieldname: " + fieldname + " >> fieldvalue: " + fieldvalue );
                            switch ( fieldname ) {
                                case "name":
                                    name = fieldvalue;
                                    System.out.println( "name = fieldvalue" + name );
                                    break;
                                case "Company":
                                    company = fieldvalue;
                                    break;
                                case "Company_Number":
                                    publisherID = Integer.parseInt( fieldvalue );
                                    break;
                                case "firstname":
                                    firstname = fieldvalue;
                                    break;
                                case "lastname":
                                    lastname = fieldvalue;
                                    break;
                                case "Address1":
                                    Address1 = fieldvalue;
                                    break;
                                case "Address2":
                                    Address2 = fieldvalue;
                                    break;
                                case "Address3":
                                    Address3 = fieldvalue;
                                    break;
                                case "Address4":
                                    Address4 = fieldvalue;
                                    break;
                                case "City":
                                    City = fieldvalue;
                                    break;
                                case "postCode":
                                    postCode = fieldvalue;
                                    break;
                                case "Country":
                                    country = fieldvalue;
                                    break;
                                case "Country_Code":
                                    countryCode = fieldvalue;
                                    System.out.println( " Country_Code  " + countryCode );
                                    break;
                                case "Email":
                                    Email = fieldvalue;
                                    break;
                                case "Telephone":
                                    Telephone = fieldvalue;
                                    break;
                                case "Fax":
                                    Fax = fieldvalue;
                                    break;
                                case "WWW":
                                    WWW = fieldvalue;
                                    break;
                                case "doNotMail":
                                    DoNotMail = fieldvalue;
                                    break;
                                case "Bursaries":
                                    Bursaries = fieldvalue;
                                    break;
                                case "Founded":
                                    Founded = fieldvalue;
                                    break;
                                case "NumberOfTitles":
                                    NumberOfTitles = fieldvalue;
                                    break;
                                case "companyNotes":
                                    companyNotes = fieldvalue;
                                    break;
                                case "destination":
                                    Type = fieldvalue;
                                    break;
                                case "userID":
                                    userID = Integer.parseInt( fieldvalue );
                                    break;
                                case "publisherID":
                                    publisherID = Integer.parseInt( fieldvalue );
                                    break;
                                case "proposedDateOfPublication":
                                    proposedDateOfPublication = fieldvalue;
                                    break;
                                case "appproposedPrintRun":
                                    String propPrintRun = fieldvalue.replaceAll( "[^0-9]", "" );
                                    proposedPrintRun = Integer.parseInt( propPrintRun );
                                    break;
                                case "plannedPageExtent":
                                    plannedPageExtent = fieldvalue;
                                    break;
                                case "BreakDownOfTranslatorFee":
                                    breakDownTranslatorFee = fieldvalue;
                                    break;
                                case "translatorName":
                                    translatorName = fieldvalue;
                                    //                 System.out.println("translatorName:: " + translatorName);
                                    break;
                                case "translatorFee":
                                    translatorFee = fieldvalue;
                                    break;
                                case "translatorNotes":
                                    translatorNotes = fieldvalue;
                                    break;
                                /*
                                 * taken out for Covid-19
                                 *
                                 * case "copiesSent":
                                 * copySent = fieldvalue;
                                 * if ( "ticked".equals( copySent ) ) {
                                 * copiesSent = 1;
                                 * }
                                 * else {
                                 * copiesSent = 0;
                                 * }
                                 * break;
                                 * case "dateCopiesWereSent":
                                 * dateCopiesWereSent = fieldvalue;
                                 * break;
                                 */
                                case "tcACCEPTED":
                                    TCACCEPTED = fieldvalue;
                                    System.out.println( "TCACCEPTED  GrantApplicationServlet:: fieldvalue " + fieldvalue );
                                    System.out.println( " TCACCEPTED  " + TCACCEPTED );

                                    if ( "ticked".equals( TCACCEPTED ) ) {
//                                        if ( TCACCEPTED = 1 ) {
                                        TC_ACCEPTED = 1;
                                        System.out.println( "( \"1\".equals( TCACCEPTED ) TC_ACCEPTED  GrantApplicationServlet:: " + TC_ACCEPTED );
                                    } else {
                                        TC_ACCEPTED = 0;
                                        System.out.println( "TC_ACCEPTED 0 GrantApplicationServlet:: " + TC_ACCEPTED );
                                    }
                                    break;
                                case "gdprACCEPTED":
                                    gdprACCEPTED = fieldvalue;
                                    System.out.println( " gdprACCEPTED  " + gdprACCEPTED );
                                    if ( "ticked".equals( gdprACCEPTED ) ) {
                                        gdpr_ACCEPTED = 1;
                                    } else {
                                        gdpr_ACCEPTED = 0;
                                    }
                                    break;
                                case "Award":
                                    Award = fieldvalue;
                                    if ( "ticked".equals( Award ) ) {
                                        award = 1;
                                    } else {
                                        award = 0;
                                    }
                                    break;
                                case "bilingual":
                                    Bilingual = fieldvalue;
                                    if ( "ticked".equals( Bilingual ) ) {
                                        bilingual = 1;
                                    } else {
                                        bilingual = 0;
                                    }
                                    break;
                                case "APPROVED":
                                    ieAPPROVED = fieldvalue;
                                    if ( "ticked".equals( ieAPPROVED ) ) {
                                        APPROVED = 1;
                                    } else {
                                        APPROVED = 0;
                                    }
                                    break;
                                case "authorArray":
                                    authorArray = fieldvalue.split( "," ); //split string by ,
                                    System.out.println( "authorArraylength  GrantApplicationServlet:: " + authorArray.length );
                                    for ( String individualValue : authorArray ) {
                                        System.out.println( "authorArray  GrantApplicationServlet:: " + individualValue );
                                    }
                                    break;
                                case "AuthorFirstName":
                                    AuthorFirstName = fieldvalue;
                                    System.out.println( "AuthorFirstName GrantApplicationServlet:: " + AuthorFirstName );
                                    break;
                                case "AuthorLastName":
                                    AuthorLastName = fieldvalue;
                                    System.out.println( "AuthorLastName GrantApplicationServlet:: " + AuthorLastName );
                                    break;
                                case "title":
                                    Title = fieldvalue;
                                    System.out.println( "Title GrantApplicationServlet:: " + Title );
                                    break;
                                case "copies":
                                    Copies = fieldvalue;
                                    break;
                                case "publicationYear":
                                    publicationYear = fieldvalue;
                                    break;
                                case "genre":
                                    Genre = fieldvalue;
                                    System.out.println( "Genre GrantApplicationServlet:: " + Genre );
                                    break;
                                case "addendum":
                                    Addendum = fieldvalue;
                                    break;
                                case "proofPayment":
                                    ProofPayment = fieldvalue;
                                    break;
                                case "bankDetailForm":
                                    BankDetails = fieldvalue;
                                    break;
                                case "signedLIcontract":
                                    SignedLIContract = fieldvalue;
                                    break;
                                case "originalSample":
                                    Original = fieldvalue;
                                    break;
                                case "translationTitle":
                                    translationTitle = fieldvalue;
                                    break;
                                case "translationPublicationYear":
                                    translationPublisherYear = fieldvalue;
                                    break;
                                case "translatorArray":
                                    System.out.println( "translatorArray >>>> HERE " );
                                    translatorArrayContent = fieldvalue.split( "," ); //split string by ","
                                    translatorArrayLength = translatorArrayContent.length;
                                    System.out.println( "translatorArray >>>> translatorArray.length " + translatorArrayContent.length );
                                    for ( String individualValue : translatorArrayContent ) {
                                        System.out.println( "translatorArray  GrantApplicationServlet:: " + individualValue + " ----------> translatorArrayLength::  " + translatorArrayLength );
                                    }
                                    break;

                                case "rightsHolderArray":
                                    System.out.println( "rightsHolderArray >>>> HERE " );
                                    rightsHolderArrayContent = fieldvalue.split( "," ); //split string by ","
                                    rightsHolderArrayLength = rightsHolderArrayContent.length;
                                    System.out.println( "rightsHolderArray >>>> rightsHolderArray.length " + rightsHolderArrayContent.length );
                                    for ( String individualValue : rightsHolderArrayContent ) {
                                        System.out.println( "rightsHolderArray  GrantApplicationServlet:: " + individualValue + " ----------> rightsHolderArrayLength::  " + rightsHolderArrayLength );
                                    }
                                    break;
                                case "languages":
                                    languageArray = fieldvalue.split( "," ); //split string by ,
                                    for ( String individualValue : languageArray ) {
                                        //                  System.out.println("languageArray  GrantApplicationServlet:: " + individualValue);
                                    }
                                    break;
                                case "physicalDescription":
                                    physicalDescription = fieldvalue;
                                    break;
                                case "duplicates":
                                    if ( "".equals( fieldvalue ) ) {
                                        fieldvalue = "0";
                                    }
                                    Duplicates = Integer.parseInt( fieldvalue );
                                    break;
                                case "translationPublisher":
                                    translationPublisher = fieldvalue;
                                    break;
                                case "bookNotes":
                                    bookNotes = fieldvalue;
                                    break;
                                case "series":
                                    Series = fieldvalue;
                                    break;
                                case "isbn":
                                    ISBN = fieldvalue;
                                    break;
                                case "issn":
                                    ISSN = fieldvalue;
                                    break;
                                case "appLanguageOriginal":
                                    originalLanguage = fieldvalue;
                                    System.out.println( "originalLanguage  GrantApplicationServlet:: " + originalLanguage );
                                    break;
                                case "originalPageExtent":
                                    originalPageExtent = fieldvalue;
                                    System.out.println( "originalPageExtent  GrantApplicationServlet:: " + originalPageExtent );
                                    break;
                                case "countryOfPublication":
                                    countryOfPublication = fieldvalue;
                                    break;
                                case "amountRequested":
                                    amountRequested = fieldvalue;
                                    break;
                                case "appTargetLanguage":
                                    targetLanguage = fieldvalue;
                                    System.out.println( "targetLanguage  GrantApplicationServlet:: " + targetLanguage );
                                    languageArray = fieldvalue.split( "," ); //split string by ,
                                    languageArrayLength = languageArray.length;
                                    for ( String individualValue : languageArray ) {
                                        System.out.println( "languageArray  GrantApplicationServlet:: " + individualValue );
                                    }
                                    break;
                                case "appForeignCountry":
                                    foreignCountry = fieldvalue;
                                    break;
                                case "appForeignPublisher":
                                    foreignPublisher = fieldvalue;
                                    break;
                                case "DateOfPublicationOriginal":
                                    originalDateOfPublication = fieldvalue;
                                    break;

                            } // end switch

                        } else {

                            //////////////////////////////////////////////////////////////
                            //  Process Application Form file field (input type="file") //
                            //////////////////////////////////////////////////////////////
                            String fieldname = item.getFieldName();
                            String filename = FilenameUtils.getName( item.getName() );
                            System.out.println( "FilenameUtils.getName filename  " + filename );
//                            Change TranslatorTrack table to accomodate fieldnme etc
//                                    Store files there

                            int counter = getCounter( fieldname );
                            String fileName = getFdname( fieldname );

                            String fdnameArray[] = fieldname.split( "-" );

                            String fdname = fdnameArray[ 0 ];

                            System.out.println( "FilenameUtils.getName counter    " + counter );

                            System.out.println( "FilenameUtils.getName fieldname  " + fieldname );

                            System.out.println( "FilenameUtils.getName fdname  " + fdname );

                            System.out.println( "getCounter( fieldname ) counter :" + counter + ": fieldname :" + fieldname + ": filename :" + filename );

                            System.out.println( "translatorArrayContent.length " + translatorArrayContent.length );

                            System.out.println( "translatorArrayContent counter  " + translatorArrayContent[ counter ] );

                            if ( idxFlag == 0 ) {

                                for ( String translatorArrayContent1 : translatorArrayContent ) {
                                    System.out.println( "translatorArrayContent LOOP  " + translatorArrayContent1 );
                                }
                                idxFlag++;
                            }

                            System.out.println( "switch ( " + fdname + ")" );

                            switch ( fdname ) {

                                case "Agreement":
                                    if ( filename.isEmpty() ) {
                                        System.out.println( "Agreement filename.isEmpty()  filename " + filename );
                                    } else {
                                        filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                                + "Agreement" + File.separator + rightsHolderArrayContent[ counter ] + File.separator;
                                        fileNames[ idxFolderNames ] = filePath + filename;
                                        filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                        System.out.println( "Agreement  rightsHolderArrayContent[" + counter + "] =  " + rightsHolderArrayContent[ counter ] );
                                        System.out.println( "Agreement filename " + fileNames[ idxFolderNames ] );
                                    }
                                    break;

                                case "Contract":
                                    if ( filename.isEmpty() ) {
                                        System.out.println( "Contract filename.isEmpty()  filename " + filename );
                                    } else {
                                        filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                                + "Contract" + File.separator + translatorArrayContent[ counter ] + File.separator;
                                        fileNames[ idxFolderNames ] = filePath + filename;
                                        filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                        System.out.println( "Contract  translatorArrayContent[" + counter + "] =  " + translatorArrayContent[ counter ] );
                                        System.out.println( "Contract  filename " + fileNames[ idxFolderNames ] );

                                    }
                                    break;

                                case "Addendum":
                                    if ( filename.isEmpty() ) {
                                        System.out.println( "Addendum filename.isEmpty()  filename " + filename );
                                    } else {
                                        filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                                + "Addendum" + File.separator + rightsHolderArrayContent[ counter ] + File.separator;
                                        fileNames[ idxFolderNames ] = filePath + filename;
                                        filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                        System.out.println( "Addendum  rightsHolderArrayContent[" + counter + "] =  " + rightsHolderArrayContent[ counter ] );
                                        System.out.println( "Addendum  filename " + fileNames[ idxFolderNames ] );
                                    }
                                    break;

                                case "Original":
                                    if ( filename.isEmpty() ) {
                                        System.out.println( "Original filename.isEmpty()  filename " + filename );
                                    } else {
                                        filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                                + "Original" + File.separator;
                                        fileNames[ idxFolderNames ] = filePath + filename;
                                        filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                        System.out.println( "Original  rightsHolderArrayContent[" + counter + "] =  " + rightsHolderArrayContent[ counter ] );
                                        System.out.println( "Original  filename " + fileNames[ idxFolderNames ] );
                                    }
                                    break;

                                case "TranslationSample":
                                    if ( filename.isEmpty() ) {
                                        System.out.println( "TranslationSample filename.isEmpty()  filename " + filename );
                                    } else {
                                        filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                                + "TranslationSample" + File.separator;
                                        fileNames[ idxFolderNames ] = filePath + filename;
                                        filesToBeMoved.add( fileNames[ idxFolderNames ] );

                                        System.out.println( "TranslationSample  filename " + fileNames[ idxFolderNames ] );
                                    }
                                    break;

                                case "Translator_CV":
                                    if ( filename.isEmpty() ) {
                                        System.out.println( "Translator_CV filename.isEmpty()  filename " + filename );
                                    } else {
                                        filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                                + "Translator_CV" + File.separator + translatorArrayContent[ counter ] + File.separator;
                                        fileNames[ idxFolderNames ] = filePath + filename;
                                        filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                        System.out.println( "Translator_CV  translatorArrayContent[" + counter + "] =  " + translatorArrayContent[ counter ] );
                                        System.out.println( "Translator_CV  tempPath " + tempPath );
                                        System.out.println( "Translator_CV  yearInString " + yearInString );
                                        System.out.println( "Translator_CV  company " + company );
                                        System.out.println( "Translator_CV  translatorArrayContent[" +  counter + " ] " + translatorArrayContent[ counter ] );
                                        System.out.println( "Translator_CV  filePath " + filePath );
                                        System.out.println( "Translator_CV  filename " + fileNames[ idxFolderNames ] );
                                    }
                                    break;

                            } // end switch

                            /*
                             * create temporary Directory if it does not exist
                             */
                            System.out.println( "filename.equals 1  " + filename + " filePath " + filePath + " fileNames[ idxFolderNames ] " + fileNames[ idxFolderNames ] );
                            if ( filename.isEmpty() ) {
                                System.out.println( "fileName.equals 2 filename.isEmpty() filename.isEmpty " + fileName + " filePath " + filePath );
                            } else {
                                File file = new File( filePath );
                                System.out.println( "File file >>> filePath: " + filePath + " filename: " + filename );
                                if ( !file.exists() ) {
                                    System.out.println( "creating Temporary Directory: file.getName()  " + file.getName() );
                                    System.out.println( "creating Temporary Directory: file.getPath()  " + file.getPath() );
                                    file.mkdirs();
                                }

                                System.out.println( "filePath: " + filePath + " filename: " + filename );
                                OutputStream outS = null;
                                InputStream filecontent = null;

                                System.out.println( "Upload file: " + filePath + filename );
//                                works with contract but not Translator_CV
                                try {
                                    outS = new FileOutputStream( new File( filePath + filename ) );
                                    System.out.println( "outS: " + outS + " filename: " + filename );
                                    filecontent = item.getInputStream();

                                    message = message + " '" + filename + "'<br/>";

                                    int read;
                                    final byte[] bytes = new byte[ 1024 ];

                                    while ( ( read = filecontent.read( bytes ) ) != -1 ) {
                                        outS.write( bytes, 0, read );

                                    }

                                } catch ( FileNotFoundException fne ) {

                                    String errMsg = "<br/><br/>You either did not specify a file to upload or are "
                                            + "trying to upload a file to a protected or nonexistent "
                                            + "location.<br/> <br/><strong> ERROR:<strong> '" + fne.getMessage() + "' ";

                                    request.setAttribute( "message", " '<strong>" + filename + "</strong>" + errMsg );
                                    request.getRequestDispatcher( "/WEB-INF/views/uploadErrorResponse.jsp" ).forward( request, response );
                                    LOGGER.log( Level.SEVERE, "Problems during file upload. Error: {0}",
                                            new Object[]{
                                                fne.getMessage()
                                            } );
                                    System.out.println( "errMsg: " + errMsg );
                                } finally {

                                    if ( outS != null ) {
                                        outS.close();
                                    }

                                    if ( filecontent != null ) {
                                        filecontent.close();
                                    }
                                }
                            }
                        } // else
                        session.setAttribute( "name", name );
                        session.setAttribute( "publisherID", publisherID );
                        request.setAttribute( "publisherID", publisherID );
                        request.setAttribute( "firstname", firstname );
                        request.setAttribute( "lastname", lastname );
                        request.setAttribute( "name", name );
                        request.setAttribute( "userID", userID );
//                userID = Integer.parseInt( request.getParameter( "userID" ) );
                        name = request.getParameter( "name" );
                        Company = request.getParameter( "Company" );
                        PublisherID = request.getParameter( "publisherID" );
//                System.out.println( "userID:1 " + userID );
//                System.out.println( "name:1 " + name );
//                System.out.println( "Company:1 " + Company );
//                System.out.println( "PublisherID:1 " + PublisherID );
                        session.setAttribute( "publisherName", publisherName );
                        request.setAttribute( "publisherName", publisherName );
                    }  // for (FileItem item : items)

                    ////////////////////////////////////////////////////////////
                    //  Process Application
                    ////////////////////////////////////////////////////////////
                    GrantApplication application = new GrantApplication();

                    application.setApplicationYear( yearInString );
                    application.setCompany( company );
                    application.setPublisherID( publisherID );
                    application.setUserID( userID );

                    /*
                     * Book Details
                     */
                    application.setOriginalLanguage( originalLanguage );
                    application.setCountryOfPublication( countryOfPublication );
                    application.setOriginalPageExtent( Integer.parseInt( originalPageExtent ) );
//                    application.setOriginalDateOfPublication(convertDate(originalDateOfPublication));
                    application.setPublicationYear( publicationYear );
                    application.setForeignCountry( foreignCountry );
                    application.setForeignPublisher( foreignPublisher );

                    /*
                     * Rights Agreement & Contracts
                     */
 /*
                     * Publication Details
                     */
                    application.setProposedDateOfPublication( convertDate( proposedDateOfPublication ) );
                    application.setProposedPrintRun( proposedPrintRun );
                    application.setPlannedPageExtent( Integer.parseInt( plannedPageExtent ) );
                    application.setTargetLanguage( targetLanguage ); // we get that from the Languages_Library table
                    application.setBilingual_edition( bilingual );
                    /*
                     * Translator Details
                     */

                    application.setBreakDownTranslatorFee( breakDownTranslatorFee );
                    BigDecimal tf = new BigDecimal( translatorFee.replaceAll( ",", "" ) );
                    application.setTranslatorFee( tf );

                    /*
                     * Original Work & Sample Translation
                     */
 /*
                     * taken out for Covid-19
                     *
                     * application.setCopiesSent( copiesSent );
                     * application.setDateCopiesWereSent( convertDate(
                     * dateCopiesWereSent ) );
                     */
                    application.setTranslatorNotes( translatorNotes );
                    application.setBookNotes( bookNotes );
                    application.setTC_ACCEPTED( TC_ACCEPTED );
                    application.setGdprACCEPTED( gdpr_ACCEPTED );

                    System.out.println( "application.setTC_ACCEPTED " + TC_ACCEPTED );
                    System.out.println( "application.setGdprACCEPTED " + gdpr_ACCEPTED );

                    application.setAPPROVED( APPROVED );
                    application.setStatus( Status );
                    BigDecimal ar = new BigDecimal( translatorFee.replaceAll( ",", "" ) );
                    application.setAmountRequested( ar );

                    try {

                        /*
                         * ReferenceNumber = ApplicationNumber + "/" +
                         * yearInString;
                         */
                        ReferenceNumber = GrantApplicationDAO.insertRow( application );

                        /*
                         * ReferenceNumber contains ApplicationNumber seperated
                         * by a "/"
                         * find the first occurrence of "/"
                         */
                        int iend = ReferenceNumber.indexOf( "/" );

                        /*
                         * get ApplicationNumber from ReferenceNumber
                         */
                        if ( iend != -1 ) {
                            ApplicationNumber = Integer.parseInt( ReferenceNumber.substring( 0, iend ) );
                            System.out.println( "ApplicationNumber ---->> " + ApplicationNumber );
                        }

                        /*
                         * Process Authors
                         * String[3] => Name, FirstName, LastName
                         */
                        String[] processingAuthorArray = new String[ 3 ];

                        /*
                         * convert processingArray to ArrayList Author
                         */
                        Author = new ArrayList<>( Arrays.asList( processingAuthorArray ) );

                        if ( authorArray.length > 1 ) {

                            int idx = 0;

                            /*
                             * loop through the Authors and insert each into
                             * Author table
                             */
                            for ( String individualValue : authorArray ) {

                                String AuthorName = individualValue;
                                processingAuthorArray[ idx ] = AuthorName;

                                System.out.println( "AuthorName ---->> " + AuthorName );

                                /*
                                 * when we have a complete set (FullName,
                                 * FirstName, LastName)
                                 */
                                if ( idx == processingAuthorArray.length - 1 ) {

                                    /*
                                     * set the variables and
                                     */
                                    String Name = processingAuthorArray[ 0 ];
                                    String FirstName = processingAuthorArray[ 1 ];
                                    String LastName = processingAuthorArray[ 2 ];

                                    authorName = Name;

                                    /*
                                     * insert them into the tables
                                     * Application_Author
                                     */
                                    GrantApplicationDAO.insertAuthors( ReferenceNumber, Name, FirstName, LastName );

                                    /*
                                     * reset index
                                     */
                                    idx = -1;
                                }

                                idx++;
                            }
                        } else {
                            authorName = AuthorFirstName + " " + AuthorLastName;
                            System.out.println( "authorName ---->> :::: " + authorName );
                            /*
                             * insert them into the tables Application_Author
                             */

                            GrantApplicationDAO.insertAuthors( ReferenceNumber, authorName, AuthorFirstName, AuthorLastName );
                        }

                    } catch ( DBException | MessagingException ex ) {
                        Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }

                } catch ( ParseException | FileUploadException ex ) {
                    Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                }

                ////////////////////////////////////////////////////////////
                //  Process Publisher
                ////////////////////////////////////////////////////////////
                Publisher publisher = new Publisher();

                publisher.setCompany( company );
                publisher.setCompany_Number( publisherID );
                publisher.setAddress1( Address1 );
                publisher.setAddress2( Address2 );
                publisher.setAddress3( Address3 );
                publisher.setAddress4( Address4 );
                publisher.setPostCode( postCode );
                publisher.setCity( City );
                publisher.setCountry( country );
                publisher.setCountryCode( countryCode );
                publisher.setTelephone( Telephone );
                publisher.setEmail( Email );
                publisher.setFax( Fax );
                publisher.setWWW( WWW );

                String doNotMail;

                if ( "true".equals( DoNotMail ) ) {
                    doNotMail = "1";
                } else {
                    doNotMail = "0";
                }

                publisher.setDoNotMail( doNotMail );

                String bursaries;

                if ( "true".equals( Bursaries ) ) {
                    bursaries = "1";
                } else {
                    bursaries = "0";
                }

                publisher.setBursaries( bursaries );
                publisher.setFounded( Founded );
                publisher.setNumberOfTitles( NumberOfTitles );

                publisher.setDateModified( timeStamp );
                publisher.setNotes( companyNotes );
                publisher.setStatus( "" );

                 {
                    try {
                        updatePublisher( publisher, publisherID );
                    } catch ( DBException ex ) {
                        Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }
                }

                /*
                 * Process translation rights holder
                 */
                System.out.println( "Process rightsHolderArrayContent " );
                System.out.println( "rightsHolderArrayContent.length " + rightsHolderArrayContent.length );

                if ( rightsHolderArrayContent.length > 0 ) {
                    System.out.println( "rightsHolderArrayContent.length " + rightsHolderArrayContent.length );
                    System.out.println( "rightsHolderArrayContent " );
                    System.out.println( Arrays.toString( rightsHolderArrayContent ) );
                    try {
                        GrantApplicationDAO.updateRightsHolderArrayContent( ReferenceNumber, rightsHolderArrayContent );
                    } catch ( DBException ex ) {
                        Logger.getLogger( OpenApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }
                }
                /*
                 * Update GrantApplication to contain the filePaths
                 * =================================================
                 * path = path + File.separator + yearInString + File.separator
                 * + Company + File.separator + Type + ApplicationNumber;
                 * upload to temp dir then move to final directory
                 */
                List<String> translatorFileDetails = new ArrayList<>();

                System.out.println( "####################### creating the lists ##################################################" );

                System.out.println( "filesToBeMoved.size()  " + filesToBeMoved.size() );

                for ( int i = 0; i < filesToBeMoved.size(); i++ ) {
                    System.out.println( "ffilesToBeMoved.get(i) " + filesToBeMoved.get( i ) );
                }

                for ( int i = 0; i < filesToBeMoved.size(); i++ ) {

                    String moveFile = "";
                    String moveFileName = "";
                    String destinationDirectory = "";

                    String[] subDirs = filesToBeMoved.get( i ).split( "(?<!^)/" );

                    System.out.println( " Print Loop subDirs.lenght  " + subDirs.length );

                    for ( int j = 0; j < subDirs.length; j++ ) {
                        System.out.println( " Print Loop subDirs [" + j + "]  " + subDirs[ j ] );
                    }
                    System.out.println( "ffilesToBeMoved.get(i) " + filesToBeMoved.get( i ) );
                    String decider = subDirs[ 6 ];

                    System.out.println( "filesToBeMoved  decider --" + decider + "--->>>> " );

                    switch ( decider ) {

                        case "Addendum":
                        case "Agreement":
                            for ( int j = 0; j < subDirs.length; j++ ) {
                                System.out.println( " Print Loop case \"Agreement\"  subDirs [" + j + "]  " + subDirs[ j ] );
                            }
                            String subDirectory = subDirs[ 6 ];  // Addendum
                            String subNameDirectory = subDirs[ 7 ];  // Translator Name2
                            moveFileName = subDirs[ 8 ];  // addendum to the rights agreement 2.docx 

                            destinationDirectory = rootPath + File.separator + yearInString + File.separator + company + File.separator
                                    + ApplicationNumber + File.separator + subDirectory + File.separator + subNameDirectory + File.separator;

                            moveFile = destinationDirectory + moveFileName;
                            translatorFileDetails.add( moveFile );
                            translatorFileDetails.add( moveFileName );

                            System.out.println( "filesToBeMoved--" + decider + "--->>>> " + moveFile );
                            System.out.println( "filesToBeMoved--destinationDirectory  " + decider + "--->>>> " + destinationDirectory );
                            longArrayList.add( moveFile );
                            break;
                        /*
                         * Contract with Translator
                         * Translator CV
                         */
                        case "Contract":
                        case "Translator_CV":
                            for ( int j = 0; j < subDirs.length; j++ ) {
                                System.out.println( " Print Loop case \"Translator_CV\"  subDirs [" + j + "]  " + subDirs[ j ] );
                            }
                            subDirectory = subDirs[ 6 ];  // Addendum
                            subNameDirectory = subDirs[ 7 ];  // Translator Name2
                            moveFileName = subDirs[ 8 ];  // addendum to the rights agreement 2.docx 

                            destinationDirectory = rootPath + File.separator + yearInString + File.separator + company + File.separator
                                    + ApplicationNumber + File.separator + subDirectory + File.separator + subNameDirectory + File.separator;

                            moveFile = destinationDirectory + moveFileName;
                            translatorFileDetails.add( moveFile );
                            translatorFileDetails.add( moveFileName );

                            System.out.println( "filesToBeMoved--" + decider + "--->>>> " + moveFile );
                            System.out.println( "filesToBeMoved--destinationDirectory  " + decider + "--->>>> " + destinationDirectory );
                            longArrayList.add( moveFile );
                            break;

                        case "Original":
                        case "TranslationSample":
                            for ( int j = 0; j < subDirs.length; j++ ) {
                                System.out.println( " Print Loop case Original and TranslationSample subDirs [" + j + "]  " + subDirs[ j ] );
                            }
                            String Directory = subDirs[ 6 ];      // TranslationSample
                            moveFileName = subDirs[ 7 ];      // translation sample.docx
                            destinationDirectory = rootPath + File.separator + yearInString + File.separator + company + File.separator
                                    + ApplicationNumber + File.separator + Directory + File.separator;
                            System.out.println( "filesToBeMoved--Directory--->>>> " + Directory );
                            System.out.println( "filesToBeMoved--moveFileName--->>>> " + moveFileName );
                            moveFile = destinationDirectory + moveFileName;
                            shortArrayList.add( moveFile );
                            System.out.println( "filesToBeMoved--" + decider + "--->>>> " + moveFile );
                            break;

                    } // switch (decider)

                    File directory = new File( destinationDirectory );
                    System.out.println( "destinationDirectory --" + destinationDirectory );
//                    test this
                    /*
                     * create directory if it does not exist
                     */
                    if ( !directory.exists() ) {
                        System.out.println( "create destinationDirectory --" + destinationDirectory );
                        directory.mkdirs();
                    }

                    File sFile = new File( filesToBeMoved.get( i ) );
                    File destDir = new File( destinationDirectory );

                    // moveFile = destinationDirectory + moveFileName;
                    File destFile = new File( moveFile );

                    /*
                     * --------------------------------------------------------------------------------
                     * move file
                     * overwrite if file exists
                     */
//                    if ( destFile.exists() ) {
//                        FileUtils.deleteQuietly( destFile );
//                    }
//                    FileUtils.moveFile( sFile, destFile );

                    /*
                 * --------------------------------------------------------------------------------
                     */
                    FileUtils.moveFileToDirectory( sFile, destDir, true );
                }

                System.out.println( "####################### End creating the lists ##################################################" );
                ////////////////////////////////////////////////////////////
                //  Process Application Translators
                ////////////////////////////////////////////////////////////
                System.out.println( "translatorArray.length: -------------------------->>>> " + translatorArrayContent.length );
                // if we have an array
                if ( translatorArrayContent.length > 0 ) {

                    /*
                     * convert translatorArray to ArrayList Translator
                     */
                    System.out.println( "####################### sending files to tables ##################################################" );

//                    re-compile and re-deploy test why stuff not processed

                    /*
                     * loop through the Translators and insert each into
                     * TranslatorTrack
                     */
                    System.out.println( "longArrayList.size() " + longArrayList.size() );
                    for ( int i = 0; i < longArrayList.size(); i++ ) {

                        System.out.println( "longArrayList---i:[" + i + "]-->>>> " + longArrayList.get( i ) );

                        String[] elements = longArrayList.get( i ).split( "(?<!^)/" );
                        for ( int j = 0; j < elements.length; j++ ) {
                            System.out.println( "longArrayList sending files to tables subDirs [" + j + "]  " + elements[ j ] );
                        }
                        String moveFile = longArrayList.get( i );
                        String decider = elements[ 7 ];
                        translatorName = elements[ 8 ];
                        String moveFileName = elements[ 9 ];
                        String moveFileNameReplaced = moveFile.replace( "/home/markus/public_html", "/~markus" );
//                        String moveFileNameReplaced = moveFile.replace( "/home/glassfish/glassfish/domains/domain1/docroot/documents", "/documents" );
                        /*
                         * moveFile = the whole path including the file name
                         * = longArrayList.get(i)
                         * moveFileName = fille name = fileName
                         * moveTheFileName = moveFile but with
                         * replace("/home/markus/public_html", "/~markus") =
                         * String moveTheFileName =
                         * moveFile.replace("/home/markus/public_html",
                         * "/~markus");
                         */
                        try {

                            /*
                             * set the variables and
                             * translatorName =
                             * processingTranslatorArray[0];
                             */
                            int idTranslator = GrantApplicationDAO.ifTranslatorExist( translatorName );
                            System.out.println( "ReferenceNumber  " + ReferenceNumber );
                            /*
                             * insert them into the table TranslatorTrack
                             */

                            System.out.println( "GrantApplicationServlet  decider  " + decider );

                            switch ( decider ) {
                                /*
                                 * Agreement with Translation Rights Holder
                                 */
                                case "Agreement":
                                    System.out.println( "insertAgreement:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                                    GrantApplicationDAO.insertAgreement( ReferenceNumber, rightsHolderArrayContent[ 0 ], Title, moveFileName, moveFileNameReplaced );
                                    break;
                                /*
                                 * Contract with Translator
                                 */
                                case "Contract":
                                    System.out.println( "insertContract:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                                    GrantApplicationDAO.insertContract( ReferenceNumber, translatorName, Title, moveFileName, moveFileNameReplaced );
                                    break;
                                /*
                                 * Addendum with Translation Rights Holder
                                 */
                                case "Addendum":
                                    System.out.println( "insertAddendum:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                                    GrantApplicationDAO.insertAddendum( ReferenceNumber, rightsHolderArrayContent[ 0 ], Title, moveFileName, moveFileNameReplaced );
                                    break;
                                /*
                                 * Translator CV
                                 */
                                case "Translator_CV":
                                    // String Translator_CV , String Translator_CV_DocName , fn copiesTranslationSample, fname copiesTranslationSampleDocName
                                    // fn copiesTranslationSample, fname copiesTranslationSampleDocName
                                    // fn and fname are empty at the moment!!!
                                    String fname = "";
                                    String fn = "";
                                    System.out.println( "insertTranslators:: translatorName " + translatorName + " Title  " + Title + " longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                                    GrantApplicationDAO.insertTranslators( ReferenceNumber, translatorName, Title, moveFileName, moveFileNameReplaced, fn, fname );
                                    break;

                            } // switch (decider)

                        } catch ( DBException ex ) {
                            Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                        }

                    }

                } else {  // no array - single Translator
                    System.out.println( "===================  no array - single Translator ======================== " );
//                    System.out.println("insertTranslators:: translatorName " + translatorName + " ReferenceNumber " + ReferenceNumber + "Title" + Title + 
//                            "moveFileName " + moveFileName + "moveFileNameReplaced " + moveFileNameReplaced);
                }  // end else

                // Process Original TranslationSample
                for ( int i = 0; i < shortArrayList.size(); i++ ) {
                    System.out.println( "shortArrayList---i:[" + i + "]-->>>> " + shortArrayList.get( i ) );

                    String[] elements = shortArrayList.get( i ).split( "(?<!^)/" );
                    for ( int j = 0; j < elements.length; j++ ) {
                        System.out.println( "shortArrayList subDirs [" + j + "]  " + elements[ j ] );
                    }
                    String AppNumber = Integer.toString( ApplicationNumber );   // '195/2018' ---> 195
                    System.out.println( "AppNumber  " + AppNumber );
//                    for (int l = 0; l < elements.length; l++) {
                    try {
//                            System.out.println("elements---i:[" + l + "]-->>>> " + elements[l]);

                        String moveFile = shortArrayList.get( i );
                        String decider = elements[ 7 ];      // Original
                        String moveFileName = elements[ 8 ]; // copy of original work.docx
//                        String moveFileNameReplaced = moveFile.replace("/home/glassfish/glassfish/domains/domain1", "/documents");
                        String moveFileNameReplaced = moveFile.replace( "/home/markus/public_html", "/~markus" );
                        System.out.println( "Process Original TranslationSample  decider  " + decider );
                        switch ( decider ) {

                            case "Original":
                                System.out.println( "insertOriginal:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                                GrantApplicationDAO.insertOriginal( AppNumber, moveFileName, moveFileNameReplaced );

                                break;
                            case "TranslationSample":
                                System.out.println( "insertTranslationSample:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                                GrantApplicationDAO.insertTranslationSample( AppNumber, moveFileName, moveFileNameReplaced );
                                break;

                        } // switch (decider)
                    } catch ( DBException ex ) {
                        Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }
                }
                System.out.println( "####################### End sending files to tables ##################################################" );
                ////////////////////////////////////////////////////////////
                //  Process Library
                ////////////////////////////////////////////////////////////

                System.out.println( "####################### Process library ##################################################" );

                Library library = new Library();

                library.setReferenceNumber( ReferenceNumber );

                // String fn = fileNames[0].replace("/home/markus/public_html", "/~markus");//replaces all occurrences of "/home/markus","/~markus"
                // cover will not set at this time
                // library.setCover(fn);
                // library.setCoverName(justFiles[0]);
                library.setTitle( Title );
                System.out.println( "Process library  Title  " + Title );

                library.setPublisher( company );
                library.setPublisheryear( publicationYear );
                library.setGenre( Genre );
                System.out.println( "Process library  Genre  " + Genre );
                library.setSeries( Series );
                System.out.println( "Process library  Series  " + Series );
//                library.setTranslationPublisher(translationPublisher);
                library.setTranslationPublisher( foreignPublisher );
                library.setTranslationTitle( translationTitle );
                library.setTranslationPublisherYear( translationPublisherYear );
                library.setPhysicalDescription( physicalDescription );
                library.setDuplicates( Duplicates );
                library.setCopies( Copies );
                library.setNotes( bookNotes );
                library.setISBN( ISBN );
                library.setISSN( ISSN );
                library.setLASTUPDATED( timestamp );

                System.out.println( "GrantApplicationServlet  Process library setReferenceNumber " + ReferenceNumber );
                System.out.println( "GrantApplicationServlet  Process library setTitle " + Title );
                System.out.println( "GrantApplicationServlet  Process library setPublisher " + company );
                System.out.println( "GrantApplicationServlet  Process library setPublisheryear " + publicationYear );
                System.out.println( "GrantApplicationServlet  Process library setGenre " + Genre );
                System.out.println( "GrantApplicationServlet  Process library setTranslationTitle " + translationTitle );
                System.out.println( "GrantApplicationServlet  Process library setTranslationPublisher " + translationPublisherYear );
                System.out.println( "GrantApplicationServlet  Process library setTranslationPublisherYear " + publicationYear );
                System.out.println( "GrantApplicationServlet  Process library setCover " + Cover );
//            System.out.println( "GrantApplicationServlet  Process library setCoverName " +  coverName);
                System.out.println( "GrantApplicationServlet  Process library setPhysicalDescription " + physicalDescription );
                System.out.println( "GrantApplicationServlet  Process library setDuplicates " + Duplicates );
                System.out.println( "GrantApplicationServlet  Process library setCopies " + Copies );
                System.out.println( "GrantApplicationServlet  Process library setNotes " + bookNotes );
                System.out.println( "GrantApplicationServlet  Process library setISBN " + ISBN );
                System.out.println( "GrantApplicationServlet  Process library setISSN " + ISSN );
                System.out.println( "GrantApplicationServlet  Process library setSeries " + Series );

                 {
                    try {
                        bookID = LibraryDAO.insertBook( library );
                    } catch ( DBException ex ) {
                        Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }
                }

                ////////////////////////////////////////////////////////////
                //  Process Application Languages
                ////////////////////////////////////////////////////////////
                System.out.println( "Process Languages" );
                System.out.println( "Languages languageArrayLength: " + languageArrayLength );
                if ( languageArrayLength != 0 ) {

                    String[] processingLanguagesArray = new String[ languageArray.length - 1 ];

                    /*
                     * convert processingArray to ArrayList Languages
                     */
                    Languages = new ArrayList<>( Arrays.asList( processingLanguagesArray ) );
                    System.out.println( "Languages Languages.length: " + Languages.size() );
                    int idx = 0;

                    /*
                     * loop through the Languages and insert each into
                     * Languages_Library
                     */
                    for ( String individualValue : languageArray ) {
                        System.out.println( "Languages individualValue: " + individualValue );
                        languages = individualValue;
                        System.out.println( "Languages Languages.length: " + Languages.size() );
                        if ( idx < Languages.size() ) {
                            processingLanguagesArray[ idx ] = languages;
                            System.out.println( "Languages languages  " + languages + " idx " + idx );
                            /*
                             * when we have a complete set (idLanguages, lang,
                             * bookID, ReferenceNumber)
                             */
                            String language = processingLanguagesArray[ idx ];
                            int idLanguages = 0;
                            try {
                                idLanguages = ifLanguageExist( processingLanguagesArray[ idx ] );
                            } catch ( DBException ex ) {
                                Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                            }

                            try {

                                /*
                                 * set the variables and
                                 * insert them into the tables Languages_Library
                                 */
                                GrantApplicationDAO.insertLanguages_Library( idLanguages, language, bookID, ReferenceNumber );
                                System.out.println( "1 GrantApplicationDAO.insertLanguages_Library(idLanguages  " + idLanguages
                                        + " language " + language + " bookID " + bookID + "  ReferenceNumber " + ReferenceNumber );

                            } catch ( DBException ex ) {
                                Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                            }

                            idx++;
                        } else {
                            int idLanguages = 0;
                            try {
                                idLanguages = ifLanguageExist( languages );
                            } catch ( DBException ex ) {
                                Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                            }

                            try {

                                /*
                                 * set the variables and
                                 * insert them into the tables Languages_Library
                                 */
                                GrantApplicationDAO.insertLanguages_Library( idLanguages, languages, bookID, ReferenceNumber );
                                System.out.println( "2 GrantApplicationDAO.insertLanguages_Library(idLanguages  " + idLanguages
                                        + " language " + languages + " bookID " + bookID + "  ReferenceNumber " + ReferenceNumber );

                            } catch ( DBException ex ) {
                                Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                            }
                        }
                    }
                } else {
                    System.out.println( "Languages languageArrayLength  === 0  " + languageArrayLength );

                    try {

                        int idLanguages = ifLanguageExist( languages );
                        GrantApplicationDAO.insertLanguages_Library( idLanguages, appTargetLanguage, bookID, ReferenceNumber );
                        System.out.println( "3 GrantApplicationDAO.insertLanguages_Library(idLanguages  " + idLanguages
                                + " appTargetLanguage " + appTargetLanguage + " bookID " + bookID + "  ReferenceNumber " + ReferenceNumber );

                    } catch ( DBException ex ) {
                        Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }
                }

                /*
                 * reset session
                 */
                session.removeAttribute( "task" );
                session.setAttribute( "name", name );
                session.setAttribute( "publisherID", publisherID );
                request.setAttribute( "publisherID", publisherID );
                request.setAttribute( "firstname", firstname );
                request.setAttribute( "lastname", lastname );
                request.setAttribute( "name", name );
                request.setAttribute( "userID", userID );
                System.out.println( " request.setAttribute(name)" + name );
                request.setAttribute( "name", name );
                request.setAttribute( "message", message );
                request.getRequestDispatcher( "/WEB-INF/views/uploadResponse.jsp" ).forward( request, response );
                break;
        }
    }

    public void doGet( HttpServletRequest request,
            HttpServletResponse response )
            throws ServletException, java.io.IOException {

        throw new ServletException( "GET method used with "
                + getClass().getName() + ": POST method required." );
    }

    public Date convertDate( String datum ) throws ParseException {

        DateFormat sourceFormat = new SimpleDateFormat( "dd/MM/yyyy" );
        Date date = sourceFormat.parse( datum );

        return date;

    }

    public java.sql.Date getTodaySQL() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date( today.getTime() );

    }

    public int getCounter( String counterIndicator ) {

        int counter = 0;

        System.out.println( "getCounter(String " + counterIndicator );

        if ( counterIndicator.contains( "-" ) ) {

            String counterIndicatorArray[] = counterIndicator.split( "-" );
            for ( int u = 0; u < counterIndicatorArray.length; u++ ) {
                System.out.println( "counterIndicatorArray[" + u + "]" + Arrays.toString( counterIndicatorArray ) );
            }

            counter = Integer.parseInt( counterIndicatorArray[ counterIndicatorArray.length - 1 ] ) - 1;
        }

        System.out.println( "counter  " + counter );

        return counter;
    }

    public String getFdname( String fieldname ) {

        String fdname;

        String fdnameArray[] = fieldname.split( "-" );

        fdname = fdnameArray[ 0 ];

        System.out.println( "getFdname(String " + fieldname );
        for ( int v = 0; v < fdnameArray.length; v++ ) {
            System.out.println( "fdnameArray[" + v + "]" + fdnameArray[ v ] );
        }

        System.out.println( "fdname  " + fdname );

        return fdname;
    }
}
