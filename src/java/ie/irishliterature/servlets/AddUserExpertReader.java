package ie.irishliterature.servlets;

import ie.irishliterature.dao.ApplicationDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Status;
import ie.irishliterature.model.User;
import ie.irishliterature.util.BCrypt;
import ie.irishliterature.util.GlobalConstants;
import ie.irishliterature.util.MailUtil;
import ie.irishliterature.util.Utils;
import java.io.IOException;
import java.util.Random;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author markus
 */
@WebServlet( name = "AddUserExpertReader", urlPatterns
        = {
            "/AddUserExpertReader"
        } )
public class AddUserExpertReader extends HttpServlet {

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
            throws ServletException, IOException {
//        processRequest( request, response );
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
            throws ServletException, IOException {

        String username = request.getParameter( "uname" );
        String firstname = request.getParameter( "firstname" );
        String lastname = request.getParameter( "lastname" );     
        String email = request.getParameter( "email" );
        String function = "Expert Reader";
        String role = "";
        String password =  "";
        int userID = 0;

        String fullname = firstname + " " + lastname;

        Random r = new Random();
        String randomNumber = "";
        for ( int i = 0; i < 3; i++ ) {
            randomNumber += r.nextInt( 10 );
        }
        int randomNumberInt = Integer.parseInt( randomNumber );

        System.out.println( "AddUserExpertReader doPost::randomNumberInt " + randomNumberInt );

        password = firstname + lastname + randomNumberInt;

        System.out.println( "AddUserExpertReader doPost::username " + username );
        System.out.println( "AddUserExpertReader doPost::firstname " + firstname );
        System.out.println( "AddUserExpertReader doPost::lastname " + lastname );
        System.out.println( "AddUserExpertReader doPost::password " + password );
        System.out.println( "AddUserExpertReader doPost::email " + email );
        System.out.println( "AddUserExpertReader doPost::function " + function );
        System.out.println( "AddUserExpertReader doPost::fullname " + fullname );

        Status sp = new Status();
        String output = "";
        String message = "";

        User user = new User();
        user.setUSERNAME( username );
        user.setFIRST_NAME( firstname );
        user.setLAST_NAME( lastname );
        user.setFull_NAME( fullname );

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

        try {

            /*
             * check whether email exists or not
             */
            if ( !ApplicationDAO.isEmailExists( email ) ) {

                System.out.println( "isEmailExists Not:: " );

                /*
                 * create account if email not exists
                 */
                userID = ApplicationDAO.insertRow( user );
                System.out.println( "userID:: " + userID );


                /*
                 * send verification email
                 */
                MailUtil.sendEmailRegistrationLinkExpertReader( username, fullname, password, email, hash );

                message = "Expert Reader <strong>" + fullname + "</strong> has been created  <br/><br/>and email has been sent";
            }
            else {
                /*
                 * tell user that the email already in use
                 */

                message = "This Email is already registered - try again";
            }

//ENSURE signup is validated
        }
        catch ( DBException | MessagingException e ) {
            sp.setCode( -1 );
            sp.setMessage( e.getMessage() );
            output = Utils.toJson( sp );
        }

        request.setAttribute( "message", message );
        request.getRequestDispatcher( "/WEB-INF/views/AddExpertReaderregistrationMessage.jsp" ).forward( request, response );
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
