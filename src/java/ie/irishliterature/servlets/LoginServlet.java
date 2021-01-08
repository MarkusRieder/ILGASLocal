package ie.irishliterature.servlets;

import ie.irishliterature.dao.ACpublisherDAO_test;
import ie.irishliterature.dao.UserDAO;
import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.User;
import ie.irishliterature.service.LoginService;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class LoginServlet -
 * <br>
 * If the User is validated and logon has passed then redirect depending on user
 * function
 * <br><br>
 * The public class LoginServlet implements session control to prevent multiple
 * logins from<br>
 * <ul>
 * <li>different browsers
 * <li>same browser
 * </ul>
 * Depending on the users function it will call the relevant jsp files using
 * Post/Redirect/Get (PRG) Pattern
 * <br><br><br><br>
 * $LastChangedDate:: 2019-09-20 11:35:43 +0100 (Fri, 20 Sep 2019) $:<br>
 * $LastChangedRevision:: 3 $:<br>
 * $Rev:: 3 $:<br>
 *
 * @author Markus Rieder
 *
 */
@WebServlet( name = "login", urlPatterns = { "/login" } )

public class LoginServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger( LoginServlet.class );

    /**
     * Constructor
     */
//    LoginServlet() {
//
//    }
    /**
     * @since JDK 1.4 <br>
     * Instead of using System.err.println() to write error messages to the
     * system console, JDK provides a logging framework in package
     * java.util.logging. The logging API allows you to write different log
     * messages (such as error, informational, and configuration messages) to a
     * central location (such as rotating logs) and configure the format and
     * what level of messages are to be written.
     * <br>
     * To obtain a Logger, use the static factory method Logger.getLogger(String
     * loggerName). This method creates a new Logger or returns the existing
     * Logger of the given loggerName. We typically use the fully-qualified
     * class name (obtained via ClassName.class.getName()) as the logger's name.
     * The logger is declared static as there is typically one logger per class.
     * We can control the output via the so-called Logging Level (in class Level
     * of package java.util.logging). The pre-defined levels in descending order
     * of severity are: SEVERE, WARNING, INFO, CONFIG, FINE, FINER, FINEST.
     */
    /**
     * the serialVersionUID is a unique identifier for Serializable classes.
     *
     */
    private static final long serialVersionUID = 1L;
    /**
     * LoginService checks provided credentials against the database<br>
     * returns
     * <ul>
     * <li> reply[ 0 ] = Boolean.toString( login );
     * <li> reply[ 1 ] = rs.getString( "role" );
     * <li> reply[ 2 ] = rs.getString( "function" );
     * <li> reply[ 3 ] = rs.getString( "first_name" );
     * <li> reply[ 4 ] = rs.getString( "last_name" );
     * <li> reply[ 5 ] = name;
     * <li> reply[ 6 ] = rs.getString( "email" );
     * <li> reply[ 7 ] = rs.getString( "userID" );
     * <li> reply[ 8 ] = Boolean.toString( LogonPassed );
     * </ul>
     */
    private final LoginService service = new LoginService();
//    private static final Map<ActiveUser, HttpSession> usersSessions = new HashMap<ActiveUser, HttpSession>();
    /**
     * gets the initial sessionID
     */
    String initJSessionID = "";
    /**
     * sets the old sessionID
     */
    String oldJSessionID = "";

    /**
     * LoginServlet Init method
     *
     * @param request
     * @param response
     *
     * @throws java.io.IOException
     * @throws ServletException Exception handling
     */
//    @Override
//    public void init() throws ServletException {
//        System.out.println("-----------------------------------------");
//        System.out.println("LoginServlet Init method is called in "
//                + this.getClass().getName());
//        System.out.println("--------------------------------------");
//    }
    
    @Override
    @SuppressWarnings( "unchecked" )
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws IOException, ServletException {
        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
    }

    @Override
    @SuppressWarnings( "unchecked" )
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws IOException, ServletException {

        System.out.println( "\n" + " ############################ LoginServlet 1 #######################################" + "\n" );

        Calendar calendar = Calendar.getInstance(); // Returns instance with current date and time set
        SimpleDateFormat formatter = new SimpleDateFormat( "dd-MM-yyyy HH:mm:ss" );
        System.out.println( formatter.format( calendar.getTime() ) );

        boolean loginStatus = false;

        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );

        System.out.println( "user who wants to login: username:  " + username + " password " + password );

        try {

            loginStatus = service.loginCheck( username, password );
        }
        catch ( NoSuchMethodException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex ) {
            java.util.logging.Logger.getLogger( LoginServlet.class.getName() ).log( Level.SEVERE, null, ex );
        }
        System.out.println( "service.loginCheck: username " + username + " password " + password );
        System.out.println( "service.loginCheck: 1 " + loginStatus );

//        Session shiroSession;// = null;
//        Subject currentUser = SecurityUtils.getSubject();
//
//        shiroSession = currentUser.getSession();
//        System.out.println("Session Id: " + shiroSession.getId());
        /**
         * User validated and logon passed
         * -----------------------------------------------------------------------
         */
        if ( loginStatus ) {

            User user = new User();
            try {
                user = UserDAO.selectUSER( username );
                System.out.println( "LoginServlet user : " + user );
            }
            catch ( DBException ex ) {

//                  Logger.getLogger( LoginServlet.class.getName() ).log( Level.SEVERE, null, ex );
                logger.error( "LoginServlet " + ex );
                System.out.println( "LoginServlet DBException : " + ex );
            }
            
            String ipAddress = request.getHeader( "X-FORWARDED-FOR" );
           
            if ( ipAddress == null ) {
                ipAddress = request.getRemoteAddr();
                System.out.println( "LoginServlet X-FORWARDED-FOR :2 " + ipAddress );
            }else{
                 System.out.println( "LoginServlet X-FORWARDED-FOR :1 " + ipAddress );
            }

            System.out.println( "LoginServlet  user.getUSERNAME()  : " + user.getUSERNAME() );
            System.out.println( "LoginServlet  user.getUSER_ID()   : " + user.getUSER_ID() );
            System.out.println( "LoginServlet  user.getFUNCTION()  : " + user.getFUNCTION() );
            System.out.println( "LoginServlet  user.getFull_NAME() : " + user.getFull_NAME() );

            int userID = Integer.parseInt( user.getUSER_ID() );
            String function = user.getFUNCTION();
            String firstname = user.getFIRST_NAME();
            String lastname = user.getLAST_NAME();
            String name = user.getFull_NAME();
            String email = user.getEMAIL();

            HttpSession session = request.getSession();
            session.setAttribute( "username", username );
            session.setAttribute( "name", name );
            request.setAttribute( "username", username );
            request.setAttribute( "name", name );
            request.setAttribute( "userID", userID );

            //   response.setHeader( "Cache-Control", "no-cache, no-store, must-revalidate" ); // HTTP 1.1.
            //   response.setHeader( "Pragma", "no-cache" ); // HTTP 1.0.
            //   response.setHeader( "Expires", "0" ); // Proxies.
            //int timeout = 5 * 60;  // in seconds - so 5 * 60 = 5 minutes
            int timeout = 60 * 60;  // in seconds - so 60 * 60 = 60 minutes

            /**
             * *** Once The Time Out Is Reached. This Line Will Automatically
             * Refresh The Page ****
             */
            response.setHeader( "Refresh", timeout + "; URL=login.jsp" );

            /**
             * *** Setting The Updated Session Time Out ****
             */
//            session.setMaxInactiveInterval(timeout);
            System.out.println( "LoginServlet  username " + username );

            System.out.println( "Heelllllooooooooooooooooooo" );
            logger.info( "Heelllllooooooooooooooooooo" );

            /**
             * Setting user session
             * --------------------------------------------------------------------
             */
            request.setAttribute( "username", username );

            /**
             * Literature Ireland Staff
             * --------------------------------------------------------------------
             */
            if ( "Literature Ireland Staff".equals( function ) ) {
                System.out.println( "Literature Ireland Staff  " );
                System.out.println( "LoginServlet 1 Staff: username " + username );
                System.out.println( "LoginServlet 1 Staff: name " + name );

                request.setAttribute( "username", username );
                request.setAttribute( "name", name );
                System.out.println( "\n" + " ############################ END LoginServlet 1 Staff  #######################################" + "\n" );
                request.getRequestDispatcher( "/WEB-INF/views/welcome_Staff_1.jsp" ).forward( request, response );

            }
            else {

                /**
                 * User belongs to Publisher
                 * ----------------------------------------------------------------
                 */
                if ( "Publisher".equals( function ) ) {
                    try {

                        /**
                         * get publisherID for userID
                         */
                        int publisherID = findpublisherID( userID );
                        String publisherName = findPublisherName( publisherID );
                        session.setAttribute( "publisherID", publisherID );
                        session.setAttribute( "publisherName", publisherName );
                        request.setAttribute( "publisherName", publisherName );
                        System.out.println( "publisherName:1 " + publisherName );
                         System.out.println( "username:1 " + username );
                        System.out.println( "userID:1 " + userID );

                        /**
                         * if it is a New Publisher show
                         * publisherRegistration_1.jsp
                         * so user can fill in Publishers details
                         */
                        boolean isNew;
                        isNew = ACpublisherDAO_test.isNewPublisher( publisherID );

                        if ( isNew == true ) {

                            /**
                             * if new Publisher go here (Status = "new")
                             * here update Status to complete
                             */
                            System.out.println( "\n" + " ############################ END LoginServlet 1 new publisher  #######################################" + "\n" );
                            request.getRequestDispatcher( "/WEB-INF/views/publisherRegistration.jsp" ).forward( request, response );
                        }
                        else {

                            /**
                             * else redirect to welcome_Publisher.jsp
                             */
                            System.out.println( "User belongs to Publisher: " + publisherID );

                            /**
                             * Session timeout
                             * ----------------------------------------------------------------
                             */
//                            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//                            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
//                            response.setHeader("Expires", "0"); // Proxies.
//                            response.setHeader("Refresh", timeout + "; URL=login.jsp");
//
//                            String message = "Servlet Session has Timed-Out!";
//
//                            request.setAttribute("message", message);
                            request.setAttribute( "publisherName", publisherName );
                            session.setAttribute( "publisherName", publisherName );
//                            request.setAttribute("username", username);
//                            request.setAttribute("name", name);

                            System.out.println( "username:2 " + username );
                            System.out.println( "name:2 " + name );
                            System.out.println( "publisherName:2 " + publisherName );

                            System.out.println( "\n" + " ############################ END LoginServlet 1 existing publisher #######################################" + "\n" );
                            request.getRequestDispatcher( "/WEB-INF/views/welcome_Publisher.jsp" ).forward( request, response );
                        }

                    }
                    catch ( DBException ex ) {
//                        Logger.getLogger( UserDataServlet.class.getName() ).log( Level.SEVERE, null, ex );
                        logger.error( "LoginServlet " + ex );
                    }

                }
                else {
                    /**
                     * Expert Reader
                     * ------------------------------------------------------------
                     */
                    if ( "Expert Reader".equals( function ) ) {
                        request.setAttribute( "userID", userID );
//                        session.setAttribute("userID", userID);
//                        request.getSession().setAttribute("userID", userID);
//                        request.setAttribute("username", username);
//                        session.setAttribute("username", username);
                        System.out.println( "\n" + " ############################ END LoginServlet 1 #######################################" + "\n" );
                        request.getRequestDispatcher( "/WEB-INF/views/welcome_ExpertReader.jsp" ).forward( request, response );

                    }
                    else {
                        System.out.println( "\n" + " ############################ END LoginServlet 1 #######################################" + "\n" );
                        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
                    }
                }
            }
        }
        /**
         * User not validated or logon not passed
         * -----------------------------------------------------------------------
         */
        else {

            System.out.println( "Booooooooooooooooooo" );
            System.out.println( "\n" + " ############################ END LoginServlet 1 #######################################" + "\n" );
            request.setAttribute( "message", "Invalid Credentials!!" );
            request.getRequestDispatcher( "/WEB-INF/views/login_error.jsp" ).forward( request, response );
        }

    }

    public static int findpublisherID( int userID ) throws DBException {

        int publisherID = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        try {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT userID, Company_Number FROM ILGAS.PublisherUserJoined WHERE PublisherUserJoined.userID = ?" );
            ps.setInt( 1, userID );
            res = ps.executeQuery();
            if ( res != null ) {

                if ( res.next() ) {
                    publisherID = res.getInt( "Company_Number" );
                }
            }
            DBConn.close( conn, ps, res );
        }
        catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps, res );
            e.printStackTrace();
            throw new DBException( "2 Excepion while accessing database" );
        }

        return publisherID;
    }

    public static String findPublisherName( int Company_Number ) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int publisherID = Company_Number;
        String publisherName = "";

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT Company FROM ILGAS.international_publishers WHERE international_publishers.Company_Number = ?" );
            ps.setInt( 1, publisherID );
            res = ps.executeQuery();
            if ( res != null ) {
                if ( res.next() ) {
                    publisherName = res.getString( "Company" );

                }
            }
            DBConn.close( conn, ps, res );
        }
        catch ( ClassNotFoundException | SQLException e ) {
            DBConn.close( conn, ps, res );
            e.printStackTrace();
            throw new DBException( "2 Excepion while accessing database" );
        }

        return publisherName;
    }

}
