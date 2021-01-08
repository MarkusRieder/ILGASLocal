package ie.irishliterature.service;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.util.Factory;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

public class LoginService {

    private static final Logger logger = LogManager.getLogger( LoginService.class );

    @SuppressWarnings( "unchecked" )
    public boolean loginCheck( String username, String password ) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {

        System.out.println( "\n" + " ############################ LoginService 1 #######################################" + "\n" );

        System.out.println( "LoginService username before : " + username );

        boolean LogonPassed = false;

        /**
         * Testing Shiro
         * -----------------------------------------------------------------------
         */
        System.out.println( "-----------------------------------------  Shiro test --------------------------------------------------" );

        Factory<SecurityManager> factory = new IniSecurityManagerFactory( "classpath:shiro.ini" );
        SecurityManager securityManager = factory.getInstance();
        SecurityUtils.setSecurityManager( securityManager );

        Session shiroSession = null;

        ensureUserIsLoggedOut();

        Subject currentUser = SecurityUtils.getSubject();
        shiroSession = currentUser.getSession();

        DefaultSecurityManager securityMgr = ( DefaultSecurityManager ) SecurityUtils.getSecurityManager();
        DefaultWebSessionManager sessionManager = ( DefaultWebSessionManager ) securityMgr.getSessionManager();

        Collection<Session> sessions = sessionManager.getSessionDAO().getActiveSessions();

        System.out.println( " LoginService username " + username );
        System.out.println( " LoginService password " + password );

        logger.info( " LoginService username " + username );
        logger.info( " LoginService password " + password );

        if ( !currentUser.isAuthenticated() ) {
            UsernamePasswordToken token = new UsernamePasswordToken( username, password );
            System.out.println( "LoginService UsernamePasswordToken token " + token );
            token.setRememberMe( true );
            String host = token.getHost();
            System.out.println( " LoginService token.getHost() " + host );

//            shiroSession.setAttribute( "activeUsers", currentUser);
            try {

                currentUser.login( token );
                LogonPassed = true;
            }
            catch ( UnknownAccountException e ) {
                System.out.println( "username is incorrect" );
                logger.warn( " LoginService username is incorrect UnknownAccountException:  " + e );
                LogonPassed = false;
            }
            catch ( IncorrectCredentialsException e ) {
                System.out.println( "password is incorrect" );
                logger.warn( " LoginService password is incorrect IncorrectCredentialsException:  " + e );
                LogonPassed = false;
            }
            catch ( LockedAccountException e ) {
                LogonPassed = false;
                System.out.println( "account was locked" );
                logger.warn( " LoginService account was locked LockedAccountException:  " + e );
            }
            catch ( AuthenticationException e ) {
                System.out.println( "there are some errors" );
                logger.warn( " LoginService there are some errors AuthenticationException:  " + e );
                LogonPassed = false;
            }
            Calendar calendar = Calendar.getInstance(); // Returns instance with current date and time set
            SimpleDateFormat formatter = new SimpleDateFormat( "dd-MM-yyyy HH:mm:ss" );
            System.out.println( "LoginService User [" + currentUser.getPrincipal() + "] logged in successfully at " + formatter.format( calendar.getTime() ) );
            logger.info( "LoginService User [" + currentUser.getPrincipal() + "] logged in successfully at " + formatter.format( calendar.getTime() ) );
        }
        if ( sessions != null ) {

            System.out.println( "sessions.size: " + sessions.size() );

            for ( Session session : sessions ) {

                System.out.println( " LoginService username " + username + " :: PRINCIPALS_SESSION_KEY " + String.valueOf( session.getAttribute( DefaultSubjectContext.PRINCIPALS_SESSION_KEY ) ) );
                System.out.println( "Login ip: " + session.getHost() );

//            System.out.println( "Login user: " + sessions.getAttribute( DefaultWebContext.PRINCIPALS_SESSION_KEY ) );
                System.out.println( "Login user: " + session.getAttribute( DefaultSubjectContext.PRINCIPALS_SESSION_KEY ) );

                System.out.println( "Last operation date: " + session.getLastAccessTime() );

                if ( username.equals( String.valueOf( session.getAttribute( DefaultSubjectContext.PRINCIPALS_SESSION_KEY ) ) ) ) {

                    session.setTimeout( 0 );//Set session to be invalid immediately, kick it out of the system

                    break;
                }
            }
        }
//              for ( Session session : sessions ) {
//
//                System.out.println( " LoginService username " + username + " :: PRINCIPALS_SESSION_KEY " + String.valueOf( session.getAttribute( DefaultSubjectContext.PRINCIPALS_SESSION_KEY ) ) );
//                System.out.println( "Login ip: " + session.getHost() );
//
////            System.out.println( "Login user: " + sessions.getAttribute( DefaultWebContext.PRINCIPALS_SESSION_KEY ) );
//                System.out.println( "Login user: " + session.getAttribute( DefaultSubjectContext.PRINCIPALS_SESSION_KEY ) );
//
//                System.out.println( "Last operation date: " + session.getLastAccessTime() );
//                if ( username.equals( String.valueOf( session.getAttribute( DefaultSubjectContext.PRINCIPALS_SESSION_KEY ) ) ) ) {
//
//                    session.setTimeout( 0 );//Set session to be invalid immediately, kick it out of the system
//
//                    break;
//                }
//            }

        System.out.println( "-----------------------------------------  Shiro test END --------------------------------------------------" );

        System.out.println( "LoginService: loginCheck LogonPassed " + LogonPassed );

        System.out.println( "\n" + " ############################ LoginService 1 END #######################################" + "\n" );

        return LogonPassed;
    }

    /**
     * Logout the user fully before continuing.
     */
    private void ensureUserIsLoggedOut() {
        try {
            // Get the user if one is logged in.
            Subject currentUser = SecurityUtils.getSubject();
            if ( currentUser == null ) {
                return;
            }

            // Log the user out and kill their session if possible.
            currentUser.logout();
            Session session = currentUser.getSession( false );
            if ( session == null ) {
                return;
            }

            session.stop();
        }
        catch ( InvalidSessionException e ) {
            // Ignore all errors, as we're trying to silently 
            // log the user out.
        }
    }

}
