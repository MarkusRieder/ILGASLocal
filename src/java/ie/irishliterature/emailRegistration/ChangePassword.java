package ie.irishliterature.emailRegistration;

import ie.irishliterature.dao.ApplicationDAO;
import ie.irishliterature.dao.UserDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Status;
import ie.irishliterature.util.BCrypt;
import ie.irishliterature.util.GlobalConstants;
import ie.irishliterature.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet( name = "ChangePassword", urlPatterns
        = {
            "/ChangePassword"
        } )
public class ChangePassword extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger( ChangePassword.class.getName() );

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        Integer userId = ( Integer ) request.getSession().getAttribute( GlobalConstants.USER );
        if ( userId != null ) {

            System.out.println( "ChangePassword: doGet " + userId );

            request.getRequestDispatcher( "/WEB-INF/changePassword.html" ).forward( request, response );
        }
        else {
            String message = "Clic <a href=\"index.jsp\">here</a> to login";
            request.setAttribute( GlobalConstants.MESSAGE, message );
            request.getRequestDispatcher( "/messageToUser.jsp" ).forward( request, response );
        }
    }

    /**
     * @param request
     * @param response
     *
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        String inputCurrentPassword = null;

        response.setContentType( "text/html;charset=UTF-8" );

        System.out.println( "ChangePassword here we are now" );

        System.out.println( "############################### /ChangePassword ####################################" );

        HttpSession session = request.getSession();

        System.out.println( "ChangePassword  Iterate Parameters" );
        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() ) {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );

            System.out.println( "ChangePassword  Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "ChangePassword Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "ChangePassword key  :" + key + ": " + session.getValue( key ) );

        }

        System.out.println( "###################################################################" );

        if ( request.getParameter( "inputCurrentPassword" ) != null ) {
            inputCurrentPassword = BCrypt.hashpw( request.getParameter( "inputCurrentPassword" ), GlobalConstants.SALT );
        }

        String inputPassword = request.getParameter( "inputPassword" );

        System.out.println( "ChangePassword: doPost inputPassword  " + inputPassword );

        if ( request.getParameter( "inputPassword" ) != null ) {
            inputPassword = BCrypt.hashpw( request.getParameter( "inputPassword" ), GlobalConstants.SALT );
        }

//        String userId = ( String ) request.getSession().getAttribute( GlobalConstants.USER );
        String inputEmail = request.getParameter( "inputEmail" );
        String userName = request.getParameter( "userId" );

        String userId = "";

        try {

            userId = UserDAO.getUserIdByName( userName );
            inputEmail = UserDAO.getUserEmailByUserId( userId );

        }
        catch ( DBException ex ) {
            java.util.logging.Logger.getLogger( ChangePassword.class.getName() ).log( Level.SEVERE, null, ex );
        }

        System.out.println( "ChangePassword: doPost inputEmail  " + inputEmail + "  userId : " + userId + "  userName : " + userName );

        String isResetPasswordVerified = ( String ) request.getSession().getAttribute( GlobalConstants.IS_RESET_PASSWORD_VERIFIED );

        System.out.println( "there there" );

        System.out.println( "ChangePassword: userId " + userId + " inputPassword  " + inputPassword + " isResetPasswordVerified " + isResetPasswordVerified );

        System.out.println( "ChangePassword  inputCurrentPassword " + inputCurrentPassword + " isResetPasswordVerified  " + isResetPasswordVerified );

        Status sp = new Status();

        try {

            /*
             * Change password
             */
            if ( userId != null && inputCurrentPassword != null ) {
                if ( ApplicationDAO.verifyUserIdAndPassword( userId, inputCurrentPassword ) ) {
                    ApplicationDAO.updatePassword( userId, inputPassword );
                    sp.setCode( 0 );
                    sp.setMessage( "Password changed successfully" );
                    request.setAttribute( "message", "Password changed successfully" );
                }
                else {
                    sp.setCode( -1 );
                    sp.setMessage( "Current password didn't match" );
                    request.setAttribute( "message", "Current password didn't match" );
                }
            }
            /*
             * Forgotten password
             */
            else if ( userId != null && inputPassword != null ) {
                System.out.println( "ChangePassword: 123 userId " + userId + " inputPassword  " + inputPassword + " isResetPasswordVerified  " + isResetPasswordVerified );
                ApplicationDAO.updatePasswordbyId( userId, inputPassword );
                sp.setCode( 0 );
                sp.setMessage( "Password changed successfully" );
                request.setAttribute( "message", "Your password has been changed successfully! <br/> Please sign in with your updated credentials" );
                request.getRequestDispatcher( "/WEB-INF/views/forgottenPasswordChangeResponseAndLogin.jsp" ).forward( request, response );
            }
            else {
                sp.setCode( -1 );
                sp.setMessage( "Invalid input" );
                request.setAttribute( "message", "Invalid input" );
                request.getRequestDispatcher( "/WEB-INF/views/forgottenPasswordChangeResponseError.jsp" ).forward( request, response );
            }
        }
        catch ( DBException e ) {
            LOGGER.debug( e.getMessage() );
            sp.setCode( -1 );
            sp.setMessage( e.getMessage() );
        }
        try ( PrintWriter pw = response.getWriter() ) {
            pw.write( Utils.toJson( sp ) );
            pw.flush();
        }
    }

}
