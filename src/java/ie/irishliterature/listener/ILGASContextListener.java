/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.listener;

import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Web application lifecycle listener.
 *
 * @author markus
 */
@WebListener
public class ILGASContextListener implements ServletContextListener {

    @Override
    public void contextInitialized( ServletContextEvent event ) {

        System.out.println( "WebappContextListener started" );

        Set<String> loggedInUsers = new HashSet<>();
        event.getServletContext().setAttribute( "loggedInUsers", loggedInUsers );
        System.out.println( "WebappContextListener logins 3  loggedInUsers " + loggedInUsers );

    }

    @Override
    public void contextDestroyed( ServletContextEvent event ) {
//		WebappContext.destroy(event.getServletContext());
        System.out.println( "ServletContextListener destroyed" );

    }
}
