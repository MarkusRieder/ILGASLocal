package ie.irishliterature.listener;

import java.util.Enumeration;
import java.util.Set;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/**
 * Web application lifecycle listener.
 *
 * @author markus
 */
//@WebListener
public class ActiveUser implements HttpSessionBindingListener {

    private String username = null;
//    private String password = null;

//    public ActiveUser( String name ) {
//        this.username = name;
//    }

    /*
     * All logins.
     */
//    private static final Map<ActiveUser, HttpSession> logins = new HashMap<ActiveUser, HttpSession>();
    public void setUserName( String uname ) {
        this.username = uname;
    }

    public String getUserName() {
        return this.username;
    }

    @Override
    public boolean equals( Object other ) {
        return ( other instanceof ActiveUser ) && ( username != null ) ? username.equals( ( ( ActiveUser ) other ).username ) : ( other == this );
    }

    @Override
    public int hashCode() {
        return ( username != null ) ? ( this.getClass().hashCode() + username.hashCode() ) : super.hashCode();
    }

    @Override
    @SuppressWarnings( "unchecked" )
    public void valueBound( HttpSessionBindingEvent event ) {

        System.out.println( "\n" + " ############################ valueBound ActiveUser 1 #######################################" + "\n" );

        System.out.printf( "ActiveUser valueBound added attribute name: %s, value:%s %n",
                event.getName(), event.getValue() );

        ActiveUser user = ( ActiveUser ) event.getValue();
        System.out.println( "New user bound in session with name: " + user.getUserName() );

//        if ( this.username != null )
//        {
//        String loggedInUser = ( String ) event.getSession().getServletContext().getAttribute( "loggedInUsers" );
        Set<String> loggedInUsers = ( Set<String> ) event.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "ActiveUser valueBound ( Set<String> ) event: " + event.getSession().getServletContext().getAttribute( "loggedInUsers" ) );
        System.out.println( "ActiveUser valueBound  user.getUserName(): " + user.getUserName() );
        loggedInUsers.add( ( user.getUserName() ) );
        System.out.println( "ActiveUser valueBound loggedInUsers: " + loggedInUsers );
//        }
        System.out.println( "\n" + " ############################ END ActiveUser 1 #######################################" + "\n" );

    }

    @Override
    @SuppressWarnings( "unchecked" )
    public void valueUnbound( HttpSessionBindingEvent event ) {

        System.out.println( "\n" + " ############################ valueUnbound  ActiveUser 2 #######################################" + "\n" );

//        ServletContext context = event.getSession().getServletContext();
//        Enumeration<String> e = context.getInitParameterNames();
//        System.out.println( "ServletContext .getInitParameterNames()   " );
//        String str = "";
//        while ( e.hasMoreElements() )
//        {
//            str = e.nextElement();
//            System.out.println( context.getInitParameter( str ) );
//        }
        System.out.println( "User Unbound in session with name: " + event.getValue() );

        String userName = event.getValue().toString();
        System.out.println( "ActiveUser Unbound in session with userName: " + userName );

        System.out.println( "Enumeration keys 1  " );
        Enumeration keys = event.getSession().getServletContext().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
                System.out.println( "key  :" + key + ": " + event.getSession().getServletContext().getAttribute( key ) );
            }
        }
        System.out.printf( "ActiveUser valueUnbound remove attribute name: %s, value:%s %n",
                event.getName(), event.getValue() );

//        Set<ActiveUser> logins = ( Set<ActiveUser> ) event.getSession().getServletContext().getAttribute( "logins" );
        Set<ActiveUser> userData = ( Set<ActiveUser> ) event.getSession().getServletContext().getAttribute( "userData" );
        ActiveUser user = ( ActiveUser ) event.getValue();
        System.out.println( "userData Unbound in session with name:   " + userData.toString() );
        System.out.println( "ActiveUser Unbound in session with name: " + user.getUserName() );

        System.out.println( "ActiveUser valueUnbound BEFORE <<<<<<<<<<<<<<<<<, logins.remove(" + event.getValue() + ")  \n " );
//
        System.out.println( "User Unbound in session with name: " + event.getValue() );

        Set<String> loggedInUsers = ( Set<String> ) event.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "ActiveUser valueUnbound loggedInUsers BEFORE loggedInUsers.remove: " + loggedInUsers );
        
        if ( event.getValue() != null ) {
            loggedInUsers.remove( user.getUserName() );
        }

        loggedInUsers = ( Set<String> ) event.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "1234 ActiveUser valueUnbound loggedInUsers BEFORE loggedInUsers.remove: " + loggedInUsers );
//        
//        System.out.println( "Enumeration keys   " );
//        keys = event.getSession().getServletContext().getAttributeNames();
//        while ( keys.hasMoreElements() )
//        {
//            String key = ( String ) keys.nextElement();
//            if ( key == "loggedInUsers" || key == "userData" || key == "logins" )
//            {
//                System.out.println( "key  :" + key + ": " + event.getSession().getServletContext().getAttribute( key ) );
//            }
//        }

        loggedInUsers = ( Set<String> ) event.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "ActiveUser valueUnbound loggedInUsers loggedInUsers.remove: " + loggedInUsers + "  after removing  " + event.getValue() );

        System.out.println( "\n" + " ############################ END valueUnbound ActiveUser 2 #######################################" + "\n" );

        System.out.println( "-- HttpSessionBindingEvent#valueUnbound() --" );
        System.out.printf( "removed attribute name: %s, value:%s %n",
                event.getName(), event.getValue() );

        System.out.println( "\n" + " ############################ ActiveUser 3 #######################################" + "\n" );

        System.out.println( "ActiveUser valueUnbound >>>>>>>>>>>>>>>>>>. AFTER logins.remove(" + event.getValue() + ")  \n " );
        System.out.println( "Enumeration keys 2  " );
        keys = event.getSession().getServletContext().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            if ( key == "loggedInUsers" || key == "userData" || key == "logins" ) {
                System.out.println( "key  :" + key + ": " + event.getSession().getServletContext().getAttribute( key ) );
            }
        }

        System.out.println( "ActiveUser valueUnbound loggedInUsers still logged in: " + loggedInUsers + "  after removing  " + event.getValue() );
        System.out.println( "\n" + " ############################ END ActiveUser 3 #######################################" + "\n" );

    }

    @Override
    public String toString() {
        return username;
    }

}
