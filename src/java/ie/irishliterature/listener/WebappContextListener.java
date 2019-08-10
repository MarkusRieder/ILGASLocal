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
public class WebappContextListener implements ServletContextListener {

    @Override
    public void contextInitialized( ServletContextEvent event )
    {
        //storing connection object as an attribute in ServletContext  
//        ServletContext servletContext = event.getServletContext();

        System.out.println( "WebappContextListener started" );

        Set<ActiveUser> logins = new HashSet<>();
        System.out.println( "WebappContextListener logins 1  BEFORE setAttribute(\"logins\", logins) : " + logins.toString() );

        //add Initial login to ServletContext
        event.getServletContext().setAttribute( "logins", logins );
        System.out.println( "WebappContextListener logins 2  AFTER setAttribute(\"logins\", logins : " + logins.toString() );
    }

    @Override
    public void contextDestroyed( ServletContextEvent event )
    {
//		WebappContext.destroy(event.getServletContext());
        System.out.println( "ServletContextListener destroyed" );

    }
}
