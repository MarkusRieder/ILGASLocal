/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.entities;

import java.io.Serializable;

/**
 *
 * @author markus
 */
public class JSONFileUpload implements Serializable {

    private static final long serialVersionUID = 1L;

    private String path;

    public JSONFileUpload(String path) {
        super();
            System.out.println("JSONFileUpload path " + path);
        this.path = path;
    }

    public JSONFileUpload() {
        super();
    }

    /**
     * @return the path
     */
    public String getPath() {
        return path;
    }

    /**
     * @param path the path to set
     */
    public void setPath(String path) {
        this.path = path;
    }
}
