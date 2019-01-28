package ie.irishliterature.emailRegistration;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import ie.irishliterature.dao.ApplicationDAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.Status;
import ie.irishliterature.model.User;
import ie.irishliterature.util.BCrypt;
import ie.irishliterature.util.GlobalConstants;
import ie.irishliterature.util.MailUtil;
import ie.irishliterature.util.Utils;

/**
 * Servlet implementation class RegisterEmail
 */
@WebServlet("/RegisterEmail")
public class RegisterEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(RegisterEmail.class.getName());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterEmail() {
        super();
    }

	/**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// collect all input values
		String email = request.getParameter("inputEmail");
		String firstName = request.getParameter("inputFirstName");
		String lastName = request.getParameter("inputLastName");
		String password = request.getParameter("inputPassword");
		Status sp = new Status(); 
		String output = "";
	    if(!validate(email, firstName, lastName, password)) {
	    	sp.setCode(-1);
			sp.setMessage("Invalid Input");
			output = Utils.toJson(sp);
		} else {
			User up = new User();
			up.setEMAIL(email);
			up.setFIRST_NAME(firstName);
			up.setLAST_NAME(lastName);
			
			// generate hash for password
			up.setPASSWORD(BCrypt.hashpw(password,GlobalConstants.SALT));
			
			// generate hash code for email verification
			String hash = Utils.prepareRandomString(30);
			
			// generate hash for password
			up.setEMAIL_VERIFICATION_HASH(BCrypt.hashpw(hash, GlobalConstants.SALT));
		    try {
		    	
		    	// check whether email exists or not
		    	if(!ApplicationDAO.isEmailExists(email)) {
		    		// create account if email not exists
		    		int id = ApplicationDAO.insertRow(up);
                                
                                String strID = id + "";
		    		// send verification email
					MailUtil.sendEmailRegistrationLink(strID, email, hash);
					sp.setCode(0);
					sp.setMessage("Registation Link Was Sent To Your Mail Successfully. Please Verify Your Email");
					output = Utils.toJson(sp);
		    	} else {
		    		// tell user that the email already in use
		    		sp.setCode(-1);
					sp.setMessage("This Email was already registered");
					output = Utils.toJson(sp);
		    	}
				
			} catch (DBException|MessagingException e) {
			    LOGGER.debug(e.getMessage());
				sp.setCode(-1);
				sp.setMessage(e.getMessage());
				output = Utils.toJson(sp);
			}	
		}
	    // send output to user
	    PrintWriter pw = response.getWriter();
	    pw.write(output);
	    pw.flush();
	    pw.close();
	}
	
	public static boolean validate(String email, String firstName, String lastName, String password) {
		if(email == null) {
			return false;
		}
		if(firstName == null) {
			return false;
		}
		if(lastName == null) {
			return false;
		}
		if(password == null) {
			return false;
		}
		return true;
	}
}
