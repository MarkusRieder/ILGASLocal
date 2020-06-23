package ie.irishliterature.listener;

import com.codahale.metrics.Counter;
import java.util.Enumeration;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author markus
 */
@WebListener
public class SessionListener implements HttpSessionListener {

    private final AtomicInteger activeSessions;
//     public static final MetricRegistry metrics = new MetricRegistry();
    private final Counter counterOfActiveSessions;

    public SessionListener() {
        super();

        activeSessions = new AtomicInteger();
        counterOfActiveSessions = MetricRegistrySingleton.metrics.counter( "web.sessions.active.count" );
    }

    public int getTotalActiveSession() {
        return activeSessions.get();
    }

    public int getActiveSessions() {
        return activeSessions.get();
    }

    @Override
    @SuppressWarnings( "unchecked" )
    public void sessionCreated( HttpSessionEvent se ) {

        activeSessions.incrementAndGet();
        counterOfActiveSessions.inc();

        System.out.println( "\n" + " ############################ SessionListener 1 sessionCreated #######################################" + "\n" );

        System.out.println( "activeSessions: getTotalActiveSession  " + getTotalActiveSession() );
        System.out.println( "activeSessions: sessionCreated  counterOfActiveSessions.getCount()  " + counterOfActiveSessions.getCount() );
        System.out.println( "-- HttpSessionListener#sessionCreated invoked --" );
        HttpSession session = se.getSession();
        System.out.println( "session id: " + session.getId() );

//        Set<ActiveUser> logins = ( Set<ActiveUser> ) se.getSession().getServletContext().getAttribute( "logins" );
//
//        if ( logins != null )
//        {
//            System.out.println( "SessionListener logins size: " + logins.size() );
//            System.out.println( "SessionListener logins: " + logins.toString() );
//
//        }
//        else
//        {
//            System.out.println( "SessionListener logins null" );
//        }
        Set<String> loggedInUsers = ( Set<String> ) se.getSession().getServletContext().getAttribute( "loggedInUsers" );
        System.out.println( "SessionListener loggedInUsers: " + loggedInUsers );
        
        System.out.println( "\n" + " ############################ END SessionListener 1 #######################################" + "\n" );

//      session.setMaxInactiveInterval(60);//in seconds
    }

    @Override
    public void sessionDestroyed( HttpSessionEvent se ) {

        System.out.println( "\n" + " ############################ SessionListener 2 sessionDestroyed #######################################" + "\n" );
        activeSessions.decrementAndGet();
        counterOfActiveSessions.dec();

        System.out.println( "-- HttpSessionListener#sessionDestroyed invoked --" );

        HttpSession session = se.getSession();

        Enumeration keys = se.getSession().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "SessionListener  removeAttribute( key ): " + key );

            se.getSession().removeAttribute( key );
        }

        System.out.println( "Destroyed  session id: " + session.getId() );
        System.out.println( "activeSessions: " + getTotalActiveSession() );
        System.out.println( "SessionListener \n " );
        System.out.println( "Enumeration keys   " );

//        System.out.println( "Check for  Info:   Enumeration keys\n"
//                + "Info:   key  :firstname: Sparky\n"
//                + "Info:   key  :name: Sparky The Black Cat\n"
//                + "Info:   key  :userID: 88\n"
//                + "Info:   key  :logins: moist\n"
//                + "Info:   key  :email: markus@rieder.ie\n"
//                + "Info:   key  :username: test3\n"
//                + "Info:   key  :lastname: The Black Cat  " );
        keys = se.getSession().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
//            if (key == "currentusers" || key == "totalusers" || key == "logins") {
            System.out.println( "key  :" + key + ": " + se.getSession().getAttribute( key ) );
        }

        System.out.println( "activeSessions: getActiveSessions sessionDestroyed " + getActiveSessions() );
        System.out.println( "activeSessions: sessionDestroyed  counterOfActiveSessions.getCount()  " + counterOfActiveSessions.getCount() );

        System.out.println( "\n" + " ############################ END SessionListener 2 #######################################" + "\n" );
    }

}
