package ie.irishliterature.servlets;

import ie.irishliterature.dao.ACpublisherDAO_test;
import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import ie.irishliterature.listener.ActiveUser;
import ie.irishliterature.service.LoginService;
import ie.irishliterature.util.BCrypt;
import ie.irishliterature.util.GlobalConstants;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Set;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
     * @throws ServletException Exception handling
     */
    @Override
    public void init() throws ServletException {
        System.out.println( "-----------------------------------------" );
        System.out.println( "LoginServlet Init method is called in "
                + this.getClass().getName() );
        System.out.println( "--------------------------------------" );
    }

    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws IOException, ServletException {
        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
    }

    @Override
    @SuppressWarnings( "unchecked" )
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws IOException, ServletException {

        HttpSession session = request.getSession();
        boolean loginStatus;

        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );

        System.out.println( "username:  " + username + " password " + password );

        System.out.println( "Init session id: " + session.getId() );
        initJSessionID = session.getId();

        if ( session == null ) {
            System.out.println( "-- LoginServlet creating new session in the servlet --" );
            session = request.getSession( true );
            System.out.println( "New session id: " + session.getId() );
            initJSessionID = session.getId();
        }
        else {
            System.out.println( "Old session id:  " + session.getId() );
            oldJSessionID = session.getId();
        }

        System.out.println( "\n  *****************************************************************************  \n" );
        System.out.println( "user who wants to login: " + username );

        Set<String> loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "LoginServlet already loggedInUsers :1 " + loggedInUsers );

        System.out.println( "LoginServlet check if loggedInUsers contains( ' + username + '  )" + loggedInUsers.contains( username ) );
        System.out.println( " LoginServlet session.getAttribute userData  1: " + session.getAttribute( "userData" ) );
        /**
         * check if user is already logged in - username in Set String
         * loggedInUsers
         */
        if ( loggedInUsers.contains( username ) ) {
            request.setAttribute( "errorMessage", "You are already logged in!!" );
            request.getRequestDispatcher( "/WEB-INF/views/userloggedin.jsp" ).forward( request, response );
            /**
             * @return "errorMessage", "You are already logged in!!" and forward
             * to userloggedin.jsp
             */
            return;

        }

        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "LoginServlet loggedInUsers :2 " + loggedInUsers );

        System.out.println( "\n" + " ############################ LoginServlet 1 #######################################" + "\n" );

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + session.getValue( key ) );
        }

        System.out.println( "\n" + " ############################ END LoginServlet 1 #######################################" + "\n" );

        password = BCrypt.hashpw( request.getParameter( "password" ), GlobalConstants.SALT );
        System.out.println( "password: 2 " + password );

        String[] replied = service.loginCheck( username, password );

        boolean isValidUser = Boolean.parseBoolean( replied[0] );
        boolean LogonPassed = Boolean.parseBoolean( replied[8] );

        /**
         * User validated and logon passed
         */
        if ( isValidUser && LogonPassed ) {

            loginStatus = true;
            session = request.getSession();

            String status = ( String ) session.getAttribute( "status" );

            System.out.println( "isValidUser && LogonPassed:: status: " + status );

            /**
             * if status is not null AND the user is already loggedin in the
             * same
             * session
             */
            if ( status != null && status.equals( "loggedin" ) ) {

                System.out.println( "Only ONE session allowed!! " );
                request.setAttribute( "errorMessage", "Only ONE session allowed!!" );
                request.getRequestDispatcher( "/WEB-INF/views/userloggedin.jsp" ).forward( request, response );
            }
            else {
                if ( loginStatus ) {

                    /**
                     * ActiveUser needed to invoke ActiveUser /
                     * HttpSessionBindingListener /
                     * valueBound( HttpSessionBindingEvent event )
                     */
                    ActiveUser userData = null;

                    if ( session.getAttribute( "userData" ) != null ) {

                        userData = ( ActiveUser ) session.getAttribute( "userData" );
                        System.out.println( " LoginServlet userData: " + userData );
                    }
                    /**
                     * check if this is the first logon in this session userData
                     * == null
                     */
                    if ( userData == null ) {
                        System.out.println( " LoginServlet   if ( userData == null ) " );
                        userData = new ActiveUser();
                        userData.setUserName( username );
                        session.setAttribute( "userData", userData );
                        request.setAttribute( "username", username );
                    }
                    else {
                        System.out.println( " LoginServlet   if ( userData == null ) else " );
                        userData.setUserName( username );
                        session.setAttribute( "userData", userData );
                        request.setAttribute( "username", username );
                    }
                    session.setAttribute( "status", "loggedin" );

                    String role = replied[1];
                    String function = replied[2];
                    String firstname = replied[3];
                    String lastname = replied[4];
                    String name = replied[5];
                    String email = replied[6];
                    int userID = Integer.parseInt( replied[7] );

                    request.setAttribute( "username", username );
                    request.setAttribute( "password", password );
                    request.setAttribute( "firstname", firstname );
                    request.setAttribute( "lastname", lastname );
                    request.setAttribute( "name", name );
                    request.setAttribute( "email", email );
                    request.setAttribute( "userID", userID );

                    System.out.println( "reply " + Arrays.toString( replied ) );

                    System.out.println( "Heelllllooooooooooooooooooo" );
                    System.out.println( "role: " + role );
                    System.out.println( "function: " + function );
                    System.out.println( "full name: " + name );

                    // Setting user session
                    session.setAttribute( "username", username );
                    session.setAttribute( "firstname", firstname );
                    session.setAttribute( "lastname", lastname );
                    session.setAttribute( "name", name );
                    session.setAttribute( "email", email );
                    session.setAttribute( "userID", userID );

                    // set full name
                    request.setAttribute( "name", name );

                    System.out.println( "\n" + " ############################ LoginServlet 2 #######################################" + "\n" );

                    System.out.println( "Iterate Parameters" );

                    Enumeration en = request.getParameterNames();

                    while ( en.hasMoreElements() ) {
                        Object objOri = en.nextElement();

                        String param = ( String ) objOri;

                        String value = request.getParameter( param );

                        System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

                    }

                    keys = session.getAttributeNames();
                    while ( keys.hasMoreElements() ) {
                        String key = ( String ) keys.nextElement();
                        System.out.println( "key  :" + key + ": " + session.getValue( key ) );
                    }

                    System.out.println( "\n" + " ############################ END LoginServlet 2 #######################################" + "\n" );

                    if ( "Literature Ireland Staff".equals( function ) ) {
                        System.out.println( "Literature Ireland Staff  " );

                        // Setting user session
                        session.setAttribute( "username", username );
                        session.setAttribute( "firstname", firstname );
                        session.setAttribute( "lastname", lastname );
                        session.setAttribute( "name", name );
                        session.setAttribute( "email", email );
                        session.setAttribute( "userID", userID );
                        request.setAttribute( "username", username );
                        request.setAttribute( "name", name );
                        request.getRequestDispatcher( "/WEB-INF/views/welcome_Staff_1.jsp" ).forward( request, response );

//                        response.sendRedirect( "welcome_Staff_1.jsp" );
                    }
                    else {

                        /**
                         * User belongs to Publisher
                         */
                        if ( "Publisher".equals( function ) ) {
                            try {

                                /**
                                 * get publisherID for userID
                                 */
                                int publisherID = findpublisherID( userID );
                                String publisherName = findPublisherName( publisherID );

                                session.setAttribute( "publisherID", publisherID );
                                session.setAttribute( "Company_Number", publisherID );
                                session.setAttribute( "publisherName", publisherName );
                                session.setAttribute( "name", name );

                                publisherID = ( int ) session.getAttribute( "publisherID" );

                                request.getSession().setAttribute( "publisherName", publisherName );
                                request.setAttribute( "publisherName", publisherName );
                                request.setAttribute( "name", name );

                                /**
                                 * if it is a New Publisher show
                                 * publisherRegistration_1.jsp
                                 * so user can fill in Publishers details
                                 */
                                boolean isNew = false;
                                isNew = ACpublisherDAO_test.isNewPublisher( publisherID );

                                if ( isNew == true ) {

                                    /**
                                     * if new Publisher go here (Status = "new")
                                     * here update Status to complete
                                     */
//                                    response.sendRedirect( "PublisherRegistration" );
                                    request.getRequestDispatcher( "/WEB-INF/views/publisherRegistration.jsp" ).forward( request, response );
                                }
                                else {
                                    /**
                                     * else redirect to welcome_Publisher.jsp
                                     */
                                    session.setAttribute( "publisherID", publisherID );
                                    session.setAttribute( "name", name );
                                    request.setAttribute( "name", name );
                                    request.setAttribute( "publisherName", publisherName );
                                    request.setAttribute( "name", name );

//                                    response.sendRedirect( "welcome_Publisher" );
                                    request.getRequestDispatcher( "/WEB-INF/views/welcome_Publisher.jsp" ).forward( request, response );
                                }

                            }
                            catch ( DBException ex ) {
                                java.util.logging.Logger.getLogger( LoginServlet.class.getName() ).log( Level.SEVERE, null, ex );
                            }

                        }
                        else {
                            /**
                             * If Expert Reade redirect to
                             * welcome_ExpertReader.jsp
                             */
                            if ( "Expert Reader".equals( function ) ) {
                                request.setAttribute( "userID", userID );
                                session.setAttribute( "userID", userID );
                                request.getSession().setAttribute( "userID", userID );

//                                response.sendRedirect( "welcome_ExpertReader" );
                                request.getRequestDispatcher( "/WEB-INF/views/welcome_ExpertReader.jsp" ).forward( request, response );

                            }
                            else {
                                request.getRequestDispatcher( "/WEB-INF/views/welcome.jsp" ).forward( request, response );
                            }
                        }
                    }
                }
            }
        }
        /**
         * User not validated or logon not passed
         */
        else {

            //System.out.println( "Booooooooooooooooooo" );
            request.setAttribute( "errorMessage", "Invalid Credentials!!" );
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
