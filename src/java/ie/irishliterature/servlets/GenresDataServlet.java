/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ie.irishliterature.DataTables.DataTableGenres;
import ie.irishliterature.dao.GenresDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Genres;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author markus
 */
@WebServlet(name = "GenresDataServlet", urlPatterns = {"/GenresDataServlet"})
public class GenresDataServlet extends HttpServlet {

    public GenresDataServlet() {

        super();
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

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        List<Genres> listGenres = null;

        try {

            listGenres = GenresDAO.getAllGenres();

//              System.out.println("listExpertReader:  " + listExpertReader);
        } catch (DBException ex) {
            Logger.getLogger(GenresDataServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        DataTableGenres dter = new DataTableGenres();
        dter.setAaData(listGenres);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(dter);
        System.out.println("json:  " + json);
        out.print(json);
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

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
