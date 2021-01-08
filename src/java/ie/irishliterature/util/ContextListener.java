package ie.irishliterature.util;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener( "application context listener" )
public class ContextListener implements ServletContextListener {

    /**
     * Initialize log4j when the application is being started
     *
     * @param event
     */
    @Override
    public void contextInitialized( ServletContextEvent event ) {

        ServletContext context = event.getServletContext();
    }

    @Override
    public void contextDestroyed( ServletContextEvent event ) {
        // do nothing
    }
}
