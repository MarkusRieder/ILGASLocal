/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 *
 * @author markus
 */
public class UploadHelper {

    public static String upload( String UPLOAD_DIR, HttpServletRequest request )
    {
        String fileName = null;
        try
        {
            Part filePart = request.getPart( "upload" );
            fileName = getFileName( filePart );
            String applicationPath = request.getServletContext().getRealPath( "" );
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;

            System.out.println( "################### UploadHelper ################### " );
            System.out.println( "fileName " + fileName );
            System.out.println( "basePath " + basePath );

            InputStream inputStream = null;
            OutputStream outputStream = null;
            try
            {
                File outputFilePath = new File( basePath + fileName );
                System.out.println( "outputFilePath " + outputFilePath );
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream( outputFilePath );
                int read = 0;
                final byte[] bytes = new byte[ 1024 ];
                while ( ( read = inputStream.read( bytes ) ) != -1 )
                {
                    outputStream.write( bytes, 0, read );
                }

            }
            catch ( IOException ex )
            {
                fileName = null;
            }
            finally
            {
                if ( outputStream != null )
                {
                    outputStream.close();
                }
                if ( inputStream != null )
                {
                    inputStream.close();
                }
            }

        }
        catch ( IOException | ServletException e )
        {
            fileName = null;
        }
        System.out.println( "return fileName " + fileName );
        return fileName;
    }

    public static String getFileName( Part part )
    {
        for ( String content : part.getHeader( "content-disposition" ).split( ";" ) )
        {
            if ( content.trim().startsWith( "filename" ) )
            {
                return content.substring( content.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
            }
        }
        return null;
    }

}
