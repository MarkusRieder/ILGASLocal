package ie.irishliterature.servlets;

import ie.irishliterature.util.GlobalConstants;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 * <br>
 * handles user logout
 *
 * <br><br>
 * $LastChangedDate:: $: Date of last change<br>
 * $LastChangedRevision:: $: Revision of last commit<br>
 * $Author:: markus $: Author of last commit
 *
 * @author Markus Rieder
 */
@WebServlet( name = "Logout", urlPatterns
        = {
            "/Logout"
        } )
public class Logout extends HttpServlet {

    private static final long serialVersionUID = 1L;
    String username = "";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();

    }

    /**
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     *
     * @throws javax.servlet.ServletException ServletException
     * @throws java.io.IOException IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    @SuppressWarnings( "unchecked" )
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        System.out.println( "\n" + " ############################ Logout servlet  #######################################" + "\n" );
        System.out.println( "Logout servlet called  doGet method" );

        HttpSession session = request.getSession();

        username = request.getParameter( "username" );
        System.out.println( "Logout servlet doGet usernameABC  " + username );

        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() ) {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );

            System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + session.getValue( key ) );

        }

//        ServletContext context = request.getSession().getServletContext();
//        System.out.println( "Enumeration keys  AAAAAAA " );
//        Enumeration keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
////            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
////                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
////            }
//        }
//        username = request.getParameter( "username" );
        System.out.println( "Logout servlet username1  " + username );
//        String username2 = ( String ) request.getSession().getServletContext().getAttribute( "username" );
//        System.out.println( "Logout servlet username2  " + username2 );

        System.out.println( "Iterate Parameters" );

        Set<String> loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "LogoutServlet doGet loggedInUsers: 1 " + loggedInUsers );

        System.out.println( "Logout servlet loggedInUsers.remove( username )  " + username );
        loggedInUsers.remove( username );

        System.out.println( "1 Logout servlet session.invalidate()" );
        session.invalidate();

//        username = request.getParameter( "username" );
//        System.out.println( "Logout servlet username  " + username );
//        ServletContext context = request.getSession().getServletContext();
//        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "LogoutServlet doGet loggedInUsers: 2 " + loggedInUsers );

//        if ( request.isRequestedSessionIdValid() && session != null ) {
//            System.out.println( "2 Logout servlet session.invalidate()" );
//            session.invalidate();
//
//        }
//        else {
//            System.out.println( "Logout servlet NOT session.invalidate()" );
//        }
//        System.out.println( "\n" + "Should be empty!!!" + "\n" );
//        System.out.println( "Enumeration keys  A " );
//        keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
//                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            }
//        }
        System.out.println( "Logout servlet doGet username END Logout servlet  " + username );

        System.out.println( "\n" + " ############################ END Logout servlet  #######################################" + "\n" );

        request.getSession().setAttribute( GlobalConstants.USER, null );
        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
//        response.sendRedirect("login.jsp");
    }

    /**
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     *
     * @throws javax.servlet.ServletException ServletException
     * @throws java.io.IOException IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    @SuppressWarnings( "unchecked" )
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
//        username = request.getParameter( "username" );
//        System.out.println( "Logout servlet usernameDEF  " + username );
//        System.out.println( "\n" + " ############################ Logout servlet  #######################################" + "\n" );
//        System.out.println( "Logout servlet called" );
//
//        HttpSession session = request.getSession();
//
//        ServletContext context = request.getSession().getServletContext();
//        System.out.println( "Enumeration keys  AAAAAAA " );
//        Enumeration keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
////            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
////                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
////            }
//        }
//
//        username = request.getParameter( "username" );
//        System.out.println( "Logout servlet username1  " + username );
//        String username2 = ( String ) request.getSession().getServletContext().getAttribute( "username" );
//        System.out.println( "Logout servlet username2  " + username2 );
//
//        System.out.println( "Iterate Parameters" );
//
//        Set<String> loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
//        System.out.println( "LogoutServlet doGet loggedInUsers: 1 " + loggedInUsers );
//
//        System.out.println( "Logout servlet loggedInUsers.remove( username )  " + username );
//        loggedInUsers.remove( username );
//        System.out.println( "1 Logout servlet session.invalidate()" );
//        session.invalidate();
//        username = request.getParameter( "username" );
//        System.out.println( "Logout servlet username  " + username );
//
////        ServletContext context = request.getSession().getServletContext();
//        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
//        System.out.println( "LogoutServlet doGet loggedInUsers: 2 " + loggedInUsers );
//
//        if ( request.isRequestedSessionIdValid() && session != null ) {
//            System.out.println( "2 Logout servlet session.invalidate()" );
//            session.invalidate();
//
//        }
//        else {
//            System.out.println( "Logout servlet NOT session.invalidate()" );
//        }
//
//        System.out.println( "\n" + "Should be empty!!!" + "\n" );
//        System.out.println( "Enumeration keys  A " );
//        keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
//                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            }
//        }
//
//        System.out.println( "\n" + " ############################ END Logout servlet  #######################################" + "\n" );
//        System.out.println( "Logout servlet username END Logout servlet  " + username );
//        request.getSession().setAttribute( GlobalConstants.USER, null );
//        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
//    }
//
//    @SuppressWarnings( "unchecked" )
//    private void processLogout( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
//        System.out.println( "\n" + " ############################ Logout servlet  #######################################" + "\n" );
//        System.out.println( "Logout servlet called" );
//
//        HttpSession session = request.getSession();
//
//        ServletContext context = request.getSession().getServletContext();
//        System.out.println( "Enumeration keys  AAAAAAA " );
//        Enumeration keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
////            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
////                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
////            }
//        }
//
//        username = request.getParameter( "username" );
//        System.out.println( "Logout servlet username1  " + username );
//        String username2 = ( String ) request.getSession().getServletContext().getAttribute( "username" );
//        System.out.println( "Logout servlet username2  " + username2 );
//
//        System.out.println( "Iterate Parameters" );
//
//        Set<String> loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
//        System.out.println( "LogoutServlet doGet loggedInUsers: 1 " + loggedInUsers );
//
//        System.out.println( "Logout servlet loggedInUsers.remove( username )  " + username );
//        loggedInUsers.remove( username );
//        username = request.getParameter( "username" );
//        System.out.println( "Logout servlet username  " + username );
//
////        ServletContext context = request.getSession().getServletContext();
//        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
//        System.out.println( "LogoutServlet doGet loggedInUsers: 2 " + loggedInUsers );
//
//        if ( request.isRequestedSessionIdValid() && session != null ) {
//            System.out.println( "Logout servlet session.invalidate()" );
//            session.invalidate();
//
//        }
//        else {
//            System.out.println( "Logout servlet NOT session.invalidate()" );
//        }
//
//        System.out.println( "\n" + "Should be empty!!!" + "\n" );
//        System.out.println( "Enumeration keys  A " );
//        keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
//                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            }
//        }

//Does not get username
        System.out.println( "\n" + " ############################ Logout servlet  #######################################" + "\n" );
        System.out.println( "Logout servlet called  doPost method" );

        HttpSession session = request.getSession();
        username = request.getParameter( "username" );
        System.out.println( "Logout servlet doPost usernameDEF  " + username );

        System.out.println( "Iterate Parameters" );

        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() ) {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );

            System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + session.getValue( key ) );

        }
        System.out.println( "\n" + " ############################ Logout servlet  #######################################" + "\n" );
        username = request.getParameter( "username" );
        System.out.println( "Logout servlet doPost usernameABC  " + username );

//        ServletContext context = request.getSession().getServletContext();
//        System.out.println( "Enumeration keys  AAAAAAA " );
//        Enumeration keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
//                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            }
//        }
//        username = request.getParameter( "username" );
        System.out.println( "Logout servlet username1  " + username );
//        String username2 = ( String ) request.getSession().getServletContext().getAttribute( "username" );
//        System.out.println( "Logout servlet username2  " + username2 );

        System.out.println( "Iterate Parameters" );

        Set<String> loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "LogoutServlet doPost loggedInUsers: 1 " + loggedInUsers );

        System.out.println( "Logout servlet loggedInUsers.remove( username )  " + username );
        loggedInUsers.remove( username );
        System.out.println( "1 Logout servlet request.isRequestedSessionIdValid() " + request.isRequestedSessionIdValid() );
        System.out.println( "1 Logout servlet session " + session );
        System.out.println( "1 Logout servlet session.invalidate()" );
        session.invalidate();

//        username = request.getParameter( "username" );
//        System.out.println( "Logout servlet username  " + username );
//        ServletContext context = request.getSession().getServletContext();
//        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        loggedInUsers = ( Set<String> ) request.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "LogoutServlet doPost loggedInUsers: 2 " + loggedInUsers );

//        if ( request.isRequestedSessionIdValid() && session != null ) {
//            System.out.println( "2 Logout servlet session.invalidate()" );
//            session.invalidate();
//
//        }
//        else {
//            System.out.println( "Logout servlet NOT session.invalidate()" );
//        }
//        System.out.println( "\n" + "Should be empty!!!" + "\n" );
//        System.out.println( "Enumeration keys  A " );
//        keys = request.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() ) {
//            String key = ( String ) keys.nextElement();
//            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
//                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
//            }
//        }
        System.out.println( "\n" + " ############################ END Logout servlet  #######################################" + "\n" );
        System.out.println( "Logout servlet doPost username END Logout servlet  " + username );
        request.getSession().setAttribute( GlobalConstants.USER, null );
        request.getRequestDispatcher( "/WEB-INF/views/login.jsp" ).forward( request, response );
//        response.sendRedirect("login.jsp");
    }
}
