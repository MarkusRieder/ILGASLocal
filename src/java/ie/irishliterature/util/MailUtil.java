package ie.irishliterature.util;

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

    public static void sendEmailRegistrationLinkNewStaff( String uname, String firstname, String password, String email, String hash ) throws AddressException, MessagingException
    {

        Properties props = new Properties();

        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        try
        {

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
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Irish Literature - Email Registration" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );

        }
        catch ( MessagingException e )
        {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailRegistrationLinkExpertReader( String uname, String fullname, String password, String email, String hash ) throws AddressException, MessagingException
    {

        Properties props = new Properties();

        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        try
        {

            String link = Setup.MAIL_REGISTRATION_SITE_LINK + "?scope=activation&userId=" + uname + "&hash=" + hash;
            String info = "http://www.literatureirelandgrantapplication.com/reader/info";
            String policy = "http://www.literatureirelandgrantapplication.com/reader/info";

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
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Irish Literature - Email Registration" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );

        }
        catch ( MessagingException e )
        {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailRegistrationLink( String uname, String fullname, String email, String hash ) throws AddressException, MessagingException
    {
        Properties props = new Properties();

        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        try
        {

            String link = Setup.MAIL_REGISTRATION_SITE_LINK + "?scope=activation&userId=" + uname + "&hash=" + hash;

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "<p>  Dear " )
                    .append( fullname )
                    .append( ", </p>" )
                    .append( "  This email has been sent to validate the email address that you have" )
                    .append( "  provided for your login to the Literature Ireland Translation Grant Application System (TGA). " )
                    .append( "   <br/><br/>" )
                    .append( "  To ensure the security of the account information associated with your" )
                    .append( "  TGA login, please take a moment to click through the link below" )
                    .append( "  and verify that we have the correct email address. If you do not" )
                    .append( "  confirm your email address, your TGA login will eventually be" )
                    .append( "  disabled." )
                    .append( "   <br/><br/>" )
                    .append( "  To confirm your email address, please visit the following URL:" )
                    .append( "   <br/><br/>" )
                    .append( "  <a href=\"" )
                    .append( link )
                    .append( "\">" )
                    .append( link )
                    .append( "</a>" )
                    .append( "   <br/><br/>" )
                    .append( "  Account Information:<br/><br/>" )
                    .append( "    Your login:         " )
                    .append( uname )
                    .append( "<br/>" )
                    .append( "    Your email address: " )
                    .append( email )
                    .append( "   <br/><br/>" )
                    .append( "  Thank you for signing up to the TGA system and for your interest in Literature Ireland." )
                    .append( "  Should you have any queries, please contact online@literatureireland.com " )
                    .append( "</div>" );

            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Literature Ireland - Email Registration" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );

        }
        catch ( MessagingException e )
        {
            throw new RuntimeException( e );
        }
    }

    public static void sendResetPasswordLink( String id, String email, String hash ) throws AddressException, MessagingException
    {

        Properties props = new Properties();
        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        try
        {

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
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setSubject( "Literature Ireland -  Reset Password" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );
        }
        catch ( MessagingException e )
        {
            throw new RuntimeException( e );
        }
    }

    public static void sendEmailWithAttachmentExpertReader( String expertReaderName, String expertReaderEmail, String[] attachFiles, String expectedReturnDate ) throws AddressException, MessagingException
    {

        Properties props = new Properties();
        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        try
        {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" ).append( "  Dear " )
                    .append( expertReaderName )
                    .append( ",<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "Many thanks for agreeing to take on this task. Please find attached a sample translation of the above mentioned title in German together with a copy of the original work. Please supply a report of no more than two pages on the sample translation enclosed, addressing the points below." )
                    .append( "<br/><br/>" )
                    .append( "Your report will be taken into account by the Board of Literature Ireland (formerly Ireland Literature Exchange) when assessing this application. The report may also be made available, anonymously, to the publisher and/or translator of the work. For this reason, we would recommend that an objective tone be maintained throughout. <strong>Please do not sign your name to the report</strong>. Use the project reference number only." )
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
                    .append( "</strong>. Please let me know if you would like to receive a gratis copy of the finished translation on publication.<br />" )
                    .append( "<br/><br/>" )
                    .append( "We ask that submit an invoice, citing the project reference number, at the same time as your report, along with a completed bank details form. A copy of this form can be requested via email to <a href='mailto:info@irelandliterature.com'>info@irelandliterature.com</a>.<br /><br />" )
                    .append( "<br/><br/>" )
                    .append( "If you have any queries, please do not hesitate to contact me." )
                    .append( "<br/><br/>" )
                    .append( "Thank you for your time and expertise." )
                    .append( "<br/><br/>" )
                    .append( "Kind regards, <br />" )
                    .append( "Rita McCann<br />" )
                    .append( "<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "--<br />" )
                    .append( "Deputy Director<br />" )
                    .append( "Literature Ireland<br />" )
                    .append( "<br/><br/>" )
                    .append( "Trinity Centre for Literary Translation, 36 Fenian Street, Trinity College Dublin, Dublin 2<br />" )
                    .append( "Ireland <br />" )
                    .append( "Tel: +353 1 896 4179" )
                    .append( "</div>" );

            //   System.out.println(bodyText);
            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
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
            if ( attachFiles != null && attachFiles.length > 0 )
            {
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

            // sends the e-mail
            Transport.send( message );

        }
        catch ( MessagingException e )
        {

            throw new RuntimeException( e );
        }
    }

    public static void sendEmailExpertReaderReportSubmit( String expertReaderName, String ReferenceNumber ) throws AddressException, MessagingException
    {

        Properties props = new Properties();
        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        String LIemail = "online@literatureireland.com";
        String Testemail = "markus@rieder.ie";

        try
        {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "  For your information!!! " )
                    .append( ",<br/><br/>" )
                    .append( expertReaderName )
                    .append( " has submitted the review for application no.: " )
                    .append( ReferenceNumber )
                    .append( "<br/><br/>" )
                    .append( "</div>" );

            //   System.out.println(bodyText);
            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( LIemail ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( Testemail ) );
            message.setSubject( "Irish Literature - Expert Reader Submission" );

            // creates message part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent( bodyText.toString(), "text/html" );

            // creates multi-part
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart( messageBodyPart );

//            // adds attachments
//            if (attachFiles != null && attachFiles.length > 0) {
//                for (String filePath : attachFiles) {
//
//                    messageBodyPart = new MimeBodyPart();
//                    DataSource source = new FileDataSource(filePath);
//                    messageBodyPart.setDataHandler(new DataHandler(source));
//                    messageBodyPart.setFileName(filePath);
//
//                    multipart.addBodyPart(messageBodyPart);
//
//                }
//            }
            // sets the multi-part as e-mail's content
            message.setContent( multipart, "text/html; charset=utf-8" );

            //   message.setContent(bodyText.toString(), "text/html; charset=utf-8");
            message.setSentDate( new Date() );

            // sends the e-mail
            Transport.send( message );

        }
        catch ( MessagingException e )
        {

            throw new RuntimeException( e );
        }
    }

    public static void sendEmailExpertReaderInvoiceReceived( String expertReaderName, String ReferenceNumber ) throws AddressException, MessagingException
    {

        Properties props = new Properties();
        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        String LIemail = "online@literatureireland.com";
        String Testemail = "markus@rieder.ie";

        try
        {

            StringBuilder bodyText = new StringBuilder();

            bodyText.append( "<div>" )
                    .append( "  For your information!!! " )
                    .append( ",<br/><br/>" )
                    .append( expertReaderName )
                    .append( " has submitted the invoice for application no.: " )
                    .append( ReferenceNumber )
                    .append( "<br/><br/>" )
                    .append( "</div>" );

            //   System.out.println(bodyText);
            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( LIemail ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( Testemail ) );
            message.setSubject( "Irish Literature - Expert Reader Invoice received" );

            // creates message part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent( bodyText.toString(), "text/html" );

            // creates multi-part
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart( messageBodyPart );

            // sets the multi-part as e-mail's content
            message.setContent( multipart, "text/html; charset=utf-8" );

            //   message.setContent(bodyText.toString(), "text/html; charset=utf-8");
            message.setSentDate( new Date() );

            // sends the e-mail
            Transport.send( message );

        }
        catch ( MessagingException e )
        {

            throw new RuntimeException( e );
        }
    }

    public static void informPublisherAwarded( String Full_Name, String email, String amountRewarded, String ReferenceNumber ) throws AddressException, MessagingException
    {

        Properties props = new Properties();
        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        String LIemail = "online@literatureireland.com";

        try
        {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "  Wohooooo, You're a winner " )
                    .append( Full_Name )
                    .append( " <br/><br/>" )
                    .append( "  Your application " )
                    .append( ReferenceNumber )
                    .append( " for a Translation Grant has been successful! <br/>" )
                    .append( "  <br/><br/>" )
                    .append( " Yippee  <br/>" )
                    .append( "<br/><br/>" )
                    .append( "  We are soooo delighted to inform you that the Amount of  €" )
                    .append( amountRewarded )
                    .append( "  has been awarded <br/>" )
                    .append( "<br/><br/>" )
                    .append( "Kind regards, <br />" )
                    .append( "Rita McCann<br />" )
                    .append( "<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "--<br />" )
                    .append( "Deputy Director<br />" )
                    .append( "Literature Ireland<br />" )
                    .append( "<br/><br/>" )
                    .append( "Trinity Centre for Literary Translation, 36 Fenian Street, Trinity College Dublin, Dublin 2<br />" )
                    .append( "Ireland <br />" )
                    .append( "Tel: +353 1 896 4179" )
                    .append( "</div>" );
            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( "markus@rieder.ie" ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( LIemail ) );
            message.setSubject( "Irish Literature - Your translation grant application" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );
        }
        catch ( MessagingException e )
        {
            throw new RuntimeException( e );
        }
    }

    public static void informPublisherRejected( String Full_Name, String email, String amountRewarded, String ReferenceNumber ) throws AddressException, MessagingException
    {

        Properties props = new Properties();
        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        String LIemail = "online@literatureireland.com";

        try
        {

            StringBuilder bodyText = new StringBuilder();
            bodyText.append( "<div>" )
                    .append( "  Dear " )
                    .append( Full_Name )
                    .append( " <br/><br/>" )
                    .append( "  Unfortunately you're the loser in this round  " )
                    .append( " <br/><br/>" )
                    .append( " No Translation Grant for <br/>" )
                    .append( ReferenceNumber )
                    .append( "  <br/><br/>" )
                    .append( " More Luck next time <br/>" )
                    .append( "<br/><br/>" )
                    .append( "Kind regards, <br />" )
                    .append( "Rita McCann<br />" )
                    .append( "<br/><br/>" )
                    .append( "<br/><br/>" )
                    .append( "--<br />" )
                    .append( "Deputy Director<br />" )
                    .append( "Literature Ireland<br />" )
                    .append( "<br/><br/>" )
                    .append( "Trinity Centre for Literary Translation, 36 Fenian Street, Trinity College Dublin, Dublin 2<br />" )
                    .append( "Ireland <br />" )
                    .append( "Tel: +353 1 896 4179" )
                    .append( "</div>" );
            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( "markus@rieder.ie" ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( LIemail ) );
            message.setSubject( "Irish Literature - Your translation grant application" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );
        }
        catch ( MessagingException e )
        {
            throw new RuntimeException( e );
        }
    }

    public static void newApplicationNotification( String Publisher, String ReferenceNumber, String today ) throws AddressException, MessagingException
    {

        Properties props = new Properties();

        props.put( "mail.smtp.host", "lh30.dnsireland.com" );
        props.put( "mail.smtp.port", "26" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.starttls.enable", "true" );

        Session session = Session.getInstance( props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
            }
        } );

        try
        {

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
            message.setFrom( new InternetAddress( Setup.MAIL_USERNAME ) );
            message.setRecipients( Message.RecipientType.TO,
                    InternetAddress.parse( email ) );
            message.setRecipients( Message.RecipientType.CC, InternetAddress.parse( "markus@rieder.ie" ) );
            message.setSubject( "Irish Literature - New Application" );
            message.setContent( bodyText.toString(), "text/html; charset=utf-8" );
            message.setSentDate( new Date() );
            Transport.send( message );

        }
        catch ( MessagingException e )
        {
            throw new RuntimeException( e );
        }
    }
}
