package ie.irishliterature.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import ie.irishliterature.dao.ACpublisherDAO_test;
import ie.irishliterature.dao.ApplicationDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Publisher;
import ie.irishliterature.model.Status;
import ie.irishliterature.model.User;
import ie.irishliterature.util.BCrypt;
import ie.irishliterature.util.GlobalConstants;
import ie.irishliterature.util.MailUtil;
import ie.irishliterature.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
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
@WebServlet( name = "RegisterServlet", urlPatterns
        = {
            "/RegisterServlet"
        } )
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // private LoginService userValidationService = new LoginService();
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws IOException, ServletException {
        request.getRequestDispatcher( "/WEB-INF/views/signUp.jsp" ).forward( request, response );
    }

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
    @Override
    @SuppressWarnings( "unchecked" )
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        response.setContentType( "text/html;charset=UTF-8" );

        boolean newPublisher = false;

        // collect all input values
        //  PrintWriter out = response.getWriter();
        // values for user table
        String username = request.getParameter( "uname" );
        String firstname = request.getParameter( "firstname" );
        String lastname = request.getParameter( "lastname" );
        String password = request.getParameter( "password" );
        String email = request.getParameter( "email" );
        String function = request.getParameter( "function" );
        String role = request.getParameter( "role" );

        int PublisherID = 0;


        /*
         * values for new publisher
         */
        String company = request.getParameter( "company" );
        String companyNumber = request.getParameter( "companyNumber" );
//        String newPublisher = request.getParameter("newPublisher");
//        String cbnewPublisher = request.getParameter("cbnewPublisher");

//        if (!"".equals(companyNumber)) {
//            PublisherID = Integer.parseInt(request.getParameter("companyNumber"));
//        }
//        
        int userID = 0;

        try {
            PublisherID = Integer.parseInt( ACpublisherDAO_test.ifPublisherExists( company ) );
            if ( PublisherID == 0 ) {
                System.out.println( "Publisher " + company + " not found" );
                newPublisher = true;
            }
            else {
                System.out.println( "PublisherID  " + PublisherID );
            }
        }
        catch ( DBException ex ) {
            Logger.getLogger( RegisterServlet.class.getName() ).log( Level.SEVERE, null, ex );
        }

        System.out.println( "username  " + username );
        System.out.println( "company  " + company );
        System.out.println( "companyNumber  " + companyNumber );
        System.out.println( "newPublisher  " + newPublisher );
//        System.out.println("cbnewPublisher:::  " + cbnewPublisher);

//        request.setAttribute("newPublisher", request.getParameter("newPublisher"));

        /*
         * if newPublisher checkbox is checked
         */
        if ( newPublisher ) {
            try {
                System.out.println( "cbnewPublisher  IS here" );

                String cmpny = company;

                System.out.println( "cmpny::  " + company );

                /*
                 * double check if Publisher exists
                 */
                PublisherID = Integer.parseInt( ACpublisherDAO_test.ifPublisherExists( cmpny ) );

                if ( PublisherID == 0 ) {
                    System.out.println( "newPublisher does not exist - create new one" );

                    /*
                     * create Publisher if account does not exists
                     */
                    Publisher publisher = new Publisher();

                    publisher.setCompany( company );
                    publisher.setStatus( "new" );

                    PublisherID = ACpublisherDAO_test.insertRudimentaryPublisher( publisher );

                    System.out.println( "PublisherID:: 1 " + PublisherID );

                }
            }
            catch ( DBException ex ) {
                Logger.getLogger( RegisterServlet.class.getName() ).log( Level.SEVERE, null, ex );
            }
        }

        System.out.println( "PublisherID:: 2 " + PublisherID );

        request.setAttribute( "uname", request.getParameter( "uname" ) );
        request.setAttribute( "firstname", request.getParameter( "firstname" ) );
        request.setAttribute( "lastname", request.getParameter( "lastname" ) );
        request.setAttribute( "email", request.getParameter( "email" ) );
        request.setAttribute( "PublisherID", PublisherID );

        Status sp = new Status();
        String output = "";
        if ( !validate( username, firstname, lastname, password, email ) ) {
            sp.setCode( -1 );
            sp.setMessage( "Invalid Input" );
            output = Utils.toJson( sp );
        }
        else {
            User user = new User();
            String fullName = firstname + " " + lastname;
            user.setUSERNAME( username );
            user.setFIRST_NAME( firstname );
            user.setLAST_NAME( lastname );
            user.setFull_NAME( fullName );

            /*
             * generate hash for password
             */
            user.setPASSWORD( BCrypt.hashpw( password, GlobalConstants.SALT ) );

            user.setEMAIL( email );

            /*
             * generate hash code for email verification
             */
            String hash = Utils.prepareRandomString( 30 );

            /*
             * generate hash for password
             */
            user.setEMAIL_VERIFICATION_HASH( BCrypt.hashpw( hash, GlobalConstants.SALT ) );

            if ( role
                    == null ) {
                role = "not assigned";
            }

            user.setROLE( role );

            user.setFUNCTION( function );

            
               System.out.println( "username:: 1 " + username );
               System.out.println( "firstname:: 1 " + firstname );
               System.out.println( "lastname:: 1 " + lastname );
               System.out.println( "email:: 1 " + email );
              System.out.println( "fullName:: 1 " + fullName );
             
             
             
            try {

                /*
                 * check whether email exists or not
                 */
                if ( !ApplicationDAO.isEmailExists( username ) ) {

                    System.out.println( "isEmailExists Not:: " );

                    /*
                     * create account if email not exists
                     */
                    userID = ApplicationDAO.insertRow( user );
                    System.out.println( "userID:: " + userID );

                    System.out.println( "PublisherID:: " + PublisherID );

                    /*
                     * here we insert userID and PublisherID into PublisherUser
                     * joined table
                     */
                    int result = ACpublisherDAO_test.insertPublisherUserJoined( userID, PublisherID );
                    System.out.println( "insertPublisherUserJoined:  " + result );

                    /*
                     * send verification email
                     */
                    System.out.println( "RegisterServlet sendEmailRegistrationLink" );
                    System.out.println( "uname " + username + " fullname " + fullName + " email " + email );
                    MailUtil.sendEmailRegistrationLink( username, fullName, email, hash );
                    System.out.println( "/RegisterServlet: sendEmailRegistrationLink username " + username + " fullName " + fullName );
                    sp.setCode( 0 );
                    sp.setMessage( "Registation Link Was Sent To Your Mail Successfully. Please Verify Your Email" );
                    output = Utils.toJson( sp );
                }
                else {
                    /*
                     * tell user that the email already in use
                     */
                    sp.setCode( -1 );
                    sp.setMessage( "This Email is already registered" );
                    output = Utils.toJson( sp );
                }

            }
            catch ( DBException | MessagingException e ) {
                sp.setCode( -1 );
                sp.setMessage( e.getMessage() );
                output = Utils.toJson( sp );
            }

        }

//        username = request.getParameter( "username" );
        System.out.println( "RegisterServlet usernameDEF  " + username );
        System.out.println( "\n" + " ############################ RegisterServlet servlet  #######################################" + "\n" );
        System.out.println( "RegisterServlet called" );

        HttpSession session = request.getSession();

        ServletContext context = request.getSession().getServletContext();
        System.out.println( "Iterate keys  AAAAAAA " );
        Enumeration keys = request.getSession().getServletContext().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
//                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            }
        }

        System.out.println( "RegisterServlet username1  " + username );

        System.out.println( "Iterate Parameters" );

        Set<String> loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "RegisterServlet doGet loggedInUsers: 1 " + loggedInUsers );

        System.out.println( "RegisterServlet loggedInUsers.remove( username )  " + username );
        loggedInUsers.remove( username );
//        username = request.getParameter( "username" );
        System.out.println( "RegisterServlet username  " + username );

//        ServletContext context = request.getSession().getServletContext();
        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "RegisterServlet doGet loggedInUsers: 2 " + loggedInUsers );
        System.out.println( "RegisterServlet session.invalidate() 1" );
        session.invalidate();

//        session.setAttribute( "username", username );
//        request.setAttribute( "username", username );
        if ( request.isRequestedSessionIdValid() && session != null ) {
            System.out.println( "RegisterServlet session.invalidate() 2" );
            session.invalidate();

        }
        else {
            System.out.println( "RegisterServlet  NOT session.invalidate()" );
        }

        System.out.println( "\n" + "Should be empty!!!" + "\n" );
        System.out.println( "Enumeration keys  A " );
        keys = request.getSession().getServletContext().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
            }
        }

        System.out.println( "\n" + " ############################ END RegisterServlet  #######################################" + "\n" );
        System.out.println( "RegisterServlet username END Logout servlet  " + username );
        request.getSession().setAttribute( GlobalConstants.USER, null );
//        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
//        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher( "/WEB-INF/views/registrationSuccess.jsp" ).forward( request, response );

        try (
                /*
                 * send output to user
                 */
                PrintWriter pw = response.getWriter() ) {
            pw.write( output );
            pw.flush();
        }
    }

    public static boolean validate( String username, String firstName, String lastName, String password, String email ) {
        if ( username == null ) {
            return false;
        }
        if ( firstName == null ) {
            return false;
        }
        if ( lastName == null ) {
            return false;
        }
        if ( password == null ) {
            return false;
        }
        if ( email == null ) {
            return false;
        }
        return true;
    }
}
