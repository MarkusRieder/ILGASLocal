package ie.irishliterature.misc;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class FileLocationContextListener implements ServletContextListener {

    @Override
    public void contextInitialized( ServletContextEvent servletContextEvent )
    {

        String tempPath = "/home/glassfish/glassfish/domains/domain1/tempDir";
        String rootPath = "/home/glassfish/glassfish/domains/domain1/documents";

        System.out.println( "tempPath: " + tempPath + " rootPath: " + rootPath );

        ServletContext ctx = servletContextEvent.getServletContext();
        String relativePath = ctx.getInitParameter( "tempfile.dir" );
        File file = new File( rootPath + File.separator + relativePath );
        if ( !file.exists() )
        {
            file.mkdirs();
        }
        System.out.println( "File.separator:: " + File.separator );
        System.out.println( "File Directory created to be used for storing files" );
        ctx.setAttribute( "FILES_DIR_FILE", file );
        ctx.setAttribute( "FILES_DIR", rootPath + File.separator + relativePath );
    }

    @Override
    public void contextDestroyed( ServletContextEvent servletContextEvent )
    {
        //do cleanup if needed
    }

}
