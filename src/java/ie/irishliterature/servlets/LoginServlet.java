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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet( name = "login", urlPatterns =
{
    "/login"
} )
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final LoginService service = new LoginService();

    String initJSessionID = "";

    public void init() throws ServletException
    {
        System.out.println( "-----------------------------------------" );
        System.out.println( "LoginServlet Init method is called in "
                + this.getClass().getName() );
        System.out.println( "--------------------------------------" );
    }

//     private LoginService userValidationService = new LoginService();
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws IOException, ServletException
    {
        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
    }

    @Override
    @SuppressWarnings( "unchecked" )
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws IOException, ServletException
    {

        HttpSession session = request.getSession( false );

        if ( session == null )
        {
            System.out.println( "-- LoginServlet creating new session in the servlet --" );
            session = request.getSession( true );
            System.out.println( "New session id: " + session.getId() );
            initJSessionID = session.getId();
            System.out.println( "-- LoginServlet session created in the servlet --" );
        }

        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );

//        ActiveUser user = userDAO.find(username, password);
//        if (user != null) {
//            request.getSession().setAttribute("user", user);
//        } else {
//            // Show error.
//            System.out.println("Booooooooooooooooooo");
//            request.setAttribute("errorMessage", "already logged in!!");
//            request.getRequestDispatcher("/WEB-INF/views/userloggedin.jsp").forward(request, response);
//            return;
//        }
        ActiveUser userData = ( ActiveUser ) session.getAttribute( "logins" );
        Set<ActiveUser> logins = ( Set<ActiveUser> ) getServletContext().getAttribute( "logins" );
        System.out.println( "\n" + " LoginServlet logins 1 : " + logins.toString() + "  \n" );

        if ( userData == null )
        {

            System.out.println( "LoginServlet ActiveUser userData == null" );

            userData = new ActiveUser();
            userData.setUserName( username );
            session.setAttribute( "logins", userData );
            System.out.println( "LoginServlet ActiveUser userData  " + userData.getUserName() + " added" );

        } else
        {
            System.out.println( "userData NOT null session id: " + session.getId() );
            System.out.println( "LoginServlet ActiveUser userData NOT null" );
            System.out.println( "LoginServlet ActiveUser userData check if userData.toString().contains(username)  " + username );

            if ( logins.toString().contains( username ) )
            {
                System.out.println( "LoginServlet logins 2 : " + logins.toString() );
                System.out.println( "LoginServlet ActiveUser userData.toString().contains(username) CONTAINS " + username );
                System.out.println( "LoginServlet userData: " + username + "  already logged in" );
                System.out.println( "Booooooooooooooooooo" );
                request.setAttribute( "errorMessage", "already logged in!!" );
                request.getRequestDispatcher( "/WEB-INF/views/userloggedin.jsp" ).forward( request, response );
                return;

            } else
            {

                userData = new ActiveUser();
                userData.setUserName( username );
                session.setAttribute( "logins", userData );
                System.out.println( "LoginServlet ActiveUser userData  " + userData.getUserName() + " added" );
                System.out.println( "LoginServlet ActiveUser userData.toString().contains(username) does not CONTAIN " + username );
                System.out.println( "LoginServlet userData : " + userData );
            }
        }

//        Set<ActiveUser> logins = (Set<ActiveUser>) getServletContext().getAttribute("logins");
//        System.out.println("LoginServlet logins 1 : " + logins.toString());
        if ( logins != null )
        {
            System.out.println( "LoginServlet logins size: " + logins.size() );
            System.out.println( "LoginServlet logins 3 : " + logins.toString() );
//            if (logins.toString().contains(username)) {
//                System.out.println("LoginServlet username: " + username + "  already logged in");
//            } else {
//                session.setAttribute("logins", userData);
//                logins.add(userData);
//                System.out.println("LoginServlet username: " + username + "  added");
//            }

//            for (Object object : logins) {
//                String element = (String) object;
//                System.out.println("LoginServlet element logins " + element);
//            }
        } else
        {
            System.out.println( "LoginServlet logins null" );
        }

        if ( userData != null )
        {
            System.out.println( "LoginServlet userData 3 : " + userData.toString() );
//            if (logins.toString().contains(username)) {
//                System.out.println("LoginServlet username: " + username + "  already logged in");
//            } else {
//                session.setAttribute("logins", userData);
//                logins.add(userData);
//                System.out.println("LoginServlet username: " + username + "  added");
//            }

//            for (Object object : logins) {
//                String element = (String) object;
//                System.out.println("LoginServlet element logins " + element);
//            }
        } else
        {
            System.out.println( "LoginServlet userData null" );
        }

        System.out.println( "\n" + " ############################ LoginServlet 1 #######################################" + "\n" );

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
//            if ("username".equals(username)) {
            System.out.println( "key  :" + key + ": " + session.getValue( key ) );
//            }
        }

        System.out.println( "\n" + " ############################ END LoginServlet 1 #######################################" + "\n" );

        password = BCrypt.hashpw( request.getParameter( "password" ), GlobalConstants.SALT );
        System.out.println( "password: 2 " + password );

        String[] replied = service.loginCheck( username, password );

        boolean isValidUser = Boolean.parseBoolean( replied[ 0 ] );
        boolean LogonPassed = Boolean.parseBoolean( replied[ 8 ] );

        if ( isValidUser && LogonPassed )
        {

            //get the old session and invalidate
            HttpSession oldSession = request.getSession( false );
            if ( oldSession != null )
            {
//                oldSession.invalidate();
            }
            //generate a new session
            HttpSession newSession = request.getSession( true );

            Cookie message = new Cookie( "message", "Welcome" );
            response.addCookie( message );
            Cookie user = new Cookie( "user" + session.getId(), username );
            response.addCookie( user );

            if ( initJSessionID == null ? session.getId() == null : initJSessionID.equals( session.getId() ) )
            {

                System.out.println( "Double session id: " + session.getId() );

            }

            System.out.println( "session id: " + session.getId() );

            Cookie cookies[] = request.getCookies();
            if ( cookies.length > 0 )
            {
                for ( int i = 0; i < cookies.length; i++ )
                {
                    String name = cookies[ i ].getName();
                    String value = cookies[ i ].getValue();

                    System.out.println( "cookies name " + name + "  value " + value );
                }
            }

            String role = replied[ 1 ];
            String function = replied[ 2 ];
            String firstname = replied[ 3 ];
            String lastname = replied[ 4 ];
            String name = replied[ 5 ];
            String email = replied[ 6 ];
            int userID = Integer.parseInt( replied[ 7 ] );

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
            session.setAttribute( "name", name );
            request.setAttribute( "name", name );

            System.out.println( "firstname: " + firstname );
            System.out.println( "lastname: " + lastname );
            System.out.println( "name: " + name );
            System.out.println( "email: " + email );
            System.out.println( "userID: " + userID );

            System.out.println( "\n" + " ############################ LoginServlet 2 #######################################" + "\n" );

            System.out.println( "Iterate Parameters" );

            Enumeration en = request.getParameterNames();

            while ( en.hasMoreElements() )
            {
                Object objOri = en.nextElement();

                String param = ( String ) objOri;

                String value = request.getParameter( param );

                System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

            }

            System.out.println( "Iterate Session geAttribute Names   " );
            keys = session.getAttributeNames();
            while ( keys.hasMoreElements() )
            {
                String key = ( String ) keys.nextElement();
                System.out.println( "key  :" + key + ": " + session.getValue( key ) );
            }

            System.out.println( "\n" + " ############################ END LoginServlet 2 #######################################" + "\n" );

            if ( "Literature Ireland Staff".equals( function ) )
            {

                System.out.println( "calling /WEB-INF/views/welcome_Staff.jsp .... " );

                request.getRequestDispatcher( "/WEB-INF/views/welcome_Staff_1.jsp" ).forward( request, response );
//                request.getRequestDispatcher("/WEB-INF/views/newjsp.jsp").forward(request, response);
            } else
            {

                // user belongs to Publisher
                if ( "Publisher".equals( function ) )
                {
                    try
                    {
                        System.out.println( "Publisher here: " );
                        System.out.println( "Publisher here:userID::  " + userID );

                        // get publisherID for userID
                        int publisherID = findpublisherID( userID );
                        String publisherName = findPublisherName( publisherID );

                        System.out.println( "Publisher publisherName: " + publisherName );

                        session.setAttribute( "publisherID", publisherID );
                        session.setAttribute( "Company_Number", publisherID );
                        session.setAttribute( "publisherName", publisherName );
                        session.setAttribute( "name", name );

                        publisherID = ( int ) session.getAttribute( "publisherID" );

                        System.out.println( "login publisherID: " + publisherID );
                        System.out.println( "login name: " + name );

                        request.getSession().setAttribute( "publisherName", publisherName );
                        request.setAttribute( "publisherName", publisherName );
                        request.setAttribute( "name", name );
                        // if it is a New Publisher show publisherRegistration_1.jsp
                        // so user can fill in Publishers details 
                        boolean isNew = false;
                        isNew = ACpublisherDAO_test.isNewPublisher( publisherID );
                        System.out.println( "Publisher isNew:1: " + isNew );
                        if ( isNew == true )
                        {

                            System.out.println( "Publisher isNew:2: " + isNew );

                            // if new Publisher go here (Status = "new")
                            // here update Status to complete
                            request.getRequestDispatcher( "/WEB-INF/views/publisherRegistration.jsp" ).forward( request, response );

                        } else
                        {
                            System.out.println( "Im here :1: " );
                            System.out.println( "Publisher publisherID: " + publisherID );
                            System.out.println( "Publisher :: name: " + name );
                            session.setAttribute( "publisherID", publisherID );
                            session.setAttribute( "name", name );
                            request.setAttribute( "name", name );
                            request.setAttribute( "publisherName", publisherName );
                            request.setAttribute( "name", name );
//                            request.setAttribute("publisherID", publisherID);
                            request.getRequestDispatcher( "/WEB-INF/views/welcome_Publisher.jsp" ).forward( request, response );
                        }

                    } catch ( DBException ex )
                    {
                        java.util.logging.Logger.getLogger( LoginServlet.class.getName() ).log( Level.SEVERE, null, ex );
                    }

                } else
                {
                    if ( "Expert Reader".equals( function ) )
                    {
                        request.setAttribute( "userID", userID );
                        session.setAttribute( "userID", userID );
                        request.getSession().setAttribute( "userID", userID );
                        request.getRequestDispatcher( "/WEB-INF/views/welcome_ExpertReader.jsp" ).forward( request, response );
                    } else
                    {
                        request.getRequestDispatcher( "/WEB-INF/views/welcome.jsp" ).forward( request, response );
                    }
                }
            }
        } else
        {

            System.out.println( "Booooooooooooooooooo" );
            request.setAttribute( "errorMessage", "Invalid Credentials!!" );
            request.getRequestDispatcher( "/WEB-INF/views/login_error.jsp" ).forward( request, response );
        }
    }

    public static int findpublisherID( int userID ) throws DBException
    {

        int publisherID = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        try
        {
            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT userID, Company_Number FROM ILGAS.PublisherUserJoined WHERE PublisherUserJoined.userID = ?" );
            ps.setInt( 1, userID );
            res = ps.executeQuery();
            if ( res != null )
            {

                if ( res.next() )
                {
                    System.out.println( "findpublisherID::publisherID " + res.getInt( "Company_Number" ) );
                    publisherID = res.getInt( "Company_Number" );
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e )
        {
            DBConn.close( conn, ps, res );
            e.printStackTrace();
            throw new DBException( "2 Excepion while accessing database" );
        }

        System.out.println( "findpublisherID::userID " + userID );
        System.out.println( "findpublisherID::publisherID " + publisherID );

        return publisherID;
    }

    public static String findPublisherName( int Company_Number ) throws DBException
    {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        int publisherID = Company_Number;
        String publisherName = "";

        System.out.println( "findPublisherName: " + Company_Number );

        try
        {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement( "SELECT Company FROM ILGAS.international_publishers WHERE international_publishers.Company_Number = ?" );
            ps.setInt( 1, publisherID );
            res = ps.executeQuery();
            if ( res != null )
            {
                if ( res.next() )
                {
                    publisherName = res.getString( "Company" );
                    System.out.println( "findPublisherName: res: " + publisherName );
                }
            }
            DBConn.close( conn, ps, res );
        } catch ( ClassNotFoundException | SQLException e )
        {
            DBConn.close( conn, ps, res );
            e.printStackTrace();
            throw new DBException( "2 Excepion while accessing database" );
        }

        System.out.println( "findPublisherName::publisherName " + publisherName );

        return publisherName;
    }
}
