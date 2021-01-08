package ie.irishliterature.listener;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;

/**
 *
 * @author Markus Rieder
 */
public class ShiroSessionListener implements SessionListener {

    @Override
    public void onStart( Session session ) {
        System.out.println( "ShiroSessionListener : onStart sessionID  " + session.getId() + " session.getTimeout()  " + session.getTimeout() );
        System.out.println( "ShiroSessionListener : session.getHost()  " + session.getHost() );
            

    }

    @Override
    public void onExpiration( Session session ) {
        System.out.println( "ShiroSessionListener：onExpiration " + session.getId() + " session.getTimeout()  " + session.getTimeout() );
        session.getTimeout();

    }

    @Override
    public void onStop( Session session ) {
        System.out.println( "ShiroSessionListener：onStop " + session.getId() );
    }  
}
