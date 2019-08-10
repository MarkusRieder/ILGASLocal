package ie.irishliterature.helpers;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.apache.log4j.Logger;

/**
 *
 * @author Markus Rieder
 */

/*
 * WriteTemplates takes two parameters
 *
 * @param templateText - contains the edited text
 * @param fileName - ist the full path of the file edited
 *
 * WriteTemplates takes these parameters and writes the file
 */
public class WriteTemplates {

    private static final Logger LOGGER = Logger.getLogger(WriteTemplates.class.getName());

    public static void writeStrTxt(String templateText, String fileName) {
        FileWriter fileWriter;
        try {
            fileWriter = new FileWriter(new File(fileName));
            System.out.println(templateText);
            fileWriter.write(templateText);
            fileWriter.close();
        } catch (IOException e) {
            LOGGER.debug(e.getMessage());
        }
    }
}
