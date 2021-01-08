package ie.irishliterature.servlets;

import ie.irishliterature.dao.StaffDAO;
import ie.irishliterature.db.DBException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.json.JSONException;
import org.json.JSONObject;



/**
 *
 * @author markus
 */
@WebServlet(name = "changeBookCoverServlet", urlPatterns = { "/changeBookCoverServlet" })
public class changeBookCoverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final static Logger LOGGER
            = Logger.getLogger( changeBookCoverServlet.class.getCanonicalName() );

    private boolean isMultipart;
    private final int maxFileSize = 50 * 1024;
    private final int maxMemSize = 4 * 1024;
    private String filePath;
    private String ReferenceNumber;
    private String company;
    private String yearInString;
    private int ApplicationNumber = 0;
    private String fileNames;
    String filename;

    public changeBookCoverServlet() {

        super();
    }

    String tempPath = "/home/markus/test/tempDir";
    String rootPath = "/home/markus/public_html/test";

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        List<String> filesToBeMoved = new ArrayList<>();
         JSONObject json = new JSONObject();
         
        try {
            try {
                HttpSession session = request.getSession();

                response.setContentType( "application/json" );
                response.setCharacterEncoding( "UTF-8" );

                String message = "";

                System.out.println( "#########################  /changeBookCoverServlet  #########################" );


                /*
                * Check that we have a file upload request
                 */
                isMultipart = ServletFileUpload.isMultipartContent( request );
                System.out.println( "isMultipart:: " + isMultipart );

                DiskFileItemFactory factory = new DiskFileItemFactory();

                /*
                * maximum size that will be stored in memory
                 */
                factory.setSizeThreshold( maxMemSize );
                /*
                * Location to save data that is larger than maxMemSize.
                 */
                factory.setRepository( new File( tempPath ) );
                /*
                * Create a new file upload handler
                 */
                ServletFileUpload upload = new ServletFileUpload( factory );
                /*
                * maximum file size to be uploaded.
                 */
                //  upload.setSizeMax(maxFileSize);
                /*
                * Parse the request to get file items.
                 */
                List<FileItem> items = upload.parseRequest( request );

                for ( FileItem item : items ) {

                    if ( item.isFormField() ) {

                        /*
                        * Process regular form field (input
                        * type="text|radio|checkbox|etc", select, etc).
                        * collect all data input from input fileds
                         */
                        String fieldname = item.getFieldName();
                        String fieldvalue = item.getString( "UTF-8" ).trim();

                        System.out.println( "fieldname: " + fieldname + " >> fieldvalue: " + fieldvalue );

                        switch ( fieldname ) {

                            case "Publisher":
                                company = fieldvalue;
                                break;
                            case "referenceNumber":
                                ReferenceNumber = fieldvalue;
                                System.out.println( "ReferenceNumber 1 ---->> " + ReferenceNumber );
                                break;
                        } // end switch

                    } else {

                        //////////////////////////////////////////////////////////////
                        //  Process Application Form file field (input type="file") //
                        //////////////////////////////////////////////////////////////
                        String fieldname = item.getFieldName();
                        filename = FilenameUtils.getName( item.getName() );

                        String fileName = getFdname( fieldname );
                        System.out.println( "FilenameUtils.getName filename  " + filename + " getFdname( fieldname ) " + fileName );
                        String fdnameArray[] = fieldname.split( "-" );

                        String fdname = fdnameArray[ 0 ];

                        System.out.println( "FilenameUtils.getName fieldname  " + fieldname );

                        System.out.println( "FilenameUtils.getName fdname  " + fdname );

                        System.out.println( "getCounter( fieldname ) counter : fieldname :" + fieldname + ": filename :" + filename );

                        /*
                        * ReferenceNumber contains ApplicationNumber seperated
                        * by a "/"
                        * find the first occurrence of "/"
                         */
                        System.out.println( "ReferenceNumber 2 ---->> " + ReferenceNumber );

                        int iend = ReferenceNumber.indexOf( "/" );
                        System.out.println( "iend ---->> " + iend );

                        /*
                         * get ApplicationNumber from ReferenceNumber
                         * get yearInString from ReferenceNumber
                         */


                        ApplicationNumber = Integer.parseInt( ReferenceNumber.substring( 0, iend ) );
                        System.out.println( "ApplicationNumber ---->> " + ApplicationNumber );

                        yearInString = ReferenceNumber.substring( iend + 1, ReferenceNumber.length() );
                        System.out.println( "yearInString ---->> " + yearInString );

                        System.out.println( "switch ( " + fdname + ")" );

                        switch ( fdname ) {

                            case "Cover":
                                if ( filename.isEmpty() ) {
                                    System.out.println( "Cover filename.isEmpty()  filename " + filename );
                                } else {
                                    filePath = tempPath + File.separator + yearInString + File.separator + company + File.separator
                                            + "Cover" + File.separator;
                                    fileNames = filePath + filename;
                                    System.out.println( "Cover filename  fileNames " + fileNames );
                                    filesToBeMoved.add( fileNames );
                                }
                                break;

                        } // end switch

                        /*
                         * create temporary Directory if it does not exist
                         */
                        System.out.println( "filename.equals 1  " + filename + " filePath " + filePath + " fileNames " + fileNames );
                        if ( filename.isEmpty() ) {
                            System.out.println( "fileName.equals 2 filename.isEmpty() filename.isEmpty " + fileName + " filePath " + filePath );
                        } else {
                            File file = new File( filePath );
                            System.out.println( "File file >>> filePath: " + filePath + " filename: " + filename );
                            if ( !file.exists() ) {
                                System.out.println( "creating Temporary Directory: file.getName()  " + file.getName() );
                                System.out.println( "creating Temporary Directory: file.getPath()  " + file.getPath() );
                                file.mkdirs();
                            }

                            System.out.println( "filePath: " + filePath + " filename: " + filename );
                            OutputStream outS = null;
                            InputStream filecontent = null;
                            System.out.println( "Upload file: " + filePath + filename );

                            try {
                                outS = new FileOutputStream( new File( filePath + filename ) );
                                System.out.println( "outS: " + outS + " filename: " + filename );
                                filecontent = item.getInputStream();

                                message = message + " '" + filename + "'<br/>";

                                int read;
                                final byte[] bytes = new byte[ 1024 ];

                                while ( ( read = filecontent.read( bytes ) ) != -1 ) {
                                    outS.write( bytes, 0, read );

                                }

                            } catch ( FileNotFoundException fne ) {

                                try {
                                    String errMsg = "<br/><br/>You either did not specify a file to upload or are "
                                            + "trying to upload a file to a protected or nonexistent "
                                            + "location.<br/> <br/><strong> ERROR:<strong> '" + fne.getMessage() + "' ";
                                    json.put("success", false);
                                    request.setAttribute( "message", " '<strong>" + filename + "</strong>" + errMsg );
                                    request.getRequestDispatcher( "/WEB-INF/views/uploadErrorResponse.jsp" ).forward( request, response );
                                    LOGGER.log( Level.SEVERE, "Problems during file upload. Error: {0}",
                                            new Object[]{
                                                fne.getMessage()
                                            } );
                                    System.out.println( "errMsg: " + errMsg );
                                } catch ( JSONException ex ) {
                                    Logger.getLogger( changeBookCoverServlet.class.getName() ).log( Level.SEVERE, null, ex );
                                }
                            } finally {

                                if ( outS != null ) {
                                    outS.close();
                                }

                                if ( filecontent != null ) {
                                    filecontent.close();
                                }
                            }
                        }
                    } // else
                } // for (FileItem item : items)

//                ////////////////////////////////////////////////////////////
//                //  Process Application
//                ////////////////////////////////////////////////////////////
//                GrantApplication application = new GrantApplication();
//
//                application.setReferenceNumber( ReferenceNumber );
//                application.setCompany( company );

            } catch ( FileUploadException ex ) {
                Logger.getLogger( GrantApplicationServlet.class.getName() ).log( Level.SEVERE, null, ex );
            }

            System.out.println( "####################### creating the lists ##################################################" );

            String moveFile = "";
            String moveFileName = "";
            String destinationDirectory = "";
            String moveFileNameReplaced = "";

            destinationDirectory = rootPath + File.separator + yearInString + File.separator + company + File.separator
                    + ApplicationNumber + File.separator + "Cover" + File.separator;

            System.out.println( "filesToBeMoved.get( 0 ) --" + filesToBeMoved.get( 0 ) );
            System.out.println( "filename --" + filename );
            System.out.println( "destinationDirectory --" + destinationDirectory );
            moveFileName = filename;

            moveFile = destinationDirectory + filename;

            System.out.println( "moveFile --" + moveFile );

            File directory = new File( destinationDirectory );
            System.out.println( "destinationDirectory --" + destinationDirectory );

            /*
            * create directory if it does not exist
            */
            if ( !directory.exists() ) {
                System.out.println( "create destinationDirectory --" + destinationDirectory );
                directory.mkdirs();
            }

            File sFile = new File( filesToBeMoved.get( 0 ) );
            File destDir = new File( destinationDirectory );


            File destFile = new File( moveFile );
            System.out.println( "destFile --" + destFile );
            /*
             * --------------------------------------------------------------------------------
             * move file
             * overwrite if file exists
             */
            if ( destFile.exists() ) {
                System.out.println( "Deleting quetly destFile  " + destFile );
                FileUtils.deleteQuietly( destFile );
            }

            FileUtils.moveFile( sFile, destFile );

            /*
             * --------------------------------------------------------------------------------
             */

            System.out.println( "####################### End creating the lists ##################################################" );

            System.out.println( "####################### sending files to tables ##################################################" );

            moveFileNameReplaced = moveFile.replace( "/home/markus/public_html/test", "/public_html/test" );

            System.out.println( "moveFileNameReplaced " + moveFileNameReplaced );

            StaffDAO.updateCover( ReferenceNumber, moveFileName, moveFileNameReplaced );

            System.out.println( "####################### End sending files to tables ##################################################" );
            try {
                 json.put("imagePath", "http://localhost" + moveFileNameReplaced);

                
            } catch ( JSONException ex ) {
                Logger.getLogger( changeBookCoverServlet.class.getName() ).log( Level.SEVERE, null, ex );
            }
    response.getWriter().write(json.toString());
            
        } catch ( DBException ex ) {
            Logger.getLogger( changeBookCoverServlet.class.getName() ).log( Level.SEVERE, null, ex );
        }

    }

    public String getFdname( String fieldname ) {

        String fdname;

        String fdnameArray[] = fieldname.split( "-" );

        fdname = fdnameArray[ 0 ];

        System.out.println( "getFdname(String " + fieldname );
        for ( int v = 0; v < fdnameArray.length; v++ ) {
            System.out.println( "fdnameArray[" + v + "]" + fdnameArray[ v ] );
        }

        System.out.println( "fdname  " + fdname );

        return fdname;
    }
}
