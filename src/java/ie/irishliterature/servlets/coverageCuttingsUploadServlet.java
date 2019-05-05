/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;
import ie.irishliterature.dao.GrantApplicationDAO;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Enumeration;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author markus
 */
@WebServlet(name = "coverageCuttingsUploadServlet", urlPatterns = {"/coverageCuttingsUploadServlet"})
public class coverageCuttingsUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final static Logger LOGGER
            = Logger.getLogger(coverageCuttingsUploadServlet.class.getCanonicalName());

    public coverageCuttingsUploadServlet() {

        super();
    }

    String ReferenceNumber = null;
    String company = "";

    String tempPath = "/home/glassfish/glassfish/domains/domain1/tempDir";
    String rootPath = "/home/glassfish/glassfish/domains/domain1/docroot/documents";

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

        System.out.println("#########################  doGet  #########################");
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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        System.out.println("#########################  /coverageCuttingsUploadServlet  #########################");
        
///documents/2019/null/23/CoverageCuttings/The Sailors_ Rendezvous.jpg
//
//#########################  /coverageCuttingsUploadServlet  #########################]]
//
//coverageCuttingsUploadServlet Parameter Name is 'ReferenceNumber' and Parameter Value is '23/2019']]
//
//coverageCuttingsUploadServlet Parameter Name is 'publisherName' and Parameter Value is 'Discworld Publishing']]
//
//ApplicationNumber ---->> 23]]
//
//company ---->> null]]
//
//destinationDirectory  /home/glassfish/glassfish/domains/domain1/docroot/documents/2019/null/23/CoverageCuttings/]]
//
//Multipart size: 6]]
//
//Part : The Sailors_ Rendezvous.jpg]]
//
//  #########################  /coverageCuttingsUploadServlet  #########################]]
//  coverageCuttingsUploadServlet Parameter Name is 'ReferenceNumber' and Parameter Value is '23/2019']]
//  coverageCuttingsUploadServlet Parameter Name is 'publisherName' and Parameter Value is 'Discworld Publishing']]




        Enumeration en = request.getParameterNames();

        while (en.hasMoreElements()) {
            Object objOri = en.nextElement();

            String param = (String) objOri;

            String value = request.getParameter(param);
            if("publisherName".equals(param)){
                 company = request.getParameter(param);
            }
          if("ReferenceNumber".equals(param)){
                 ReferenceNumber = request.getParameter(param);
            }
            System.out.println("coverageCuttingsUploadServlet Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n");

        }

        Enumeration<String> attributes = request.getSession().getAttributeNames();
        while (attributes.hasMoreElements()) {
            String attribute = attributes.nextElement();
            System.out.println("coverageCuttingsUploadServlet attribute '" + attribute + " and Parameter Value is " + request.getSession().getAttribute(attribute));
        }
        

       


        /*
         * ReferenceNumber contains ApplicationNumber seperated
         * by a "/"
         * find the first occurrence of "/"
         */
        int iend = ReferenceNumber.indexOf("/");

        /*
         * get ApplicationNumber from ReferenceNumber
         * get yearInString from ReferenceNumber
         */
        String ApplicationNumber = ReferenceNumber.substring(0, iend);
        String yearInString = ReferenceNumber.substring(iend, ReferenceNumber.length());
        
        
        System.out.println("ApplicationNumber ---->> " + ApplicationNumber);
        System.out.println("company ---->> " + company);
        
        
        PrintWriter out = response.getWriter();

        String destinationDirectory = rootPath + yearInString + File.separator + company + File.separator
                + ApplicationNumber + File.separator + "CoverageCuttings" + File.separator;

        System.out.println("destinationDirectory  " + destinationDirectory);
        String moveFileName = null;
        String fn = null;

        ServletContext context = request.getSession().getServletContext();
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                String fileName = null;
                String filePath;
                Type type = null;
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                System.out.println("Multipart size: " + multiparts.size());
                for (FileItem item : multiparts) {
                    if (item.getName() == null || "".equals(item.getName())) {
                        System.out.println("item.getName() == null ");
                        continue;
                    }
                    System.out.println("Part : " + item.getName());
                    if (!item.isFormField()) {
                        fileName = new File(item.getName()).getName();
                        System.out.println("fileName " + fileName);
                        type = getType(fileName);
                        System.out.println("type " + type);
                        filePath = destinationDirectory;
                        System.out.println("filePath " + filePath);
                        if (type != null) {
                            System.out.println("File item.write " + filePath + fileName);
                            /*
                             * create directory if it does not exist
                             */
                            File directory = new File(filePath);
                            if (!directory.exists()) {

                                System.out.println("destinationDirectory :" + filePath + " does not exist");
                                System.out.println("destinationDirectory :" + filePath);

                                directory.mkdirs();
                                System.out.println("destinationDirectory :" + filePath + " created!");
                            }
                            item.write(new File(filePath + fileName));
                            System.out.println("File uploaded successfully");
                            String ext = FilenameUtils.getExtension(fileName);
                            if ("pdf".equals(ext)) {
                                /*
                                 * if we have a pfd-file we need thumbfiles
                                 * (jpg)
                                 *
                                 *
                                 */

                                String thumbDestinationDirectory = rootPath + yearInString + File.separator + company + File.separator
                                        + ApplicationNumber + File.separator + "CoverageCuttings" + File.separator + "Thumbs" + File.separator;

                                String moveFile = destinationDirectory + fileName;

                                System.out.println("CoverageCuttings thumbDestinationDirectory  " + thumbDestinationDirectory);
                                System.out.println("CoverageCuttings filePath  " + thumbDestinationDirectory + " moveFile " + moveFile);

                                File pdfFile = new File(moveFile);

                                RandomAccessFile raf = new RandomAccessFile(pdfFile, "r");
                                FileChannel channel = raf.getChannel();
                                ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
                                PDFFile pdf = new PDFFile(buf);
                                PDFPage page = pdf.getPage(0);

                                // create the image
                                Rectangle rect = new Rectangle(0, 0, (int) page.getBBox().getWidth(),
                                        (int) page.getBBox().getHeight());
                                BufferedImage bufferedImage = new BufferedImage(rect.width, rect.height,
                                        BufferedImage.TYPE_INT_RGB);

                                Image image = page.getImage(rect.width, rect.height, // width & height
                                        rect, // clip rect
                                        null, // null for the ImageObserver
                                        true, // fill background with white
                                        true // block until drawing is done
                                );
                                Graphics2D bufImageGraphics = bufferedImage.createGraphics();
                                bufImageGraphics.drawImage(image, 0, 0, null);

                                String basename = FilenameUtils.getBaseName(fileName);
                                String extension = FilenameUtils.getExtension(fileName);
                                String jpgFile = basename + ".jpg";

                                System.out.println("basename  " + basename); // file
                                System.out.println("extension  " + extension); // txt (NOT ".txt" !)
                                System.out.println("jpgFile  " + jpgFile); // txt (NOT ".txt" !)

                                moveFile = thumbDestinationDirectory + jpgFile;
                                System.out.println("jpgFile moveFile :" + moveFile);

                                //     shortArrayList.add(moveFile);
                                directory = new File(thumbDestinationDirectory);

                                if (!directory.exists()) {

                                    System.out.println("jpgFile destinationDirectory :" + thumbDestinationDirectory);

                                    directory.mkdirs();
                                }

                                String thumbFile = basename + "_thumb.jpg";
                                System.out.println("thumbFile :" + thumbFile);
                                ImageIO.write(bufferedImage, "JPG", new File(moveFile));

                                BufferedImage img = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
                                img.createGraphics().drawImage(ImageIO.read(new File(moveFile)).getScaledInstance(100, 100, Image.SCALE_SMOOTH), 0, 0, null);
                                ImageIO.write(img, "jpg", new File(thumbFile));
                                moveFile = thumbDestinationDirectory + thumbFile;

                                File sFile = new File(thumbFile);
                                File destDir = new File(thumbDestinationDirectory);

                                FileUtils.moveFileToDirectory(sFile, destDir, true);

                                System.out.println("BufferedImage jpgFile moveFile :" + moveFile);
                            }
                        } else {
                            throw new IllegalStateException("Wrong file format!");
                        }

                        /*
                         * That's where the moveFileName has been written to
                         * disk
                         * /home/markus/public_html/test/2019/Discworld
                         * Publishers/50/CoverageCuttings/test.pdf
                         */
                        moveFileName = filePath + fileName;
                        System.out.println(">>>  CoverageCuttings::  moveFileName " + moveFileName);
                        /*
                         * before writing to database we need to make some
                         * changes to the path
                         * moveFileName.replace("/home/markus/public_html",
                         * "/~markus");
                         * so we have
                         * /~markus/test/2019/Discworld
                         * Publishers/50/CoverageCuttings/test.pdf
                         */
                        String moveFileNameReplaced = moveFileName.replace("/home/glassfish/glassfish/domains/domain1/docroot/documents", "/documents");
                        System.out.println(">>>  CoverageCuttings::  moveFileNameReplaced " + moveFileNameReplaced);

                        System.out.println(">>>  CoverageCuttings::  moveFileNameReplaced " + moveFileNameReplaced + " moveFileName " + moveFileName);
                        System.out.println(">>>  CoverageCuttings::  fileName " + fileName);

                        GrantApplicationDAO.insertCoverageCuttings(ReferenceNumber, fileName, moveFileNameReplaced);
                    } else {
                        System.out.println("item.isFormField() ");
                    }
                }
                // response.getWriter().print(json.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Sorry this Servlet only handles file upload request");
        }

        response.setContentType("application/json");
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(fn);
        System.out.println("json:  " + json);
        out.print(json);

        out.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    enum Type {

        IMAGES("/home/glassfish/glassfish/domains/domain1/tempDir", ".jpg", ".bmp", ".gif", ".png", ".jpeg", ".pdf"),
        VIDEOS("/upload/videos", ".avi", ".mpeg", ".mpg", ".mp4", ".mov", ".mkv", ".flv"),
        MUSICS("/upload/musics", ".mp3", ".wav");

        private String path;
        private String[] formats;

        Type(String path, String... format) {
            this.path = path;
            this.formats = format;
        }

        public String[] getFormats() {
            return formats;
        }

        public String getPath() {
            return path;
        }
    }

    private static String parseFileFormat(String fileName) {
        fileName = fileName.toLowerCase();
        int dotPosition = fileName.lastIndexOf(".");
        String format = fileName.substring(dotPosition, fileName.length());
        return format;
    }

    private Type getType(String fileName) {
        String format = parseFileFormat(fileName);
        Type[] values = Type.values();
        for (int i = 0; i < values.length; i++) {
            for (int j = 0; j < values[i].getFormats().length; j++) {
                if (values[i] == Type.IMAGES && values[i].getFormats()[j].equals(format)) {
                    System.out.println("Type.IMAGES " + Type.IMAGES);
                    return Type.IMAGES;
                } else if (values[i] == Type.VIDEOS && values[i].getFormats()[j].equals(format)) {
                    return Type.VIDEOS;
                } else if (values[i] == Type.MUSICS && values[i].getFormats()[j].equals(format)) {
                    return Type.MUSICS;
                }
            }
        }
        return null;
    }

    public static String getBody(HttpServletRequest request) throws IOException {

        String body = null;
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = null;

        try {
            InputStream inputStream = request.getInputStream();
            if (inputStream != null) {
                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
                    stringBuilder.append(charBuffer, 0, bytesRead);
                }
            } else {
                stringBuilder.append("");
            }
        } catch (IOException ex) {
            throw ex;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }

        body = stringBuilder.toString();
        return body;
    }
}
