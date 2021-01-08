package ie.irishliterature.util;

import ie.irishliterature.model.GrantApplication;
import java.math.BigDecimal;
import java.util.ArrayList;
import static java.util.Calendar.DATE;
import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailUtil {

    public static void sendEmailRegistrationLinkNewStaff( String uname, String firstname, String password, String email, String hash ) throws AddressException, MessagingException {

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        session.setDebug( true );

        try {

            String link = Setup.MAIL_REGISTRATION_SITE_LINK + "?scope=activation&userId=" + uname + "&hash=" + hash;

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<p>  Dear " )
                    .append( firstname )
                    .append( ", </p>" )
                    .append( "<p>  This email is being sent to you to validate the email address you provided for your Literature Ireland " )
                    .append( "  translation grant system login.</p> " )
                    .append( "<p>  To ensure the security of the account information associated with your login," )
                    .append( "  please take a moment to click through the link below and verify that we have assigned the correct email address:</p>" )
                    .append( "<p><u><a href='" )
                    .append( link )
                    .append( "'> <u>" )
                    .append( link )
                    .append( "</a></u></p>" )
                    .append( "</p><br/><br/></p>" )
                    .append( "<p>  Please note that if you do not confirm your email address, your login details will eventually be automatically disabled.</p> " )
                    .append( " <p> To log into the system, you can use the following account information:</p>" )
                    .append( "<p>Your login:  " )
                    .append( uname )
                    .append( "</p>" )
                    .append( "<p>Your email address: " )
                    .append( email )
                    .append( "</p>" )
                    .append( "<p>Your interim password: " )
                    .append( password )
                    .append( "</p>" )
                    .append( "<p>  Once you have logged in, you may change your password. </p>" )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Irish Literature - Email Registration" );
//            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setContent( bodyText.toString(), "text/html" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailRegistrationLinkExpertReader( String uname, String fullname, String password, String email, String hash ) throws AddressException, MessagingException {

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        session.setDebug( true );

        try {

            String link = Setup.MAIL_REGISTRATION_SITE_LINK + "?scope=activation&userId=" + uname + "&hash=" + hash;

            String info = "http://localhost/reader/info";
            String policy = "http://localhost/reader/info";

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<p>  Dear " )
                    .append( fullname )
                    .append( ", </p>" )
                    .append( "<p>This email is being sent to you to validate the email address you provided for your Literature  Ireland translation grant system login." )
                    .append( "</p> " )
                    .append( " <p>To ensure the security of the account information associated with your login, please take a moment to click through the link below and verify that we have the correct email address.</p > " )
                    .append( " <p>Please note that if you do not confirm your email address, your login details will eventually be automatically disabled.</p>" )
                    .append( " <p> <a href='" )
                    .append( link )
                    .append( "'> <u>" )
                    .append( link )
                    .append( "</u></a> </p>" )
                    .append( "<p> To log into the system, you can use the following account information: </p> " )
                    .append( " <p>Your login: " )
                    .append( uname )
                    .append( "<br/>" )
                    .append( "<p>Your email address: " )
                    .append( email )
                    .append( "</p>" )
                    .append( "<p>Your interim password: " )
                    .append( password )
                    .append( " &nbsp;</p>" )
                    .append( "<p>Some guidelines on how to use the system (e.g.uploading your report and bank details form) are available online at&nbsp;" )
                    .append( " <a href='" )
                    .append( info )
                    .append( "target='_blank'> <u>" )
                    .append( info )
                    .append( "</u></a>" )
                    .append( "  </p> " )
                    .append( " <p> Should you have additional questions, please do not hesitate to contact &nbsp; " )
                    .append( " <a href='mailto: info@literatureireland.com'><u> info@literatureireland.com</u></a>" )
                    .append( " &nbsp;or&nbsp;  <a href='mailto: online@literatureireland.com'>  <u> online@literatureireland.com</u></a></p>" )
                    .append( "  <p> You can find a copy of our privacy policy on our website at:  </p>" )
                    .append( "  <a href='" )
                    .append( policy )
                    .append( "target='_blank'> <u>" )
                    .append( policy )
                    .append( "</u></a>" )
                    .append( " <p> Thank you and best wishes from Literature Ireland. </p> " )
                    .append( "  <p> <br/><br/></p> " )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Irish Literature - Email Registration" );
//            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setContent( bodyText.toString(), "text/html" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );
            try (//            try (
                    // Send message
                    Transport transport = session.getTransport( "smtp" ) // {
                    ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );
//            }

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailRegistrationLink( String uname, String fullname, String email, String hash ) throws AddressException, MessagingException {

        System.out.println( "MailUtil sendEmailRegistrationLink" );
        System.out.println( "uname " + uname + " fullname " + fullname + " email " + email );

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        session.setDebug( true );

        String LIemail = "online@literatureireland.com";

        try {

            String link = Setup.MAIL_REGISTRATION_SITE_LINK + "?scope=activation&userId=" + uname + "&hash=" + hash;

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<p>  Dear " )
                    .append( fullname )
                    .append( ", </p>" )
                    .append( "  This email has been sent to validate the email address " )
                    .append( "  provided for your login to the Literature Ireland Translation Grant Application System. " )
                    .append( "   <br/><br/>" )
                    .append( "  To ensure the security of the account information associated with your" )
                    .append( "  login, please take a moment to click through the link below" )
                    .append( "  and verify that we have the correct email address." )
                    .append( "   <br/><br/>" )
                    .append( "  <a href=\"" )
                    .append( link )
                    .append( "\">" )
                    .append( link )
                    .append( "</a>" )
                    .append( " Please note that if you do not confirm your email address, your login details will eventually be" )
                    .append( "  disabled." )
                    .append( "   <br/><br/>" )
                    .append( "  To log into the system, you can use the following account information:" )
                    .append( "   <br/><br/>" )
                    //                    .append( "  Account Information:<br/><br/>" )
                    .append( "    Your login:         " )
                    .append( uname )
                    .append( "<br/>" )
                    .append( "    Your email address: " )
                    .append( email )
                    .append( "<br/>" )
                    .append( "    Your interim password: " )
                    .append( email )
                    .append( "   <br/><br/>" )
                    .append( "  Thank you for signing up to the TGA system and for your interest in Literature Ireland." )
                    .append( "  Should you have any queries, please contact online@literatureireland.com " )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Irish Literature - Email Registration" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void sendResetPasswordLink( String id, String email, String hash ) throws AddressException, MessagingException {

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        session.setDebug( true );

        try {

            String link = Setup.MAIL_REGISTRATION_SITE_LINK + "?scope=resetPassword&userId=" + id + "&hash=" + hash;

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "  Dear user<br/><br/>" )
                    .append( "  Your reset password request has been received <br/>" )
                    .append( "  To set a new password, please click <a href=\"" )
                    .append( link )
                    .append( "\">here</a> the following link in your browser:<br/>" )
                    .append( "  <a href=\"" )
                    .append( link )
                    .append( "\">" )
                    .append( link )
                    .append( "</a>" )
                    .append( "  <br/><br/>" )
                    .append( "  Should you have any problems, or have any questions in relation to the system, " )
                    .append( "  please contact online@literatureireland.com" )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Literature Ireland -  Reset Password" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailWithAttachmentExpertReader( String appNo, String expertReaderName, String expertReaderEmail, String[] attachFiles, String expectedReturnDate ) throws AddressException, MessagingException {

        Properties props = new Properties();

//        String from = "literatureirelandapplication";
//        String pass = "Ulysses@2020";
//        String host = "smtp.gmail.com";
//
//        props.put( "mail.smtp.starttls.enable", "true" );
//        props.put( "mail.smtp.host", "smtp.gmail.com" );
//        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
//        props.put( "mail.smtp.password", "Ulysses@2020" );
//        props.put( "mail.smtp.port", "587" );
//        props.put( "mail.smtp.auth", "true" );
//        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );
//
//        Session session = Session.getInstance( props, new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
//            }
//        } );
        String from = Setup.MAIL_USERNAME;
        String pass = Setup.MAIL_PASSWORD;
        String host = "lh30.dnsireland.com";

        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );
        session.setDebug( true );

        String expertreaders_form = "https://www.literatureireland.com/grants/translation-grant-programme/expert-readers";
        String ILGAS = "https://www.literatureirelandgrantapplication.com/ILGAS/";

        try {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" ).append( "  Dear " )
                    .append( expertReaderName )
                    .append( ",<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "Many thanks for agreeing to take on report" )
                    .append( "  &nbsp; " )
                    .append( appNo )
                    .append( ". Please find attached a sample translation of the above mentioned title together with a copy of the original work. Please supply a report of no more than two pages on the sample translation enclosed, addressing the points below." )
                    .append( "<br/><br/>" )
                    .append( "Your report will be taken into account by the Board of Literature Ireland when assessing this application. The report may also be made available, anonymously, to the publisher and/or translator of the work. For this reason, we would recommend that an objective tone be maintained throughout. <strong>Please do not sign your name to the report</strong>. Use the project reference number only." )
                    .append( "<br/><br/>" )
                    .append( "<ol>" )
                    .append( "<li>       Is the literary quality of the translation of an acceptable standard? Is the quality maintained consistently throughout the enclosed extract?</li>" )
                    .append( "<li>       Is the translation readable, i.e. does it flow?" )
                    .append( "<li>       Does the style of the translation reflect that of the original?</li>" )
                    .append( "<li>       Is the translation complete, correct and accurate?" )
                    .append( "<li>       Does the original pose specific difficulties, e.g. specialised terminology, culture-specific vocabulary, dialect? Does the translator resolve these difficulties adequately? Does the translator demonstrate complete creative command of his/her own language?</li>" )
                    .append( "<li>       If applicable, please comment on register, rhyme, rhythm, alliteration, word order and other poetic devices, or is the translation a free interpretation?</li>" )
                    .append( "<li>       Would you recommend publication of the translation? If yes, please specify whether you would recommend publication a) as it stands or b) with revisions.</li>" )
                    .append( "</ol>" )
                    .append( "<strong>Please supply concrete textual examples</strong> both in the language of the original and in that of the translation to illustrate your assessment, bearing in mind that the board and staff of Literature Ireland may not be familiar with the language of the translation in question. In other words, we would ask you to furnish explanations in English for what in your opinion are grounds for praise or criticism. Also, if you can see an improved solution, we would ask you to provide concrete suggestions.<br />" )
                    .append( "The fee for the report will be EUR &euro;125. We would be grateful if you could return your report to me as a <strong>Word document</strong> (or equivalent but not PDF) by <strong>" )
                    .append( expectedReturnDate )
                    .append( "</strong>. We ask that submit a completed bank details form at the same time as you submit your report. A copy of this form can be requested via email to<br />" )
                    .append( " <a href='mailto:info@literatureireland.com'>info@literatureireland.com</a>" )
                    .append( " or downloaded from our website at <br />" )
                    .append( " <a href='" )
                    .append( expertreaders_form )
                    .append( "target='_blank'> <u>" )
                    .append( expertreaders_form )
                    .append( "</u></a>" )
                    //                    .append( expertreaders_form )
                    .append( "<br/><br/>" )
                    .append( "Your report and bank details form should be submitted via our online system. You can log into the system at " )
                    .append( " <a href='" )
                    .append( ILGAS )
                    .append( "target='_blank'> <u>" )
                    .append( ILGAS )
                    .append( "</u></a>" )
                    //                    .append( ILGAS )
                    .append( ".<br/><br/>" )
                    .append( "Guidelines on how to use the system are available at " )
                    .append( expertreaders_form )
                    .append( "<br/><br/>" )
                    .append( "If you have any queries, please do not hesitate to contact me." )
                    .append( "<br/><br/>" )
                    .append( "Thank you for your time and expertise." )
                    .append( "<br/><br/>" )
                    .append( "Kind regards, <br />" )
                    .append( "Literature Ireland<br />" )
                    .append( "<br/><br/>" )
                    .append( "<a href='mailto:online@irelandliterature.com'>online@irelandliterature.com</a> / <a href='mailto:info@literatureireland.com'>info@literatureireland.com</a><br />" )
                    .append( "<br/><br/>" )
                    .append( "<strong>2 Attachments</strong>" )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( expertReaderEmail ) );
            message.setSubject( "Literature Ireland - New Translation for Review" );

            // creates message part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent( bodyText.toString(), "text/html" );

            // creates multi-part
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart( messageBodyPart );

            // adds attachments
            if ( attachFiles != null && attachFiles.length > 0 ) {
                for ( String filePath : attachFiles ) {

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

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailExpertReaderReportSubmit( String expertReaderName, String ReferenceNumber ) throws AddressException, MessagingException {

        System.out.println( "sendEmailExpertReaderReportSubmit... expertReaderName " + expertReaderName );
        System.out.println( "sendEmailExpertReaderReportSubmit... ReferenceNumber " + ReferenceNumber );

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        String LIemail = "online@literatureireland.com";
        String Testemail = "markus@rieder.ie";

        // Used to debug SMTP issues
        session.setDebug( true );

        try {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "  For your information!!! " )
                    .append( ",<br/><br/>" )
                    .append( expertReaderName )
                    .append( " has submitted the review for application no.: " )
                    .append( ReferenceNumber )
                    .append( "<br/><br/>" )
                    .append( "</div>" );

            MimeMessage message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( LIemail ) );
            message.setSubject( "Irish Literature - Expert Reader Submission" );
            System.out.println( "sendEmailExpertReaderReportSubmit... bodyText " + bodyText.toString() );
            // creates message part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
//            messageBodyPart.setContent( bodyText.toString(), "text/html" );
            message.setContent( bodyText.toString(), "text/html" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailExpertReaderInvoiceReceived( String expertReaderName, String ReferenceNumber ) throws AddressException, MessagingException {

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        String LIemail = "online@literatureireland.com";
        String Testemail = "markus@rieder.ie";

        // Used to debug SMTP issues
        session.setDebug( true );

        try {

            StringBuilder bodyText = new StringBuilder();

            bodyText.append( "<div>" )
                    .append( "  For your information!!! " )
                    .append( ",<br/><br/>" )
                    .append( expertReaderName )
                    .append( " has submitted the invoice for application no.: " )
                    .append( ReferenceNumber )
                    .append( "<br/><br/>" )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( LIemail ) );
            message.setSubject( "Irish Literature - Expert Reader Invoice received" );

            // creates message part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
//            messageBodyPart.setContent( bodyText.toString(), "text/html" );
            message.setContent( bodyText.toString(), "text/html" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void informPublisherAwarded( String Full_Name, String first_name, String email, String amountRewarded, String ReferenceNumber, String author, String title, String language ) throws AddressException, MessagingException {

        Properties props = new Properties();

//        String from = "literatureirelandapplication";
//        String pass = "Ulysses@2020";
//        String host = "smtp.gmail.com";
//
//        props.put( "mail.smtp.starttls.enable", "true" );
//        props.put( "mail.smtp.host", "smtp.gmail.com" );
//        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
//        props.put( "mail.smtp.password", "Ulysses@2020" );
//        props.put( "mail.smtp.port", "587" );
//        props.put( "mail.smtp.auth", "true" );
//        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );
//
//        Session session = Session.getInstance( props, new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
//            }
//        } );
//
//        String LIemail = "online@literatureireland.com";
        String from = Setup.MAIL_USERNAME;
        String pass = Setup.MAIL_PASSWORD;
        String host = "lh30.dnsireland.com";

        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

//        String LIemail = "online@literatureireland.com";
        // Used to debug SMTP issues
        session.setDebug( true );

        try {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<strong> Translation Grant Application &nbsp;</strong> " )
                    .append( ReferenceNumber )
                    .append( "  &nbsp; " )
                    .append( author )
                    .append( "  &nbsp; " )
                    .append( title )
                    .append( "<br/><br/>" )
                    .append( "  Dear " )
                    .append( first_name )
                    .append( ", <br/><br/>" )
                    .append( "I am delighted to inform you that the board of Literature Ireland has decided to award your company a grant of €" )
                    .append( amountRewarded )
                    .append( "  for the translation of the above work in <br/>" )
                    .append( language )
                    .append( ". <br/><br/>" )
                    .append( " Formal papers of award will be issued to you in the coming weeks. In the meantime, I would like to draw your attention to the main conditions stipulated by Literature Ireland when it awards a translation grant to a publisher: " )
                    .append( "<ul>" )
                    .append( "<li>  The Grant Agreement is valid for a period of 12 months from the date of approval.     </li>" )
                    .append( "<li>       The published translation must be that originally submitted to Literature Ireland for consideration for a grant. " )
                    .append( "<li>       The published translation must contain an acknowledgement of the financial support of Literature Ireland, printed above our logo (Literature Ireland logo with strapline). This acknowledgement must, in the language of the translation, read as follows:<br/><br/> <strong>This book was published with the support of Literature Ireland</strong></li>" )
                    .append( "<li>       The proof-page containing this acknowledgement must be emailed to Literature Ireland for approval before the book is sent to print." )
                    .append( "<li>       Sales figures for any existing translations published with Literature Ireland’s financial support must be supplied to Literature Ireland before the publication of the work for which this grant is offered.</li>" )
                    .append( "</ul>" )
                    .append( "<br/><br/>" )
                    .append( "  I am delighted that the board has awarded you this grant and I look forward to working with you on this project. If you have any queries please do not hesitate to contact me, quoting the reference number in the subject line." )
                    .append( "<br/><br/>" )
                    .append( "Best regards, <br />" )
                    .append( "Rita McCann<br />" )
                    .append( "<br/><br/>" )
                    .append( "Literature Ireland<br />" )
                    .append( "<br/><br/>" )
                    .append( "<a href='mailto:rita@literatureireland.com'>rita@literatureireland.com</a> <br />" )
                    .append( "<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( "markus@rieder.ie" ) );
//            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( LIemail ) );
            message.setSubject( "Irish Literature - Your translation grant application" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void informPublisherRejected( String Full_Name, String first_name, String email, String amountRewarded, String ReferenceNumber, String author, String title, String language ) throws AddressException, MessagingException {

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        String LIemail = "online@literatureireland.com";

        // Used to debug SMTP issues
        session.setDebug( true );

        try {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<strong> Translation Grant Application &nbsp;</strong> " )
                    .append( ReferenceNumber )
                    .append( "  &nbsp; " )
                    .append( author )
                    .append( "  &nbsp; " )
                    .append( title )
                    .append( "<br/><br/>" )
                    .append( "  Dear " )
                    .append( first_name )
                    .append( ", <br/><br/>" )
                    .append( " On behalf of the board of Literature Ireland, I very much regret to inform you that the board, at its recent meeting, decided not to award a grant to your company for the translation of the above work into  " )
                    .append( language )
                    .append( ". <br/><br/>" )
                    .append( " I am sorry that your application was unsuccessful on this occasion and I hope it won’t deter you from making further applications to Literature Ireland. <br/>" )
                    .append( " Should you have any queries, please do not hesitate to contact me. <br/>" )
                    .append( "<br/><br/>" )
                    .append( "Best regards, <br />" )
                    .append( "Rita McCann<br />" )
                    .append( "<br/><br/>" )
                    .append( "Literature Ireland<br />" )
                    .append( "<br/><br/>" )
                    .append( "<a href='mailto:rita@literatureireland.com'>rita@literatureireland.com</a> <br />" )
                    .append( "<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );

            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( "markus@rieder.ie" ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( LIemail ) );
            message.setSubject( "Irish Literature - Your translation grant application" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

            try ( // Send message
                    Transport transport = session.getTransport( "smtp" ) ) {
                transport.connect( host, from, pass );
                transport.sendMessage( message, message.getAllRecipients() );
            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void newApplicationNotification( String Publisher, String ReferenceNumber, String today ) throws AddressException, MessagingException {

        Properties props = new Properties();

        String from = "literatureirelandapplication";
        String pass = "Ulysses@2020";
        String host = "smtp.gmail.com";

        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.host", "smtp.gmail.com" );
        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
        props.put( "mail.smtp.password", "Ulysses@2020" );
        props.put( "mail.smtp.port", "587" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "literatureirelandapplication@gmail.com", "Ulysses@2020" );
            }
        } );

        // Used to debug SMTP issues
        session.setDebug( true );

        try {

            String email = "online@literatureireland.com";

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<p>  The publisher <strong>" )
                    .append( "<br/> " )
                    .append( "<br/> " )
                    .append( Publisher )
                    .append( "<br/>" )
                    .append( "</strong> </p>" )
                    .append( "<p> has created a new application with the Reference number " )
                    .append( ReferenceNumber )
                    .append( "</p> " )
                    .append( "<br/>" )
                    .append( "<p> Date: " )
                    .append( today )
                    .append( "</p> " )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( "Literature Ireland <literatureirelandapplication@gmail.com>" ) );
            message.setReplyTo( new javax.mail.Address[]{
                new javax.mail.internet.InternetAddress( "online@literatureireland.com" )
            } );

            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( "markus@rieder.ie" ) );
            message.setSubject( "Irish Literature - New Application" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );

            System.out.println( "sending..." );

//            try ( // Send message
//                    Transport transport = session.getTransport( "smtp" )) {
//                transport.connect( host, from, pass );
//                transport.sendMessage( message, message.getAllRecipients() );
//            }
            System.out.println( "Sent message successfully...." );

        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

    public static void informPublisherofPayment( String ReferenceNumber, String Author, String Title, String company, String email, String amountRewarded,
            String today ) throws AddressException, MessagingException {

        Properties props = new Properties();

//        String from = "literatureirelandapplication";
//        String pass = "Ulysses@2020";
//        String host = "smtp.gmail.com";
//
//        props.put( "mail.smtp.starttls.enable", "true" );
//        props.put( "mail.smtp.host", "smtp.gmail.com" );
//        props.put( "mail.smtp.user", "literatureirelandapplication@gmail.com" );
//        props.put( "mail.smtp.password", "Ulysses@2020" );
//        props.put( "mail.smtp.port", "587" );
//        props.put( "mail.smtp.auth", "true" );
//        props.put( "mail.smtp.ssl.trust", "smtp.gmail.com" );
        String from = Setup.MAIL_USERNAME;
        String pass = Setup.MAIL_PASSWORD;
        String host = "lh30.dnsireland.com";

        props.put( "mail.smtp.auth", "true" );
//        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.user", Setup.MAIL_USERNAME );
        props.put( "mail.smtp.password", Setup.MAIL_PASSWORD );
        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "25" );
        props.put( "mail.smtp.ssl.trust", "*" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        String LIemail = "online@literatureireland.com";

        // Used to debug SMTP issues
        session.setDebug( true );

        try {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<strong> Payment advice: Translation Grant  &nbsp; " )
                    .append( ReferenceNumber )
                    .append( "  &nbsp; " )
                    .append( Author )
                    .append( " , &nbsp; " )
                    .append( Title )
                    .append( ".</strong><br/><br/>" )
                    .append( "  Dear Dear Sir/Madam" )
                    .append( ", <br/><br/>" )
                    .append( " We are delighted to inform you that we have issued payment of the above translation grant.  " )
                    .append( " <br/><br/>" )
                    .append( "Payee:  &nbsp;" )
                    .append( company )
                    .append( ". <br/>" )
                    .append( "Amount:  &nbsp;" )
                    .append( amountRewarded )
                    .append( ". <br/>" )
                    .append( "Date:  &nbsp;" )
                    .append( today )
                    .append( ".<br/><br/>" )
                    .append( " Should you have any questions or require any further documentation or details, please contact Rita McCann at rita@literatureireland.com.  <br/>" )
                    .append( "<br/><br/>" )
                    .append( "Literature Ireland<br />" )
                    .append( "<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Irish Literature - Remittance advice" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );
        } catch ( MessagingException e ) {
            throw new RuntimeException( e );
        }
    }

}
