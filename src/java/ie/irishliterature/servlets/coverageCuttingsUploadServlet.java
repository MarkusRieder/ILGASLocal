/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author markus
 */
@WebServlet(name = "coverageCuttingsUploadServlet", urlPatterns = {"/coverageCuttingsUploadServlet"})
public class coverageCuttingsUploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet coverageCuttingsUploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet coverageCuttingsUploadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        processRequest(request, response);
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
                        continue;
                    }
                    System.out.println("Part : " + item.getName());
                    if (!item.isFormField()) {
                        fileName = new File(item.getName()).getName();
                        type = getType(fileName);
                        filePath = context.getRealPath(type.path);
                        if (type != null) {
                            SecureRandom random = new SecureRandom();
                            fileName = new BigInteger(130, random).toString(32)
                                    + parseFileFormat(fileName);
                            item.write(new File(filePath + File.separator + fileName));
                            System.out.println("File uploaded successfully");
                            // System.out.println("File path: " + context.getRealPath(type.path));
                        } else {
                            throw new IllegalStateException("Wrong file format!");
                        }
                    }
                }
                // response.getWriter().print(json.toString());
            } catch (Exception e) {
            }
        } else {
            System.out.println("Sorry this Servlet only handles file upload request");
        }
        response.setContentType("application/json");
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

    IMAGES("/upload/images", ".jpg", ".bmp", ".gif", ".png", ".jpeg"),
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
}
