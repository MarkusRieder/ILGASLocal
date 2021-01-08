/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import static ie.irishliterature.dao.ACpublisherDAO_test.updatePublisher;
import ie.irishliterature.dao.StaffDAO;
import static ie.irishliterature.dao.StaffDAO.getcurrentTimeStamp;
import static ie.irishliterature.dao.StaffDAO.ifLanguageExist;
import ie.irishliterature.dao.LibraryDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.GrantApplication;
import ie.irishliterature.model.Library;
import ie.irishliterature.model.Publisher;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

/**
 *
 * @author markus
 */
@WebServlet(name = "StaffServlet", urlPatterns = { "/StaffServlet" })
public class StaffServlet extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger( StaffServlet.class.getCanonicalName() );
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
    private String referenceNumber;
    private String appApplicationYear;
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
    private String approveWithdrawnReject;
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

    private String ReferenceNumber;

    private ArrayList<String> Author;

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

    private String bankDetailsForm;  //file path

    private String signedLIContractName;  //file path

    private String proofOfPaymentToTranslator;  //file path

    private String translationTitle;

    private String translationPublisher;

    private String translationPublisherYear;

    private String[] translatorArrayContent;

    private String[] rightsHolderArrayContent;

    private String[] languageArrayContent;

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

    private String notesAboutApplication;

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
    private String contractSentToPublisher; //  Date
    private String acknowledgementApproved; //  Date
    private String datePublishedBooksReceived; //  Date
    private String datePaymentMadeToPublisher; //  Date
    private String paymentreferenceNumber;
    private String paymentStatus;
    private String boardComments_Instructions;
    private String boardMeeting;
    private String publisherInformedOfMeeting; //  Date 
    private String Award;
    private String Bilingual;
    private String DirectorChairDecision;
    private int directorChairDecision;
    private int award = 0; //    boolean
    private int bilingual = 0; //    boolean
    private String Amount_Requested;
    private String amountApproved;
    private String Comments_about_Meeting;
    private String Proposed_Publication_Date; //  Date
    private String Previous_Grant_Aid; // Array of Author/Title
    private String Press_cuttings;  //  boolean
    private String Sales_figures;
    private String Anthology; //Array of Author/Title
    private String message = "";
    private int SendPaidEmailtoPublisher = 0;
    private int SendApproveRejectEmailtoPublisher = 0;

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
//    http://localhost/public_html/test/2020/Sekwa%20f%C3%B6rlag/114/Translator_CV/Marianne%20Tufvesson/translator%20cv%201.docx

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int translatorArrayLength = 0;
        int rightsHolderArrayLength = 0;
        int languageArrayLength = 0;
        int idxFlag = 0;
        String name = "";
//         userID = Integer.parseInt( request.getParameter( "userID" ));
        String username = "";

//        doesn't get name & username'
        System.out.println( "/StaffServlet  --->   :doPost: getParameter userID:1:  " + userID );
        System.out.println( "/StaffServlet  --->  name getParameter  " + request.getParameter( "name" ) );

        //set Timestamp and format
        String timeStamp = new SimpleDateFormat( "yyyy.MM.dd.HH.mm.ss" ).format( new Date() );
        Calendar now = Calendar.getInstance();
        //set Year used in filePath
        int year = now.get( Calendar.YEAR );
        String yearInString = String.valueOf( year );

        int idxFolderNames = 0;
        java.sql.Timestamp timestamp = getcurrentTimeStamp();

        String[] fileNames = new String[ 6 ];
        //   String[] justFiles = new String[6];
        List<String> filesToBeMoved = new ArrayList<>();
//                List<String> fileDir = new ArrayList<>();
        List<String> longArrayList = new ArrayList<>();
        List<String> shortArrayList = new ArrayList<>();
        message = "";

        try {
            //     try {

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

                    String fieldvalue = item.getString( "UTF-8" ).trim();

                    System.out.println( "fieldname: " + fieldname + " >> fieldvalue: " + fieldvalue );

                    switch ( fieldname ) {


                        /*  Fields of GrantApplication table
                            ApplicationNumber, ApplicationYear, referenceNumber, company, publisherID, userID, agreement, agreementDocName, contract, 
                            contractDocName, 
                            proposedDateOfPublication, proposedPrintRun, plannedPageExtent, translatorCV, translatorCVDocName, numberOfPages, 
                            translatorFee, breakDownTranslatorFee, Notes, copiesSent, dateCopiesWereSent, Original, OriginalName, copiesTranslationSample,
                            copiesTranslationSampleDocName, gdpr_ACCEPTED, TC_ACCEPTED, APPROVED, Status, Cover, CoverName, originalDateOfPublication, 
                            publicationYear, originalLanguage, originalPageExtent, countryOfPublication, foreignPublisher, foreignCountry, targetLanguage, 
                            boardMeeting, amountRequested, amountApproved, publisherInformedOfMeeting, boardComments_Instructions, contractSentToPublisher, 
                            acknowledgementApproved, datePublishedBooksReceived, datePaymentMadeToPublisher, paymentreferenceNumber, addendumRightsAgreement, 
                            addendumRightsAgreementName, proofOfPaymentToTranslator, proofOfPaymentToTranslatorName, bankDetailsForm, bankDetailsFormName, 
                            signedLIContract, signedLIContractName, paymentStatus, previousGrantAid, award, salesFigures, lastUpdated, Recommendation, 
                            Created, bilingual, notesAboutApplication, approveWithdrawnReject, directorChairDecision                            
                         */
 /*  Fields of library table
                            bookID, referenceNumber, Author, Title, Publisher, publishingYear, Genre, translationTitle, translationPublisher, 
                            translationPublisherYear, Translator, Language, Cover, CoverName, physicalDescription, Duplicates, Copies, Notes, ISBN, ISSN, 
                            lastUpdated, Series                            
                         */
                        case "appReferenceNumber":
                            referenceNumber = fieldvalue;
                            ReferenceNumber = fieldvalue;
                            System.out.println( "appreferenceNumber >>>> referenceNumber " + referenceNumber + " ReferenceNumber >>>> " + ReferenceNumber );
                            break;
                        case "appStatus":
                            Status = fieldvalue;
                            break;
                        case "appBookTitle":
                            Title = fieldvalue;
                            break;
                        case "username":
                            username = fieldvalue;
                            System.out.println( "/StaffServlet  --->  username " + username );
                            break;
                        case "name":
                            name = fieldvalue;
                            System.out.println( "/StaffServlet  --->  name " + name );
                            break;
                        case "userID":
                            userID = Integer.parseInt( fieldvalue );
                            break;

                        /* needed for loops */
                        case "authorList":
                            authorArray = fieldvalue.split( "," ); //split string by ,
//                            Author = authorArray;
                            Author = new ArrayList<>( Arrays.asList( authorArray ) );
                            System.out.println( "Author  StaffServlet:: " + Author );
                            System.out.println( "authorArraylength  StaffServlet:: " + authorArray.length );
                            for ( String individualValue : authorArray ) {
                                System.out.println( "authorArray  StaffServlet:: " + individualValue );
                            }
                            break;
                        case "translatorArray":
                            System.out.println( "translatorArray >>>> HERE " );
                            ArrayList<String> ta = new ArrayList<>( Arrays.asList( fieldvalue ) );
                            System.out.println( "translatorArray >>>> ta.size() " + ta.size() );
                            String str = fieldvalue.replaceAll( "[\\[\\]\\(\\)]", "" );
                            translatorArrayContent = str.split( "," ); //split string by ","~~~~
                            translatorArrayLength = translatorArrayContent.length;
                            System.out.println( "translatorArray >>>> translatorArray.length " + translatorArrayContent.length );
                            for ( String individualValue : translatorArrayContent ) {
                                System.out.println( "translatorArray  StaffServlet:: " + individualValue + " ----------> translatorArrayLength::  " + translatorArrayLength );
                            }
                            break;
                        case "rightsHolderArray":
                            System.out.println( "rightsHolderArray >>>> HERE " );
                            rightsHolderArrayContent = fieldvalue.split( "," ); //split string by ","
                            rightsHolderArrayLength = rightsHolderArrayContent.length;
                            System.out.println( "rightsHolderArray >>>> rightsHolderArray.length " + rightsHolderArrayContent.length );
                            for ( String individualValue : rightsHolderArrayContent ) {
                                System.out.println( "rightsHolderArray  StaffServlet:: " + individualValue + " ----------> rightsHolderArrayLength::  " + rightsHolderArrayLength );
                            }
                            break;
                        /* end needed for loops */

                        case "appCompany":
                            company = fieldvalue;
                            break;
                        case "appDateOfPublicationOriginal":
                            originalDateOfPublication = fieldvalue;
                            break;
                        case "appPageExtentOriginal":
                            originalPageExtent = fieldvalue;
                            break;
                        case "translationTitle":
                            translationTitle = fieldvalue;
                            break;
                        case "appCountryOfPublication":
                            countryOfPublication = fieldvalue;
                            break;
                        case "appLanguageOriginal":
                            originalLanguage = fieldvalue;
                            break;
                        case "appGenre":
                            Genre = fieldvalue;
                            break;
                        case "appNotesAboutApplication":
                            notesAboutApplication = fieldvalue;
                            System.out.println( "notesAboutApplication " + notesAboutApplication );
                            break;
                        case "appForeignPublisher":
                            foreignPublisher = fieldvalue;
                            break;
                        case "appForeignCountry":
                            foreignCountry = fieldvalue;
                            break;
                        case "appTargetLanguage":
                            targetLanguage = fieldvalue;
                            languageArray = fieldvalue.split( "," );
                            System.out.println( "languageArray >>>> HERE " );
                            languageArrayContent = languageArray; //.split( "," ); //split string by ","~~~~
                            languageArrayLength = languageArrayContent.length;
                            System.out.println( "languageArray >>>> languageArray.length " + languageArrayContent.length );
                            for ( String individualValue : languageArrayContent ) {
                                System.out.println( "languageArray  StaffServlet:: " + individualValue + " ----------> languageArrayLength::  " + languageArrayLength );
                            }
                            break;
                        case "breakDownTranslatorFee":
                            breakDownTranslatorFee = fieldvalue;
                            break;

                        case "apptranslatorFee":
                            translatorFee = fieldvalue;
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
                        case "appDateOfBoardMeeting":
                            boardMeeting = fieldvalue;
                            break;
                        case "directorChairDecision":
                            DirectorChairDecision = fieldvalue;
                             System.out.println( "DirectorChairDecision >>>> HERE DirectorChairDecision " + DirectorChairDecision);
                            if ( "ticked".equals( DirectorChairDecision ) ) {
                                directorChairDecision = 1;
                            } else {
                                directorChairDecision = 0;
                            }
//                            directorChairDecision = Integer.parseInt( fieldvalue );
                            break;
                        case "award":
                            Award = fieldvalue;
                             System.out.println( "Award >>>> HERE Award " + Award);
                            if ( "ticked".equals( Award ) ) {
                                award = 1;
                            } else {
                                award = 0;
                            }
                             System.out.println( "Award >>>> HERE Award " + Award + " award " + award);
//                            directorChairDecision = Integer.parseInt( fieldvalue );
                            break;
                        case "amountRequested":
                            amountRequested = fieldvalue;
                            break;
                        case "appproposedDateOfPublication":
                            proposedDateOfPublication = fieldvalue;
                            break;
                        case "appplannedPageExtent":
                            plannedPageExtent = fieldvalue;
                            break;
                        case "appproposedPrintRun":
                            proposedPrintRun = Integer.parseInt( fieldvalue );
                            break;
                        case "amountApproved":
                            amountApproved = fieldvalue;
                            break;
                        case "datePublisherInformedOfMeeting":
                            System.out.println( "datePublisherInformedOfMeeting >>>>  " + fieldvalue );
                            publisherInformedOfMeeting = fieldvalue;
                            break;
                        case "commentsAboutMeeting":
                            boardComments_Instructions = fieldvalue;
                            break;
                        case "Approved":
                            APPROVED = Integer.parseInt( fieldvalue );
                            System.out.println( "APPROVED >>>>  " + APPROVED );
                            break;
                        case "ApproveWithdrawnReject":
                            approveWithdrawnReject = fieldvalue;
                            System.out.println( "approveWithdrawnReject >>>>  " + approveWithdrawnReject );
                            break;
                        case "dateContractSenttoPublisher":
                            contractSentToPublisher = fieldvalue;
                            break;
                        case "dateILEAcknowledgementApproved":
                            acknowledgementApproved = fieldvalue;
                            break;
                        case "datePublishedBooksReceived":
                            datePublishedBooksReceived = fieldvalue;
                            break;
                        case "datePaymentMadeToPublisher":
                            datePaymentMadeToPublisher = fieldvalue;
                            break;
                        case "paymentReferenceNumber":
                            paymentreferenceNumber = fieldvalue;
                            break;
                        case "proofPayment":
                            proofOfPaymentToTranslator = fieldvalue;
                            break;
                        case "bankDetails":
                            bankDetailsForm = fieldvalue;
                            break;
                        case "signedLIcontract":
                            signedLIContractName = fieldvalue;
                            break;
                        case "paymentStatus":
                            paymentStatus = fieldvalue;
                            break;
                        case "SendPaidEmailtoPublisher":
                            String sendPaidEmailtoPublisher = fieldvalue;
                            System.out.println( "String sendPaidEmailtoPublisher >>>>  " + fieldvalue );
                            if ( "ticked".equals( sendPaidEmailtoPublisher ) ) {
                                SendPaidEmailtoPublisher = 1;
                            } else {
                                SendPaidEmailtoPublisher = 0;
                            }
                            System.out.println( "SendPaidEmailtoPublisher >>>>  " + SendPaidEmailtoPublisher );
                            break;

                        case "SendApproveRejectEmailtoPublisher":
                            String sendApproveRejectEmailtoPublisher = fieldvalue;
                            System.out.println( "String sendApproveRejectEmailtoPublisher >>>>  " + fieldvalue );
                            if ( ( "ticked".equals( sendApproveRejectEmailtoPublisher ) ) ) {
                                SendApproveRejectEmailtoPublisher = 1;
                            } else {
                                SendApproveRejectEmailtoPublisher = 0;
                            }
                            System.out.println( "SendApproveRejectEmailtoPublisher >>>>  " + SendApproveRejectEmailtoPublisher );
                            break;

                        /* used for update international_publishers table */
                        case "Company":
                            company = fieldvalue;
                            break;
                        case "Address1":
                            Address1 = fieldvalue;
                            break;
                        case "postCode":
                            postCode = fieldvalue;
                            break;
                        case "City":
                            City = fieldvalue;
                            break;
                        case "Address2":
                            Address2 = fieldvalue;
                            break;
                        case "Country":
                            country = fieldvalue;
                            break;
                        case "Country_Code":
                            countryCode = fieldvalue;
                            break;
                        case "Address3":
                            Address3 = fieldvalue;
                            break;
                        case "Address4":
                            Address4 = fieldvalue;
                            break;
                        case "Telephone":
                            Telephone = fieldvalue;
                            break;
                        case "Fax":
                            Fax = fieldvalue;
                            break;
                        case "Email":
                            Email = fieldvalue;
                            break;
                        case "WWW":
                            WWW = fieldvalue;
                            break;
                        case "doNotMail":
                            DoNotMail = fieldvalue;
                            break;
                        case "companyNotes":
                            companyNotes = fieldvalue;
                            break;
                    } // end switch
                } else {

                    //////////////////////////////////////////////////////////////
                    //  Process Application Form file field (input type="file") //
                    //////////////////////////////////////////////////////////////
                    String fieldname = item.getFieldName();
                    String filename = FilenameUtils.getName( item.getName() );

//                            Change TranslatorTrack table to accomodate fieldnme etc
//                                    Store files there
                    int counter = getCounter( fieldname );
                    String fileName = getFdname( fieldname );
                    System.out.println( "FilenameUtils.getName filename  " + filename + " getFdname( fieldname ) " + fileName );
                    String fdnameArray[] = fieldname.split( "-" );

                    String fdname = fdnameArray[ 0 ];

                    System.out.println( "FilenameUtils.getName counter    " + counter );

                    System.out.println( "FilenameUtils.getName fieldname  " + fieldname );

                    System.out.println( "FilenameUtils.getName fdname  " + fdname );

                    System.out.println( "getCounter( fieldname ) counter :" + counter + ": fieldname :" + fieldname + ": filename :" + filename );

                    System.out.println( "translatorArrayContent.length " + translatorArrayContent.length );
                    System.out.println( "translatorArrayContent counter  " + translatorArrayContent[ counter ] );
                    System.out.println( "yearInString  " + yearInString );
                    System.out.println( "rightsHolderArrayContent.length " + rightsHolderArrayContent.length );
                    System.out.println( "rightsHolderArrayContent counter  " + rightsHolderArrayContent[ counter ] );

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

                        case "BankDetails":
                            if ( filename.isEmpty() ) {
                                System.out.println( "BankDetails filename.isEmpty()  filename " + filename );
                            } else {
                                filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                        + "BankDetails" + File.separator;
                                fileNames[ idxFolderNames ] = filePath + filename;
                                filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                System.out.println( "BankDetails  rightsHolderArrayContent[" + counter + "] =  " + rightsHolderArrayContent[ counter ] );
                                System.out.println( "BankDetails  filename " + fileNames[ idxFolderNames ] );
                            }
                            break;
                        case "SignedLIContract":
                            if ( filename.isEmpty() ) {
                                System.out.println( "SignedLIContract filename.isEmpty()  filename " + filename );
                            } else {
                                filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                        + "SignedLIContract" + File.separator;
                                fileNames[ idxFolderNames ] = filePath + filename;
                                filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                System.out.println( "SignedLIContract  rightsHolderArrayContent[" + counter + "] =  " + rightsHolderArrayContent[ counter ] );
                                System.out.println( "SignedLIContract  filename " + fileNames[ idxFolderNames ] );
                            }
                            break;
                        case "ProofPayment":
                            if ( filename.isEmpty() ) {
                                System.out.println( "ProofPayment filename.isEmpty()  filename " + filename );
                            } else {
                                filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                        + "ProofPayment" + File.separator;
                                fileNames[ idxFolderNames ] = filePath + filename;
                                filesToBeMoved.add( fileNames[ idxFolderNames ] );
                                System.out.println( "ProofPayment  rightsHolderArrayContent[" + counter + "] =  " + rightsHolderArrayContent[ counter ] );
                                System.out.println( "ProofPayment  filename " + fileNames[ idxFolderNames ] );
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
                                System.out.println( "Translator_CV  fileNames[ idxFolderNames " + fileNames[ idxFolderNames ] );
                            }
                            break;

                    } // end switch

                    /*
                     * create temporary Directory if it does not exist
                     */
                    System.out.println( "fileName.equals 1  " + fileName + " filePath " + filePath );
                    if ( filename.isEmpty() ) {
                        System.out.println( "fileName.equals 2 filename.isEmpty() filename.isEmpty " + fileName + " filePath " + filePath );
                    } else {
                        File file = new File( filePath );
                        if ( !file.exists() ) {

                            file.mkdirs();
                        }
                        System.out.println( "createTemporaryDirectory" );
                        System.out.println( "filePath: " + filePath + " filename: " + filename );
                        OutputStream outS = null;
                        InputStream filecontent = null;

                        try {
                            outS = new FileOutputStream( new File( filePath + filename ) );

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

            }  // for (FileItem item : items)

            ////////////////////////////////////////////////////////////
            //  Process Application
            ////////////////////////////////////////////////////////////
            /*
                 * referenceNumber = ApplicationNumber + "/" +
                 * yearInString;
             */
//                referenceNumber = StaffDAO.updateApplication(application, intreferenceNumber );
            System.out.println( "referenceNumber ---->> " + referenceNumber );
//                StaffDAO.updateApplication( application, referenceNumber );

            /*
                 * referenceNumber contains ApplicationNumber seperated
                 * by a "/"
                 * find the first occurrence of "/"
             */
            int iend = referenceNumber.indexOf( "/" );

            /*
             * get ApplicationNumber from referenceNumber
             */
            if ( iend != -1 ) {
                ApplicationNumber = Integer.parseInt( referenceNumber.substring( 0, iend ) );
                System.out.println( "ApplicationNumber ---->> " + ApplicationNumber );
            }

            GrantApplication application = new GrantApplication();

            System.out.println( "###############################################################" );

            System.out.println( "appreferenceNumber " + referenceNumber );
            System.out.println( "appStatus " + Status );
            System.out.println( "appBookTitle " + Title );
            System.out.println( "authorList " + Author );
            System.out.println( "appCompany " + company );
            System.out.println( "Translator_CV-1 " + translatorCV );
            System.out.println( "Contract-1 " + contract );
            System.out.println( "originalWork " + Original );
            System.out.println( "translationSample " + copiesTranslationSample );
            System.out.println( "Agreement " + agreement );
            System.out.println( "addendumAgreement " + Addendum );
            System.out.println( "appDateOfPublicationOriginal " + originalDateOfPublication );
            System.out.println( "appPageExtentOriginal " + originalPageExtent );
            System.out.println( "translationTitle " + translationTitle );
            System.out.println( "appCountryOfPublication " + countryOfPublication );
            System.out.println( "appLanguageOriginal " + originalLanguage );
            System.out.println( "appGenre " + Genre );
            System.out.println( "appNotesAboutApplication " + notesAboutApplication );
            System.out.println( "appForeignPublisher " + foreignPublisher );
            System.out.println( "appForeignCountry " + foreignCountry );
            System.out.println( "appTargetLanguage " + appTargetLanguage );
            System.out.println( "apptranslatorFee " + translatorFee );
            System.out.println( "appDateOfBoardMeeting " + boardMeeting );
            System.out.println( "directorChairDecision " + directorChairDecision );
            System.out.println( "amountRequested " + amountRequested );
            System.out.println( "appproposedDateOfPublication " + proposedDateOfPublication );
            System.out.println( "appplannedPageExtent " + plannedPageExtent );
            System.out.println( "appproposedPrintRun " + proposedPrintRun );
            System.out.println( "amountApproved " + amountApproved );
            System.out.println( "datePublisherInformedOfMeeting " + publisherInformedOfMeeting );
            System.out.println( "commentsAboutMeeting " + boardComments_Instructions );
            System.out.println( "Approved " + APPROVED );
            System.out.println( "Withdrawn " + approveWithdrawnReject );
            System.out.println( "award 123 " + Award );
            System.out.println( "dateContractSenttoPublisher " + contractSentToPublisher );
            System.out.println( "dateILEAcknowledgementApproved " + acknowledgementApproved );
            System.out.println( "datePublishedBooksReceived " + datePublishedBooksReceived );
            System.out.println( "datePaymentMadeToPublisher " + datePaymentMadeToPublisher );
            System.out.println( "paymentreferenceNumber " + paymentreferenceNumber );
            System.out.println( "proofPayment " + ProofPayment );
            System.out.println( "bankDetails " + bankDetailsForm );
            System.out.println( "signedLIcontract " + signedLIContractName );
            System.out.println( "paymentStatus " + paymentStatus );
            System.out.println( "Company " + company );
            System.out.println( "Address1 " + Address1 );
            System.out.println( "postCode " + postCode );
            System.out.println( "City " + City );
            System.out.println( "Address2 " + Address2 );
            System.out.println( "Country " + country );
            System.out.println( "Address3 " + Address3 );
            System.out.println( "Address4 " + Address4 );
            System.out.println( "Telephone " + Telephone );
            System.out.println( "Fax " + Fax );
            System.out.println( "Email " + Email );
            System.out.println( "WWW " + WWW );
            System.out.println( "doNotMail " + DoNotMail );
            System.out.println( "companyNotes " + companyNotes );
            System.out.println( "###############################################################" );

            application.setApplicationNumber( ApplicationNumber );
            application.setApplicationYear( appApplicationYear );
            application.setReferenceNumber( referenceNumber );
            application.setCompany( company );
            application.setPublisherID( publisherID );
            application.setUserID( userID );

            System.out.println( "proposedDateOfPublication " + proposedDateOfPublication );
            System.out.println( "convertDate( proposedDateOfPublication ) " + convertDate( proposedDateOfPublication ) );
            application.setProposedDateOfPublication( convertDate( proposedDateOfPublication ) );
            application.setProposedPrintRun( proposedPrintRun );
            application.setPlannedPageExtent( Integer.parseInt( plannedPageExtent ) );
            BigDecimal tf = new BigDecimal( translatorFee.replaceAll( ",", "" ) );
            application.setTranslatorFee( tf );
            application.setBreakDownTranslatorFee( breakDownTranslatorFee );
            application.setNotesAboutApplication( notesAboutApplication );
            System.out.println( "setNotesAboutApplication ---->> " + notesAboutApplication );

            /*
             * taken out for Covid-19
             *
             * application.setCopiesSent( copiesSent );
             * application.setDateCopiesWereSent( convertDate(
             * dateCopiesWereSent ) );
             */
            application.setAPPROVED( APPROVED );
            application.setStatus( Status );
            application.setPublicationYear( publicationYear );
            application.setOriginalLanguage( originalLanguage );
            application.setOriginalPageExtent( Integer.parseInt( originalPageExtent ) );
            application.setCountryOfPublication( countryOfPublication );
            application.setForeignPublisher( foreignPublisher );
            application.setForeignCountry( foreignCountry );
            application.setTargetLanguage( targetLanguage );
            System.out.println( "boardMeeting " + boardMeeting );

            if ( !"".equals( boardMeeting ) ) {
                application.setBoardMeeting( convertDate( boardMeeting ) );
            }
            BigDecimal ar = new BigDecimal( translatorFee.replaceAll( ",", "" ) );
            application.setAmountRequested( ar );
            BigDecimal aa = new BigDecimal( amountApproved.replaceAll( ",", "" ) );
            application.setAmountApproved( aa );
            System.out.println( "publisherInformedOfMeeting " + publisherInformedOfMeeting );
            if ( !"".equals( publisherInformedOfMeeting ) ) {
                application.setPublisherInformedOfMeeting( convertDate( publisherInformedOfMeeting ) );
            }
            application.setBoardComments_Instructions( boardComments_Instructions );
            if ( !"".equals( contractSentToPublisher ) ) {
                application.setContractSentToPublisher( convertDate( contractSentToPublisher ) );
            }
            if ( !"".equals( acknowledgementApproved ) ) {
                application.setAcknowledgementApproved( convertDate( acknowledgementApproved ) );
            }
            if ( !"".equals( datePublishedBooksReceived ) ) {
                application.setDatePublishedBooksReceived( convertDate( datePublishedBooksReceived ) );
            }
            if ( !"".equals( datePaymentMadeToPublisher ) ) {
                application.setDatePaymentMadeToPublisher( convertDate( datePaymentMadeToPublisher ) );
            }

            application.setPaymentReferenceNumber( paymentreferenceNumber );
            application.setPaymentStatus( paymentStatus );
            application.setAward( award );
            application.setLASTUPDATED( timestamp );
            application.setBilingual_edition( bilingual );
            application.setApproveWithdrawnReject( approveWithdrawnReject );
            application.setDirectorChairDecision( directorChairDecision );

            application.setApplicationYear( yearInString );
            application.setSendPaidEmailtoPublisher( SendPaidEmailtoPublisher );
            application.setSendApproveRejectEmailtoPublisher( SendApproveRejectEmailtoPublisher );

            System.out.println( "setSendPaidEmailtoPublisher ---->> " + SendPaidEmailtoPublisher );
            System.out.println( "setSendApproveRejectEmailtoPublisher ---->> " + SendApproveRejectEmailtoPublisher );

//            application.setCompany( company );
//            application.setPublisherID( publisherID );
//            application.setUserID( userID );
//            /*
//             * Book Details
//             */
//            application.setOriginalLanguage( originalLanguage );
//            application.setCountryOfPublication( countryOfPublication );
//            application.setOriginalPageExtent( Integer.parseInt( originalPageExtent ) );
////                    application.setOriginalDateOfPublication(convertDate(originalDateOfPublication));
//            application.setPublicationYear( publicationYear );
//            application.setForeignCountry( foreignCountry );
//            application.setForeignPublisher( foreignPublisher );
//
//            /*
//             * Rights Agreement & Contracts
//             */
// /*
//             * Publication Details
//             */
//            application.setProposedDateOfPublication( convertDate( proposedDateOfPublication ) );
//            application.setProposedPrintRun( proposedPrintRun );
//            application.setPlannedPageExtent( Integer.parseInt( plannedPageExtent ) );
//            application.setTargetLanguage( targetLanguage ); // we get that from the Languages_Library table
//            application.setBilingual_edition( bilingual );
//            /*
//             * Translator Details
//             */
//
//            application.setBreakDownTranslatorFee( breakDownTranslatorFee );
//            BigDecimal tf = new BigDecimal( translatorFee.replaceAll( ",", "" ) );
//            application.setTranslatorFee( tf );
//
//            /*
//             * Original Work & Sample Translation
//             */
// /*
//             * taken out for Covid-19
//             *
//             * application.setCopiesSent( copiesSent );
//             * application.setDateCopiesWereSent( convertDate(
//             * dateCopiesWereSent ) );
//             */
//            application.setTranslatorNotes( translatorNotes );
//            application.setNotesAboutApplication( notesAboutApplication );
//            application.setTC_ACCEPTED( TC_ACCEPTED );
//            application.setGdprACCEPTED( gdpr_ACCEPTED );
//            application.setAPPROVED( APPROVED );
//            application.setStatus( Status );
//            BigDecimal ar = new BigDecimal( translatorFee.replaceAll( ",", "" ) );
//            application.setAmountRequested( ar );
            try {

                /*
                 * referenceNumber = ApplicationNumber + "/" +
                 * yearInString;
                 */
                Date today = Calendar.getInstance().getTime();
                System.out.println( "referenceNumber ---->> " + referenceNumber );
                StaffDAO.updateApplication( application, referenceNumber, Author, Title, company, aa, today, Email );
                System.out.println( "appBookTitle " + Title );
                System.out.println( "authorList " + Author.toString() );
                System.out.println( "appCompany " + company );
                /*
                 * referenceNumber contains ApplicationNumber seperated
                 * by a "/"
                 * find the first occurrence of "/"
                 */
//                int iend = referenceNumber.indexOf( "/" );

                /*
                 * get ApplicationNumber from referenceNumber
                 */
                if ( iend != -1 ) {
                    ApplicationNumber = Integer.parseInt( referenceNumber.substring( 0, iend ) );
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

                        /* check that AuthorName is not null */
                        if ( !"null null".equals( AuthorName ) ) {
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
                                StaffDAO.replaceAuthors( referenceNumber, Name, FirstName, LastName );

                                /*
                             * reset index
                                 */
                                idx = -1;
                            }
                        }
                        idx++;
                    }
                } else {
                    authorName = AuthorFirstName + " " + AuthorLastName;
                    System.out.println( "authorName ---->> :::: " + authorName );
                    /*
                     * insert them into the tables Application_Author
                     */

 /* check that AuthorName is not null */
                    if ( !"null null".equals( authorName ) ) {
                        StaffDAO.replaceAuthors( referenceNumber, authorName, AuthorFirstName, AuthorLastName );
                    }
                }

            } catch ( DBException ex ) {
                Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
            }

        } catch ( ParseException | FileUploadException ex ) {
            Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
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
                Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
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
                StaffDAO.updateRightsHolderArrayContent( referenceNumber, rightsHolderArrayContent );
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
            for ( int j = 0; j < subDirs.length; j++ ) {
                System.out.println( " Print Loop subDirs [" + j + "]  " + subDirs[ j ] );
            }
            System.out.println( "ffilesToBeMoved.get(i) " + filesToBeMoved.get( i ) );
            String decider = subDirs[ 6 ];

            System.out.println( "filesToBeMoved 1 decider --" + decider + "--->>>> " );

            switch ( decider ) {

                case "Addendum":
                case "Agreement":
                    for ( int j = 0; j < subDirs.length; j++ ) {
                        System.out.println( " Print Loop case Addendum or Agreement  subDirs [" + j + "]  " + subDirs[ j ] );
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
                        System.out.println( " Print Loop case Contract or Translator_CV  subDirs [" + j + "]  " + subDirs[ j ] );
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
                case "BankDetails":
                case "SignedLIContract":
                case "ProofPayment":
                case "Original":
                case "TranslationSample":
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

            System.out.println( "sFile --" + sFile );
            System.out.println( "destDir --" + destDir );

            // moveFile = destinationDirectory + moveFileName;
            File destFile = new File( moveFile );
            System.out.println( "destFile --" + destFile );
            /*
             * --------------------------------------------------------------------------------
             * move file
             * overwrite if file exists
             */
            if ( destFile.exists() ) {
                System.out.println( "Deleting quetly destFile  " + destFile );
                FileUtils.deleteQuietly( destFile );
            }

            FileUtils.moveFile( sFile, destFile );

            /*
             * --------------------------------------------------------------------------------
             */
//            FileUtils.moveFileToDirectory( sFile, destDir, true );
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
//                String decider = elements[ 10 ];
//                translatorName = elements[ 11 ];
//                String moveFileName = elements[ 12 ];
                String decider = elements[ 7 ];  //  Translator_CV
                translatorName = elements[ 8 ];  // Victoria Cribb
                String moveFileName = elements[ 9 ];  // translator cv 1.pdf
                String moveFileNameReplaced = moveFile.replace( "/home/markus/public_html/test", "/public_html/test" );
                System.out.println( "translatorName  " + translatorName );
                System.out.println( "replace longArrayList ( /home/markus/public_html , /public_html/test )-->>>> " + moveFileName + " to " + moveFileNameReplaced );
//                String moveFileNameReplaced = moveFile.replace( "/home/glassfish/glassfish/domains/domain1/docroot/documents", "/documents" );
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
                    int idTranslator = StaffDAO.ifTranslatorExist( translatorName );
                    System.out.println( "referenceNumber  " + referenceNumber );
                    /*
                     * insert them into the table TranslatorTrack
                     */

                    System.out.println( "StaffServlet  decider  " + decider );

                    switch ( decider ) {
                        /*
                         * Agreement with Translation Rights Holder
                         */
                        case "Agreement":
                            System.out.println( "insertAgreement:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                            StaffDAO.replaceAgreement( referenceNumber, rightsHolderArrayContent[ 0 ], Title, moveFileName, moveFileNameReplaced );
                            break;
                        /*
                         * Contract with Translator
                         */
                        case "Contract":
                            System.out.println( "insertContract:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                            StaffDAO.replaceContract( referenceNumber, translatorName, Title, moveFileName, moveFileNameReplaced );
                            break;
                        /*
                         * Addendum with Translation Rights Holder
                         */
                        case "Addendum":
                            System.out.println( "insertAddendum:: longArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile + "---moveFileName  " + moveFileName + "---moveFileNameReplaced  " + moveFileNameReplaced );
                            StaffDAO.replaceAddendum( referenceNumber, rightsHolderArrayContent[ 0 ], Title, moveFileName, moveFileNameReplaced );
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
                            StaffDAO.replaceTranslators( referenceNumber, translatorName, Title, moveFileName, moveFileNameReplaced, fn, fname );
                            break;

                    } // switch (decider)

                } catch ( DBException ex ) {
                    Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
                }

            }

        } else {  // no array - single Translator
            System.out.println( "===================  no array - single Translator ======================== " );
//                    System.out.println("insertTranslators:: translatorName " + translatorName + " referenceNumber " + referenceNumber + "Title" + Title + 
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
                String moveFileNameReplaced = moveFile.replace( "/home/markus/public_html/test", "/public_html/test" );
                System.out.println( "replace shortArrayList ( /home/markus/public_html , /public_html/test )-->>>> " + moveFileName + " to " + moveFileNameReplaced );

//                String moveFileNameReplaced = moveFile.replace( "/home/glassfish/glassfish/domains/domain1/docroot/documents", "/documents" );
                System.out.println( "Process Original TranslationSample  decider  " + decider );
                switch ( decider ) {

                    case "Original":
                        System.out.println( "insertOriginal:: shortArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                        StaffDAO.replaceOriginal( AppNumber, moveFileName, moveFileNameReplaced );
                        break;
                    case "TranslationSample":
                        System.out.println( "insertTranslationSample:: shortArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                        StaffDAO.replaceTranslationSample( AppNumber, moveFileName, moveFileNameReplaced );
                        break;
                    /*
                         * ProofPayment
                     */
                    case "ProofPayment":
                        System.out.println( "replaceProofPayment:: shortArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                        StaffDAO.replaceProofPayment( referenceNumber, moveFileName, moveFileNameReplaced );
                        break;
                    /*
                         * BankDetails
                     */
                    case "BankDetails":
                        System.out.println( "replaceBankDetailForm:: shortArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                        StaffDAO.replaceBankDetailForm( referenceNumber, moveFileName, moveFileNameReplaced );
                        break;
                    /*
                         * SignedLIContract
                     */
                    case "SignedLIContract":
                        System.out.println( "replaceSignedLIcontract:: shortArrayList i[" + i + "]  \n" + decider + "--->>>> " + moveFile );
                        StaffDAO.replaceSignedLIcontract( referenceNumber, moveFileName, moveFileNameReplaced );
                        break;
                } // switch (decider)
            } catch ( DBException ex ) {
                Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
            }
        }
        System.out.println( "####################### End sending files to tables ##################################################" );
        ////////////////////////////////////////////////////////////
        //  Process Library
        ////////////////////////////////////////////////////////////

        System.out.println( "####################### Process library ##################################################" );

        Library library = new Library();

        library.setReferenceNumber( referenceNumber );

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

        System.out.println( "StaffServlet  Process library setreferenceNumber " + referenceNumber );
        System.out.println( "StaffServlet  Process library setTitle " + Title );
        System.out.println( "StaffServlet  Process library setPublisher " + company );
        System.out.println( "StaffServlet  Process library setPublisheryear " + publicationYear );
        System.out.println( "StaffServlet  Process library setGenre " + Genre );
        System.out.println( "StaffServlet  Process library setTranslationTitle " + translationTitle );
        System.out.println( "StaffServlet  Process library setTranslationPublisher " + translationPublisherYear );
        System.out.println( "StaffServlet  Process library setTranslationPublisherYear " + publicationYear );
        System.out.println( "StaffServlet  Process library setCover " + Cover );
//            System.out.println( "StaffServlet  Process library setCoverName " +  coverName);
        System.out.println( "StaffServlet  Process library setPhysicalDescription " + physicalDescription );
        System.out.println( "StaffServlet  Process library setDuplicates " + Duplicates );
        System.out.println( "StaffServlet  Process library setCopies " + Copies );
        System.out.println( "StaffServlet  Process library setNotes " + bookNotes );
        System.out.println( "StaffServlet  Process library setISBN " + ISBN );
        System.out.println( "StaffServlet  Process library setISSN " + ISSN );
        System.out.println( "StaffServlet  Process library setSeries " + Series );

        {
            try {
                bookID = LibraryDAO.insertBook( library );
            } catch ( DBException ex ) {
                Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
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
                             * bookID, referenceNumber)
                     */
                    String language = processingLanguagesArray[ idx ];
                    int idLanguages = 0;
                    try {
                        idLanguages = ifLanguageExist( processingLanguagesArray[ idx ] );
                    } catch ( DBException ex ) {
                        Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }

                    try {

                        /*
                         * set the variables and
                         * insert them into the tables Languages_Library
                         */
                        StaffDAO.insertLanguages_Library( idLanguages, language, bookID, referenceNumber );
                        System.out.println( "1 StaffDAO.insertLanguages_Library(idLanguages  " + idLanguages
                                + " language " + language + " bookID " + bookID + "  referenceNumber " + referenceNumber );

                    } catch ( DBException ex ) {
                        Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }

                    idx++;
                } else {
                    int idLanguages = 0;
                    try {
                        idLanguages = ifLanguageExist( languages );
                    } catch ( DBException ex ) {
                        Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }

                    try {

                        /*
                                 * set the variables and
                                 * insert them into the tables Languages_Library
                         */
                        StaffDAO.insertLanguages_Library( idLanguages, languages, bookID, referenceNumber );
                        System.out.println( "2 StaffDAO.insertLanguages_Library(idLanguages  " + idLanguages
                                + " language " + languages + " bookID " + bookID + "  referenceNumber " + referenceNumber );

                    } catch ( DBException ex ) {
                        Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }
                }
            }
        } else {
            System.out.println( "Languages languageArrayLength  === 0  " + languageArrayLength );

            try {

                int idLanguages = ifLanguageExist( languages );
                StaffDAO.insertLanguages_Library( idLanguages, appTargetLanguage, bookID, referenceNumber );
                System.out.println( "3 StaffDAO.insertLanguages_Library(idLanguages  " + idLanguages
                        + " appTargetLanguage " + appTargetLanguage + " bookID " + bookID + "  referenceNumber " + referenceNumber );

            } catch ( DBException ex ) {
                Logger.getLogger( StaffServlet.class.getName() ).log( Level.SEVERE, null, ex );
            }
        }

        /*
         * reset session
         */
        session.removeAttribute( "task" );
        session.setAttribute( "name", name );
        session.setAttribute( "publisherID", publisherID );
        request.setAttribute( "publisherID", publisherID );
        session.setAttribute( "username", username );
        request.setAttribute( "username", username );
        request.setAttribute( "firstname", firstname );
        request.setAttribute( "lastname", lastname );
        request.setAttribute( "name", name );
        request.setAttribute( "userID", userID );
        System.out.println( " request.setAttribute(name)" + name );
        request.setAttribute( "name", name );
        request.setAttribute( "message", message );
        request.getRequestDispatcher( "/WEB-INF/views/uploadResponse_staff.jsp" ).forward( request, response );
//        break;

    }

    public Date convertDate( String datum ) throws ParseException {
        System.out.println( " convertDate datum " + datum );
        DateFormat sourceFormat = new SimpleDateFormat( "dd/MM/yyyy" );
        Date date = sourceFormat.parse( datum );
        System.out.println( " convertDate return date " + date );
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
