/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import ie.irishliterature.util.Setup;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author markus
 */
@WebServlet( name = "SendEmail", urlPatterns =
{
    "/SendEmail"
} )
public class SendEmail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
        response.setContentType( "text/html;charset=UTF-8" );

        try ( PrintWriter out = response.getWriter() )
        {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println( "<!DOCTYPE html>" );
            out.println( "<html>" );
            out.println( "<head>" );
            out.println( "<title>Servlet emailWithHTMLTemplate</title>" );
            out.println( "</head>" );
            out.println( "<body>" );
            out.println( "<h1>Servlet emailWithHTMLTemplate at " + request.getContextPath() + "</h1>" );
            out.println( "</body>" );
            out.println( "</html>" );
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
        processRequest( request, response );
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
        HttpSession httpSession = request.getSession();
        System.out.println( "############################### /emailWithHTMLTemplate ####################################" );
        System.out.println( "Enumeration keys   " );
        Enumeration keys = httpSession.getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + httpSession.getValue( key ) );

        }
        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() )
        {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );

            System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "###################################################################" );

        String selectedTemplate = request.getParameter( "emailTemplateSelected" );

        try
        {

            //Email data 
//            String Email_Id = "markus@rieder.ie";        //change to your email ID
//            String password = "Or10Nn3bu7a";                 //change to your password
            String recipient_mail_id = "markus@rieder.ie";   //change to recipient email id
            String mail_subject = "This is a test mail From Java";

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
                input.put( "Author", "java2db.com" );
                input.put( "Topic", "HTML Template for Email" );
                input.put( "Content In", "English" );

                //HTML mail content
                String htmlText = readEmailFromHtml( selectedTemplate, input );
                messageBodyPart.setContent( htmlText, "text/html" );

                multipart.addBodyPart( messageBodyPart );
                message.setContent( multipart );

                //Conect to smtp server and send Email
                Transport transport = session.getTransport( "smtp" );
                transport.connect( Setup.MAIL_SMTP_HOST, Setup.MAIL_USERNAME, Setup.MAIL_PASSWORD );
                transport.sendMessage( message, message.getAllRecipients() );
                transport.close();
                System.out.println( "Mail sent successfully..." );

            } catch ( MessagingException ex )
            {
                Logger.getLogger( SendEmail.class.getName() ).log( Level.SEVERE, null, ex );
            } catch ( Exception ae )
            {
                ae.printStackTrace();
            }
        } catch ( Exception exception )
        {
            exception.printStackTrace();
        }
    }

    //Method to replace the values for keys
    protected String readEmailFromHtml( String filePath, Map<String, String> input )
    {
        String msg = readContentFromFile( filePath );
        try
        {
            Set<Map.Entry<String, String>> entries = input.entrySet();
            for ( Map.Entry<String, String> entry : entries )
            {
                msg = msg.replace( entry.getKey().trim(), entry.getValue().trim() );
            }
        } catch ( Exception exception )
        {
            exception.printStackTrace();
        }
        return msg;
    }

//Method to read HTML file as a String 
    private String readContentFromFile( String fileName )
    {
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
            } finally
            {
                reader.close();
            }
        } catch ( IOException ex )
        {
            ex.printStackTrace();
        }
        return contents.toString();

    }

//Output
//Mail sent successfully...
}
