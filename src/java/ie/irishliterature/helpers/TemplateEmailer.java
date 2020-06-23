/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.helpers;

import ie.irishliterature.servlets.EmailWithHTMLTemplate;
import ie.irishliterature.util.Setup;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Markus Rieder
 *
 */
public class TemplateEmailer {

    static String returnMessage = "";
    static String subject = "";
// public static void sendEmail( String Parameter1, String Parameter2, String Parameter3, String Parameter4, String Parameter5, String Parameter6, String Parameter7, String Parameter8, String Parameter9, String Parameter10, String Parameter11

    /**
     *
     * @param username              username
     * @param salutations           salutations
     * @param referenceNumber       referenceNumber
     * @param email                 email
     * @param password              password
     * @param datum                 datum
     * @param amountApproved        amountApproved
     * @param attachFiles           attachFiles
     * @param expectedReturnDate    expectedReturnDate
     * @param hash                  hash
     * @param template              template
     *
     * @throws AddressException     AddressException
     * @throws MessagingException   MessagingException
     * @throws java.io.IOException  IOException
     */
    public static void sendEmail( String username, String[] salutations, String referenceNumber, String email, String password,
            String datum, String amountApproved, String[] attachFiles, String expectedReturnDate, String hash, String template ) throws AddressException, MessagingException, IOException {
        System.out.println( "############################### /TemplateEmailer ####################################" );
        String selectedTemplate = template;
        System.out.println( "template  " + template );
        System.out.println( "selectedTemplate  " + selectedTemplate );
        File selectedTemplateN = new File( selectedTemplate );
        System.out.println( "selectedTemplateName  " + selectedTemplateN.getName() );
        String selectedTemplateName = selectedTemplateN.getName();
        System.out.println( "selectedTemplateName  " + selectedTemplateName );

        switch ( selectedTemplateName )
        {
            case "EmailVerificationStaff.html":
                subject = "Irish Literature - Email Registration";
                break;

            case "informPublisherAwarded.html":
                subject = "Irish Literature - Your translation grant application";
                break;

            case "informPublisherRejected.html":
                subject = "Irish Literature - Your translation grant application";
                break;

            case "newApplicationNotification.html":
                subject = "Irish Literature - New Application";
                break;

            case "sendEmailExpertReaderInvoiceReceived.html":
                subject = "Irish Literature - Expert Reader Invoice received";
                break;

            case "sendEmailExpertReaderReportSubmit.html":
                subject = "Irish Literature - Expert Reader Report received";
                break;

            case "sendEmailRegistrationLinkExpertReader.html":
                subject = "Irish Literature - Email Registration";
                break;

            case "sendEmailRegistrationLink.html":
                subject = "Irish Literature - Email Registration";
                break;

            case "sendEmailRegistrationLinkNewStaff.html":
                subject = "Irish Literature - Email Registration";
                break;

            case "sendEmailWithAttachmentExpertReader.html":
                subject = "Irish Literature - New book for review";
                break;

            case "sendResetPasswordLink.html":
                subject = "Irish Literature - Reset Password";
                returnMessage = "We have sent the reset password link to your email address " + email;
                break;
        }

        try
        {
            System.out.println( "subject  " + subject );
            //Email data 
//            String Email_Id = "markus@rieder.ie";        //change to your email ID
//            String password = "Or10Nn3bu7a";                 //change to your password
            String recipient_mail_id = "markus@rieder.ie";   //change to recipient email id
            String mail_subject = subject;

            //Set mail properties
            Properties props = new Properties();

            props.put( "mail.smtp.host", Setup.MAIL_SMTP_HOST );
            props.put( "mail.smtp.user", Setup.MAIL_USERNAME );
            props.put( "mail.smtp.port", "26" );
            props.put( "mail.smtp.auth", "true" );
            props.put( "mail.smtp.starttls.enable", "true" );

            Session session = Session.getDefaultInstance( props );
            MimeMessage message = new MimeMessage( session );

            try
            {
                //Set email data 
                message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
                message.addRecipient( Message.RecipientType.TO, new InternetAddress( recipient_mail_id ) );
                message.setSubject( mail_subject );
                MimeMultipart multipart = new MimeMultipart();
                BodyPart messageBodyPart = new MimeBodyPart();

                //Set key values
                Map<String, String> input = new HashMap<>();

                input.put( "LOGIN", username );
//                input.put( "SALUTATIONS", salutations );
                input.put( "[ReferenceNumber]", referenceNumber );
                input.put( "[EMAILADDRESS]", email );
                input.put( "[PASSWORD]", password );
                input.put( "[DATUM]", datum );
                input.put( "[AMOUNT]", amountApproved );
//                input.put( "[amountRewarded]", amountApproved );
//                input.put( "ATTACHEDFILE", attachFiles );
                input.put( "[expectedReturnDate]", expectedReturnDate );
                input.put( "[HASH]", hash );

                //HTML mail content
                String htmlText = readEmailFromHtml( selectedTemplate, input, salutations );
                messageBodyPart.setContent( htmlText, "text/html" );

                multipart.addBodyPart( messageBodyPart );
//                message.setContent( multipart );

//                System.out.println( "TemplateEmailer attachFiles[0]  " + attachFiles );
//  System.out.println( "attachFiles.length  " + attachFiles.length );
                // adds attachments
                if ( attachFiles[0] != null && attachFiles.length > 0 )
                {
//                    System.out.println( "attachFiles  " + attachFiles );
//                    System.out.println( "attachFiles.length  " + attachFiles.length );

                    for ( String filePath : attachFiles )
                    {

                        messageBodyPart = new MimeBodyPart();
                        DataSource source = new FileDataSource( filePath );
                        messageBodyPart.setDataHandler( new DataHandler( source ) );
                        messageBodyPart.setFileName( filePath );

                        multipart.addBodyPart( messageBodyPart );

                    }
                }

                // sets the multi-part as e-mail's content
                message.setContent( multipart, "text/html; charset=utf-8" );

                //   message.setContent(bodyText.toString(), "text/html; charset=utf-8");
                message.setSentDate( new Date() );

                //Conect to smtp server and send Email
                Transport transport = session.getTransport( "smtp" );
                transport.connect( Setup.MAIL_SMTP_HOST, Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
                transport.sendMessage( message, message.getAllRecipients() );
                transport.close();
                System.out.println( "TemplateEmailer  >>> Mail sent successfully..." );

            }
            catch ( MessagingException ex )
            {
                Logger.getLogger( EmailWithHTMLTemplate.class.getName() ).log( Level.SEVERE, null, ex );
            }
            catch ( Exception ae )
            {
                ae.printStackTrace();
            }
        }
        catch ( Exception exception )
        {
            exception.printStackTrace();
        }

//   request.getRequestDispatcher( "/WEB-INF/views/response.jsp" ).forward( request, response );
//        callDirect(request, response);
//        request.getRequestDispatcher( "/WEB-INF/views/welcome_Staff_1.jsp" ).forward( request, response );
    }

//    public static void callDirect( HttpServletRequest request, HttpServletResponse response ) throws IOException {
//        // here type your JSP page that you want to open
//       request.setAttribute("message", returnMessage);
//        response.sendRedirect( "/WEB-INF/views/response.jsp" );
//    }
    //Method to replace the values for keys
    protected static String readEmailFromHtml( String filePath, Map<String, String> input, String[] salutations ) {
        System.out.println( "readEmailFromHtml filePath " + filePath );
        String msg = readContentFromFile( filePath );
        /**
         * scan the msg for salutation key words and replace them accordingly
         * salutations[ 0 ] = fullName - FULL_NAME of user who applied for grant
         * salutations[ 2 ] = first_name - First_NAME of user who applied for
         * grant
         * salutations[ 3 ] = last_name - Last_NAME of user who applied for
         * grant
         */
        System.out.println( msg );
        if ( msg.contains( "Full_Name" ) )
        {
            System.out.println( "msg.contains(Full_Name)" + salutations[0] );
            input.put( "[Full_Name]", salutations[0] );
        }
        else if ( msg.contains( "First_Name" ) )
        {
            System.out.println( "msg.contains(First_Name)" );
            input.put( "[First_Name]", salutations[2] );
        }
        else if ( msg.contains( "Last_Name" ) )
        {
            System.out.println( "msg.contains(Last_Name)" );
            input.put( "[Last_Name]", salutations[3] );
        }
        else if ( msg.contains( "Publisher" ) )
        {
            System.out.println( "msg.contains(Publisher)" );
            input.put( "[Publisher]", salutations[0] );
        }
        else if ( msg.contains( "expertReaderName" ) )
        {
            System.out.println( "msg.contains(expertReaderName)" );
            input.put( "[expertReaderName]", salutations[0] );
        }
        else
        {
//            System.out.println( "msg.contains(Publisher)" );
//            input.put( "[Publisher]", salutations[ 0 ] );
        }
        try
        {
            Set<Map.Entry<String, String>> entries = input.entrySet();
            for ( Map.Entry<String, String> entry : entries )
            {
                msg = msg.replace( entry.getKey().trim(), entry.getValue().trim() );
            }
        }
        catch ( Exception exception )
        {
            exception.printStackTrace();
        }
        return msg;
    }
//Method to read HTML file as a String 

    protected static String readContentFromFile( String fileName ) {
        StringBuffer contents = new StringBuffer();

        try
        {
            //use buffering, reading one line at a time
            BufferedReader reader = new BufferedReader( new FileReader( fileName ) );
            try
            {
                String line = null;
                while ( ( line = reader.readLine() ) != null )
                {
                    contents.append( line );
                    contents.append( System.getProperty( "line.separator" ) );
                }
            }
            finally
            {
                reader.close();
            }
        }
        catch ( IOException ex )
        {
            ex.printStackTrace();
        }
        return contents.toString();

    }

}
