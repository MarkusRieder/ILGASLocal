package ie.irishliterature.emailRegistration;

import ie.irishliterature.dao.ApplicationDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.User;
import ie.irishliterature.util.BCrypt;
import ie.irishliterature.util.GlobalConstants;
import ie.irishliterature.util.MailUtil;
import ie.irishliterature.util.Utils;
import java.io.IOException;
import java.util.Enumeration;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class VerifyRegisteredEmailHash
 */
@WebServlet( "/VerifyRegisteredEmailHash" )
public class VerifyRegisteredEmailHash extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger( VerifyRegisteredEmailHash.class.getName() );

    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyRegisteredEmailHash() {
        super();
    }

    /**
     * @param request
     * @param response
     *
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        // get user Id and email verification code Hash code  

//        https://www.literatureirelandgrantapplication.com/VerifyRegisteredEmailHash?scope=resetPassword&userId=pipo&hash=j2nat7smt4n3rogltdsbibj2bv9xxl
        String uname = request.getParameter( "userId" );
        String firstName = request.getParameter( "inputFirstName" );
        String lastName = request.getParameter( "inputLastName" );
        String fullName = firstName + " " + lastName;
        System.out.println( "VerifyRegisteredEmailHash doGet username 1 : " + uname );
        String hash = BCrypt.hashpw( request.getParameter( "hash" ), GlobalConstants.SALT );
        String scope = request.getParameter( "scope" );

        System.out.println( "VerifyRegisteredEmailHash doGet username 1 : " + uname + " scope " + scope + " hash " + hash + " " + " " );

//        PrintWriter out = response.getWriter();
        response.setContentType( "text/plain" );
        
        Enumeration<String> parameterNames = request.getParameterNames();

        while ( parameterNames.hasMoreElements() ) {

            String paramName = parameterNames.nextElement();
             System.out.println( "VerifyRegisteredEmailHash paramName " + paramName );
//            out.write( paramName );
//            out.write( "n" );

            String[] paramValues = request.getParameterValues( paramName );
            for ( int i = 0; i < paramValues.length; i++ ) {
                String paramValue = paramValues[i];
                System.out.println( "VerifyRegisteredEmailHash paramValue " + paramValue );
//                out.write( "t" + paramValue );
//                out.write( "n" );
            }

        }
//        out.close();

        String message = null;

        System.out.println( "############################ /VerifyRegisteredEmailHash #######################################  " );

        HttpSession session = request.getSession();
        System.out.println( "Iterate Parameters" );
        Enumeration en = request.getParameterNames();

        while ( en.hasMoreElements() ) {
            Object objOri = en.nextElement();

            String param = ( String ) objOri;

            String value = request.getParameter( param );

            System.out.println( "Parameter Name is '" + param + "' and Parameter Value is '" + value + "'\n" );

        }

        System.out.println( "Enumeration keys   " );
        Enumeration keys = session.getAttributeNames();
        while ( keys.hasMoreElements() ) {
            String key = ( String ) keys.nextElement();
            System.out.println( "key  :" + key + ": " + session.getValue( key ) );

        }

        System.out.println( "###################################################################" );

        try {
            // verify with database
            if ( ApplicationDAO.verifyEmailHash( uname, hash ) && scope.equals( GlobalConstants.ACTIVATION ) ) {
                //update status as active

                System.out.println( "VerifyRegisteredEmailHash doGet username 2 : " + uname );

                ApplicationDAO.updateStatus( uname, "active" );

                message = "Email verified successfully. Account has been activated. Click <a href=\"index.jsp\">here</a> to login.";

                //  request.getRequestDispatcher("/WEB-INF/views/emailValidationSuccess.jsp").forward(request, response);
            }
            else if ( ApplicationDAO.verifyEmailHash( uname, hash ) && scope.equals( GlobalConstants.RESET_PASSWORD ) ) {
                System.out.println( "VerifyRegisteredEmailHash doGet username 3 : " + uname );
//                  does not write new password 
                //update status as active
                ApplicationDAO.updateStatus( uname, "active" );
                //put some session for user
                request.getSession().setAttribute( GlobalConstants.USER, uname );
                request.getSession().setAttribute( GlobalConstants.IS_RESET_PASSWORD_VERIFIED, GlobalConstants.YES );
                request.getRequestDispatcher( "/WEB-INF/views/resetPassword.html" ).forward( request, response );
            }
            else {
                //now increment verification attempts 
                int attempts = ApplicationDAO.incrementVerificationAttempts( uname );
                if ( attempts == 20 ) {
                    // reset verification code if attempts equal to 20 
                    String hashcode = Utils.prepareRandomString( 30 );
                    ApplicationDAO.updateEmailVerificationHash( uname, BCrypt.hashpw( hashcode, GlobalConstants.SALT ) );
                    User up = ApplicationDAO.selectUSER( uname );
                    MailUtil.sendEmailRegistrationLink( uname, fullName, up.getEMAIL(), hashcode );
                    message = "20 times Wrong Email Validation Input Given. So we are sent new activation link to your Email";
                }
                else {
                    message = "Wrong Email Validation Input";
                }
            }
        }
        catch ( DBException e ) {
            LOGGER.debug( e.getMessage() );
            message = e.getMessage();
        }
        catch ( AddressException e ) {
            message = e.getMessage();
            LOGGER.debug( e.getMessage() );
        }
        catch ( MessagingException e ) {
            message = e.getMessage();
            LOGGER.debug( e.getMessage() );
        }
        if ( message != null ) {
            request.setAttribute( GlobalConstants.MESSAGE, message );
            request.getRequestDispatcher( "/messageToUser.jsp" ).forward( request, response );
        }
    }

}
