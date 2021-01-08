package ie.irishliterature.listener;

import com.codahale.metrics.Counter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

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
        Calendar calendar = Calendar.getInstance(); // Returns instance with current date and time set
        SimpleDateFormat formatter = new SimpleDateFormat( "dd-MM-yyyy HH:mm:ss" );
        System.out.println( formatter.format( calendar.getTime() ) );

        System.out.println( "activeSessions: getTotalActiveSession  " + getTotalActiveSession() );
        System.out.println( "activeSessions: sessionCreated  counterOfActiveSessions.getCount()  " + counterOfActiveSessions.getCount() );
        System.out.println( "-- HttpSessionListener#sessionCreated invoked --" );
        HttpSession session = se.getSession();
        System.out.println( "session id: " + session.getId() );

        session.setMaxInactiveInterval( 60 * 60 );   //in seconds

        session.setAttribute( "timeOutTimeInSeconds", 3600 );
        session.setAttribute( "showTimerTimeInSeconds", 30 );

        System.out.println( "\n" + " ############################ END SessionListener 1 #######################################" + "\n" );

    }

    @Override
    public void sessionDestroyed( HttpSessionEvent se ) {

        System.out.println( "\n" + " ############################ SessionListener 2 sessionDestroyed #######################################" + "\n" );

        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat( "dd-MM-yyyy HH:mm:ss" );
        System.out.println( formatter.format( calendar.getTime() ) );

        activeSessions.decrementAndGet();
        counterOfActiveSessions.dec();

        System.out.println( "-- HttpSessionListener#sessionDestroyed invoked at " + formatter.format( calendar.getTime() ) + " --" );

        HttpSession session = se.getSession();

        Enumeration keys = se.getSession().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "SessionListener  removeAttribute( key ): " + key );

            se.getSession().removeAttribute( key );
        }

        session.invalidate();

        System.out.println( "Destroyed  session id: " + session.getId() );
        System.out.println( "activeSessions: " + getTotalActiveSession() );
        System.out.println( "SessionListener \n " );
        System.out.println( "Enumeration keys   " );

        keys = se.getSession().getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();

            System.out.println( "key  :" + key + ": " + se.getSession().getAttribute( key ) );
        }

        System.out.println( "activeSessions: getActiveSessions sessionDestroyed " + getActiveSessions() );
        System.out.println( "activeSessions: sessionDestroyed  counterOfActiveSessions.getCount()  " + counterOfActiveSessions.getCount() );

        System.out.println( "\n" + " ############################ END SessionListener 2 #######################################" + "\n" );

        ShiroSessionListener ssessionListener = new ShiroSessionListener();

        Session shiroSession = null;
        Subject currentUser = SecurityUtils.getSubject();
        shiroSession = currentUser.getSession();
        
      ssessionListener.onExpiration( shiroSession );

    }

}

