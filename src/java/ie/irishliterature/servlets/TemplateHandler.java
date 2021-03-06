package ie.irishliterature.servlets;

import com.google.gson.Gson;
import ie.irishliterature.entities.JSONFileUpload;
import ie.irishliterature.helpers.UploadHelper;
import ie.irishliterature.helpers.WriteTemplates;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Markus Rieder
 */
@WebServlet( name = "templateHandler", urlPatterns =
{
    "/templateHandler"
} )
@MultipartConfig(
         fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class TemplateHandler extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public TemplateHandler()
    {
        super();
        System.out.println( "TemplateHandler" );
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     * * @param editor1  contains the edited text
     * * @param action   defines the action to take
     *
     * If editor is NOT null then doGet_SaveTemplate is run
     *
     * If editor1 is null then 'actions' are performed
     *
     *
     * TemplateHandler has three doGet methods and one doPost methods
     *
     * doGet_Home - return to index.jsp
     * doGet_OpenFile - open the selected template
     * doGet_SaveTemplate - save the template
     *
     *
     * doPost_Upload - actually not used
     *
     */
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        String editor1 = request.getParameter( "editor1" );

        if ( editor1 == null )
        {
            System.out.println( "doGet editor1 == null " );

            String action = request.getParameter( "action" );
            System.out.println( "doGet action " + action );

            if ( action == null )
            {
                doGet_Home( request, response );
            } else
            {
                doGet_OpenFile( request, response );
            }
        } else
        {
            System.out.println( "doGet editor1 != null " );
            doGet_SaveTemplate( request, response );
        }
    }

    protected void doGet_Home( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
        System.out.println( "doGet_Home " );
        request.getRequestDispatcher( "welcome_Staff_1.jsp" ).forward( request, response );
    }

    protected void doGet_OpenFile( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        response.setContentType( "text/html" );
        response.setCharacterEncoding( "UTF-8" );

        PrintWriter pw = response.getWriter();

        String filename = request.getParameter( "filename" );

        System.out.println( "doGet_OpenFile filename:  " + request.getParameter( "filename" ) );
        BufferedReader br = new BufferedReader( new FileReader( filename ) );

        String mailBody = readContentFromFile( filename );
        String str;
        while ( ( str = br.readLine() ) != null )
        {
            pw.println( str );
        }

        br.close();
        pw.close();

        String salutationAll = "";
        Pattern regex = Pattern.compile( "(\\[)(.*?)(<!-- \\[SALUTATION\\]\\=\\{.*?\\} -->\\])" );
        Matcher m = regex.matcher( mailBody );
        if ( m.find() )
        {
            System.out.println( "doGet_OpenFile m.group() :  " + m.group() );
            salutationAll = m.group();

        }
        Pattern salutationRegex = Pattern.compile( "(\\[)(.*?)(\\<)" );
        Matcher matcherSalutation = salutationRegex.matcher( salutationAll );
        if ( matcherSalutation.find() )
        {
            System.out.println( "doGet_OpenFile m.group() :  " + matcherSalutation.group() );
            String salutation = matcherSalutation.group();
            salutation = salutation.substring( 1, salutation.length() - 1 );
            System.out.println( "doGet_OpenFile salutation :  " + salutation );
            String[] roleNames =
            {
                "First_Name", "Last_Name", "Full_Name"
            };
            request.setAttribute( "roleNames", roleNames );
            request.setAttribute( "selectedRole", salutation );
        }
    }

    protected void doGet_SaveTemplate( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {
        System.out.println( "doGet_SaveTemplate " );

        String mailBody = request.getParameter( "editor1" );
        String fileName = request.getParameter( "fileName" );
        String from = request.getParameter( "from" );
        String salutation = request.getParameter( "salutation" );
        System.out.println( "doGet_SaveTemplate mailBody before :  " + mailBody );

//        String salutationRegex = "(\\[SALUTATION\\]\\=\\{)(.*?)(})";
//        String replacedSalutation = mailBody.replaceAll(salutationRegex, "$1" + salutation + "$3");
        String salutationRegex = "(\\[)(.*?)(<!-- \\[SALUTATION\\]\\=\\{.*?\\} -->\\])";
        String replacedSalutation = mailBody.replaceAll( salutationRegex, "$1" + salutation + "$3" );

        String emailRegex = "(\\[EMAILADDRESS\\]\\=\\{)(.*?)(})";
//        String emailRegex = "(\\[)(.*?)(<!-- \\[EMAILADDRESS\\]\\=\\{.*?\\} -->\\])";
        String replacedEmail = replacedSalutation.replaceAll( emailRegex, "$1" + from + "$3" );

        String loginRegex = "(\\[LOGIN\\]\\=\\{)(.*?)(})";
        String replacedLogin = replacedEmail.replaceAll( loginRegex, "$1" + salutation + "$3" );

        System.out.println( "doGet_SaveTemplate from:  " + from );
        System.out.println( "doGet_SaveTemplate salutation:  " + salutation + " \r\n" );
        System.out.println( "doGet_SaveTemplate fileName:  " + request.getParameter( "fileName" ) + " \r\n" );
        System.out.println( "WriteTemplates:  \r\n" );

        WriteTemplates.writeStrTxt( replacedLogin, fileName );

        request.getRequestDispatcher( "/WEB-INF/views/welcome_Staff_1.jsp" ).forward( request, response );
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
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        String action = request.getParameter( "action" );
        System.out.println( "doPost action " + action );

        if ( action.equalsIgnoreCase( "upload" ) )
        {
            doPost_Upload( request, response );
        }
    }

    protected void doPost_Upload( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException
    {

        String fileName = UploadHelper.upload( "assets/uploads", request );
        System.out.println( "doPost fileName " + fileName );
        Gson gson = new Gson();
        try ( PrintWriter out = response.getWriter() )
        {
            out.print( gson.toJson( new JSONFileUpload( "./assets/uploads/" + fileName ) ) );
            out.flush();
        }
    }

    //Method to read HTML file as a String 
    private String readContentFromFile( String fileName )
    {
        StringBuffer contents = new StringBuffer();

        try
        {
            //use buffering, reading one line at a time
            BufferedReader reader = new BufferedReader( new FileReader( fileName ) );
            try
            {
                String line = null;
                while ( ( line = reader.readLine() ) != null )
                {
                    contents.append( line );
                    contents.append( System.getProperty( "line.separator" ) );
                }
            } finally
            {
                reader.close();
            }
        } catch ( IOException ex )
        {
            ex.printStackTrace();
        }
        return contents.toString();

    }
}
