/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.model;

/**
 *
 * @author markus
 */
public class Genres {

    private int idgenres;
    private String genre;

    /**
     * @return the idgenres
     */
    public int getIdgenres()
    {
        return idgenres;
    }

    /**
     * @param idgenres the idgenres to set
     */
    public void setIdgenres( int idgenres )
    {
        this.idgenres = idgenres;
    }

    /**
     * @return the genre
     */
    public String getGenre()
    {
        return genre;
    }

    /**
     * @param genre the genre to set
     */
    public void setGenre( String genre )
    {
        this.genre = genre;
    }

}
