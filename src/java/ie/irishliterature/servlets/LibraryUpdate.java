/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import ie.irishliterature.dao.GrantApplicationDAO;
import static ie.irishliterature.dao.GrantApplicationDAO.getcurrentTimeStamp;
import ie.irishliterature.dao.LibraryDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Library;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
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

/**
 *
 * @author markus
 */
@WebServlet(name = "LibraryUpdate", urlPatterns = {"/LibraryUpdate"})
public class LibraryUpdate extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger(LibraryUpdate.class.getCanonicalName());

    private static final long serialVersionUID = 1L;

    ////////////////////////////////////////////////////////////////////////////
    ///
    ///  For file upload
    ///
    ////////////////////////////////////////////////////////////////////////////
    private boolean isMultipart;
    private String filePath;
    private String rootPath;
    private final int maxFileSize = 50 * 1024;
    private final int maxMemSize = 4 * 1024;
    //  private File file;
    private String tempPath = "";

    private int bookID;
    private String referenceNumber;
    private String OrgTitle;
    private String Publisher;
    private String Genre;
    private String translationPublisher;
    private String TransTitle;
    private String ISBN;
    private String ISSN;
    private String yearInString;
    private String message = "";
    private int ApplicationNumber = 0;
    String filesToBeMoved = "";
    String filename = "";

    @Override
    public void init() {

         //Get the file location where they would be stored.
        tempPath = "/home/glassfish/glassfish/domains/domain1/tempDir";
        rootPath = "/home/glassfish/glassfish/domains/domain1/docroot/documents";

    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("LibraryUpdate doGet ");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        Calendar now = Calendar.getInstance();
        //set Year used in filePath
        int year = now.get(Calendar.YEAR);
        String yearInString = String.valueOf(year);

        java.sql.Timestamp timestamp = getcurrentTimeStamp();

        System.out.println("############################### /LibraryUpdate ####################################");

        Enumeration en = request.getParameterNames();

        while (en.hasMoreElements()) {
            Object objOri = en.nextElement();

            String param = (String) objOri;

            String value = request.getParameter(param);

            System.out.println("Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n");

        }
        
        
        HttpSession session = request.getSession();

        System.out.println("Enumeration keys   ");
        Enumeration keys = session.getAttributeNames();
        while (keys.hasMoreElements()) {
            String key = (String) keys.nextElement();
            System.out.println("key  :" + key + ": " + session.getValue(key));

        }

        System.out.println("###################################################################");

        /*
         * Check that we have a file upload request
         */
        try {
            
            isMultipart = ServletFileUpload.isMultipartContent(request);
            System.out.println("isMultipart:: " + isMultipart);
            response.setContentType("text/html;charset=UTF-8");

            DiskFileItemFactory factory = new DiskFileItemFactory();

            /*
             * maximum size that will be stored in memory
             */
            factory.setSizeThreshold(maxMemSize);

            /*
             * Location to save data that is larger than maxMemSize.
             */
            factory.setRepository(new File(tempPath));

            /*
             * Create a new file upload handler
             */
            ServletFileUpload upload = new ServletFileUpload(factory);
            /*
             * maximum file size to be uploaded.
             */

            //  upload.setSizeMax(maxFileSize);

            /*
             * Parse the request to get file items.
             */
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {

                    /*
                     * Process regular form field (input
                     * type="text|radio|checkbox|etc", select, etc).
                     * collect all data input from input fileds
                     */
                    String fieldname = item.getFieldName();
                    String fieldvalue = item.getString("UTF-8").trim();

                    System.out.println(fieldname + " >> " + fieldvalue);

                    switch (fieldname) {
                        case "bookID":
                            bookID = Integer.parseInt(fieldvalue);
                            break;
                        case "referenceNumber":
                            referenceNumber = fieldvalue;
                            System.out.println("referenceNumber   :" + referenceNumber);
                            break;
                        case "OrgTitle":
                            OrgTitle = fieldvalue;
                            System.out.println("OrgTitle   :" + OrgTitle);
                            break;
                        case "Publisher":
                            Publisher = fieldvalue;
                            System.out.println("Publisher   :" + Publisher);
                            break;
                        case "Genre":
                            Genre = fieldvalue;
                            System.out.println("Genre   :" + Genre);
                            break;
                        case "translationPublisher":
                            translationPublisher = fieldvalue;
                            System.out.println("translationPublisher   :" + translationPublisher);
                            break;
                        case "TransTitle":
                            TransTitle = fieldvalue;
                            System.out.println("TransTitle   :" + TransTitle);
                            break;
                        case "ISBN":
                            ISBN = fieldvalue;
                            System.out.println("ISBN   :" + ISBN);
                            break;
                        case "ISSN":
                            ISSN = fieldvalue;
                            System.out.println("ISSN   :" + ISSN);
                            break;

                    } // end switch

                } else {

                    //////////////////////////////////////////////////////////////
                    //  Process Application Form file field (input type="file") //
                    //////////////////////////////////////////////////////////////
                    String fieldname = item.getFieldName();
                    filename = FilenameUtils.getName(item.getName());

                    System.out.println("filename :" + filename + " :fieldname: ");

//                    if (!filename.isEmpty()) {
                    System.out.println("sending " + filename + " fieldname " + fieldname + "   to getCounter");

                    System.out.println("company " + Publisher);

                    System.out.println("Cover here we are");
                    filePath = tempPath + File.separator + yearInString + File.separator + Publisher + File.separator
                            + "Cover" + File.separator;
                    filesToBeMoved = filePath + filename;
                    System.out.println("Cover switch fileName: " + filename + " filePath " + filePath);

//                    }

                    /*
                     * create temporary Directory if it does not
                     * exist
                     */
                    System.out.println("fileName.equals 1 zero " + filename + " filePath " + filePath);
                    if (filename.isEmpty()) {
                        System.out.println("fileName.equals 2 zero filename.isEmpty " + filename + " filePath " + filePath);
                    } else {
                        File file = new File(filePath);
                        if (!file.exists()) {

                            file.mkdirs();
                        }
                        System.out.println("createTemporaryDirectory");
                        System.out.println("filePath: " + filePath + " filename: " + filename);
                        OutputStream outS = null;
                        InputStream filecontent = null;

                        try {
                            outS = new FileOutputStream(new File(filePath + filename));

                            filecontent = item.getInputStream();

                            message = message + " '" + filename + "' has been uploaded <br/>";

                            int read;
                            final byte[] bytes = new byte[1024];

                            while ((read = filecontent.read(bytes)) != -1) {
                                outS.write(bytes, 0, read);

                            }

                        } catch (FileNotFoundException fne) {

                            String errMsg = "<br/><br/>You either did not specify a file to upload or are "
                                    + "trying to upload a file to a protected or nonexistent "
                                    + "location.<br/> <br/><strong> ERROR:<strong> '" + fne.getMessage() + "' ";

                            request.setAttribute("message", " '<strong>" + filename + "</strong>" + errMsg);
                            request.getRequestDispatcher("/WEB-INF/views/uploadErrorResponse.jsp").forward(request, response);
                            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                                    new Object[]{fne.getMessage()});

                        } finally {

                            if (outS != null) {
                                outS.close();
                            }

                            if (filecontent != null) {
                                filecontent.close();
                            }
                        }


                        /*
                         * ReferenceNumber contains ApplicationNumber seperated
                         * by a "/"
                         * find the first occurrence of "/"
                         */
                        int iend = referenceNumber.indexOf("/");

                        /*
                         * get ApplicationNumber from ReferenceNumber
                         */
                        if (iend != -1) {
                            ApplicationNumber = Integer.parseInt(referenceNumber.substring(0, iend));
                            System.out.println("ApplicationNumber ---->> " + ApplicationNumber);
                        }

                        filePath = tempPath + File.separator + yearInString + File.separator + Publisher + File.separator + "Cover" + File.separator;

                        filesToBeMoved = filePath + filename;

                        String Cover = "Cover";      // Cover
                        String moveFileName = filename;      // translation sample.docx
                        String destinationDirectory = rootPath + File.separator + yearInString + File.separator + Publisher + File.separator
                                + ApplicationNumber + File.separator + Cover + File.separator;

                        String moveFile = destinationDirectory + moveFileName;

                        /*
                         * create directory if it does not exist
                         */
                        File directory = new File(destinationDirectory);

                        if (!directory.exists()) {

                            System.out.println("destinationDirectory :" + destinationDirectory);

                            directory.mkdirs();
                        }

                        System.out.println("sFile :" + filesToBeMoved);

                        File sFile = new File(filesToBeMoved);
                        File destDir = new File(destinationDirectory);

                        //  fileDir.add(moveFile);
                        FileUtils.moveFileToDirectory(sFile, destDir, true);

//                        String moveFileNameReplaced = moveFile.replace("/home/markus/public_html", "/~markus");
                        String moveFileNameReplaced = moveFile.replace("/home/glassfish/glassfish/domains/domain1/docroot/documents", "/documents");
                        System.out.println("updateCover:: shortArrayList " + moveFile);
                        try {
                            GrantApplicationDAO.updateCover(referenceNumber, moveFileName, moveFileNameReplaced);
                        } catch (DBException ex) {
                            Logger.getLogger(LibraryUpdate.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } // else

            }  // for (FileItem item : items)

        } catch (FileUploadException ex) {
            Logger.getLogger(LibraryUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }

        Library library = new Library();

        System.out.println("bookID : " + bookID);

        library.setReferenceNumber(referenceNumber);
        library.setTitle(OrgTitle);
        library.setPublisher(Publisher);
        library.setGenre(Genre);
        library.setTranslationPublisher(translationPublisher);
        library.setTranslationTitle(TransTitle);
        library.setISBN(ISBN);
        library.setISSN(ISSN);
        library.setLASTUPDATED(timestamp);

        try {
            LibraryDAO.updateLibrary2(library, bookID);
        } catch (DBException ex) {
            Logger.getLogger(LibraryUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        message = " Test message";
        System.out.println("message : " + message);
        
        
        request.setAttribute("message", message);
        request.getRequestDispatcher("/WEB-INF/views/response.jsp").forward(request, response);
//        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/response.jsp");
//        rd.forward(request, response);
        System.out.println("success");
        
    }
}
