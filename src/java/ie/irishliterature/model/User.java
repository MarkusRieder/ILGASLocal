package ie.irishliterature.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class User implements HttpSessionBindingListener, Serializable {

    private String USER_ID;

    private String USERNAME;

    private String EMAIL;

    private String FIRST_NAME;

    private String LAST_NAME;

    private String Full_NAME;

    private String EMAIL_VERIFICATION_HASH;

    private int EMAIL_VERIFICATION_ATTEMPTS;

    private String PASSWORD;

    private String FUNCTION;

    private String ROLE;

    private String CREATED_TIME;

    private String STATUS;

    private String ReferenceNumber;
    
     private String initJSessionID;
    
    private boolean alreadyLoggedIn;
    
      private static Map<User, HttpSession> logins = new HashMap<User, HttpSession>();

    @Override
    public boolean equals(Object other) {
        return (other instanceof User) && (getUSERNAME() != null)
                ? getUSERNAME().equals(((User) other).getUSERNAME()) : (other == this);
    }

    @Override
    public int hashCode() {
        return (getUSERNAME() != null)
                ? (this.getClass().hashCode() + getUSERNAME().hashCode()) : super.hashCode();
    }

    @Override
    @SuppressWarnings("unchecked")
    public void valueBound(HttpSessionBindingEvent event) {
        System.out.println("\n" + " ############################ User valueBound #######################################" + "\n");
        Calendar calendar = Calendar.getInstance(); // Returns instance with current date and time set
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        System.out.println(formatter.format(calendar.getTime()));

        HttpSession oldSession = logins.get(this);
         System.out.println("User valueBound oldSession this " + this);
          System.out.println("User valueBound oldSession logins.get(this) " + logins.get(this));
        System.out.println("User valueBound oldSession " + oldSession);
        
        if (oldSession != null) {
            alreadyLoggedIn = true;
            System.out.println("User valueBound Called alreadyLoggedIn " + alreadyLoggedIn);
        } else {

            logins.put(this, event.getSession());
            System.out.println("User valueBound Called logins " + logins);
            System.out.println("User valueBound Called event.getSession() " + event.getSession());

        }

    }

    @Override
    @SuppressWarnings("unchecked")
    public void valueUnbound(HttpSessionBindingEvent event) {
        System.out.println("\n" + " ############################ User valueUnbound #######################################" + "\n");
        Calendar calendar = Calendar.getInstance(); // Returns instance with current date and time set
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        System.out.println(formatter.format(calendar.getTime()));

        logins.remove(this);

        System.out.println("User valueUnbound Called, " + event.getValue() + " Name: " + event.getName());
    }

    /**
     * @return the USER_ID
     */
    public String getUSER_ID()
    {
        return USER_ID;
    }

    /**
     * @param USER_ID the USER_ID to set
     */
    public void setUSER_ID( String USER_ID )
    {
        this.USER_ID = USER_ID;
    }

    public String getUSERNAME()
    {
        return USERNAME;
    }

    public void setUSERNAME( String USERNAME )
    {
        this.USERNAME = USERNAME;
    }

    public String getEMAIL()
    {
        return EMAIL;
    }

    public void setEMAIL( String EMAIL )
    {
        this.EMAIL = EMAIL;
    }

    public String getFIRST_NAME()
    {
        return FIRST_NAME;
    }

    public void setFIRST_NAME( String FIRST_NAME )
    {
        this.FIRST_NAME = FIRST_NAME;
    }

    public String getLAST_NAME()
    {
        return LAST_NAME;
    }

    public void setLAST_NAME( String LAST_NAME )
    {
        this.LAST_NAME = LAST_NAME;
    }

    public String getEMAIL_VERIFICATION_HASH()
    {
        return EMAIL_VERIFICATION_HASH;
    }

    public void setEMAIL_VERIFICATION_HASH( String EMAIL_VERIFICATION_HASH )
    {
        this.EMAIL_VERIFICATION_HASH = EMAIL_VERIFICATION_HASH;
    }

    public int getEMAIL_VERIFICATION_ATTEMPTS()
    {
        return EMAIL_VERIFICATION_ATTEMPTS;
    }

    public void setEMAIL_VERIFICATION_ATTEMPTS( int EMAIL_VERIFICATION_ATTEMPTS )
    {
        this.EMAIL_VERIFICATION_ATTEMPTS = EMAIL_VERIFICATION_ATTEMPTS;
    }

    public String getPASSWORD()
    {
        return PASSWORD;
    }

    public void setPASSWORD( String PASSWORD )
    {
        this.PASSWORD = PASSWORD;
    }

    public String getFUNCTION()
    {
        return FUNCTION;
    }

    public void setFUNCTION( String FUNCTION )
    {
        this.FUNCTION = FUNCTION;
    }

    public String getROLE()
    {
        return ROLE;
    }

    public void setROLE( String ROLE )
    {
        this.ROLE = ROLE;
    }

    public String getSTATUS()
    {
        return STATUS;
    }

    public void setSTATUS( String STATUS )
    {
        this.STATUS = STATUS;
    }

    public String getCREATED_TIME()
    {
        return CREATED_TIME;
    }

    public void setCREATED_TIME( String CREATED_TIME )
    {
        this.CREATED_TIME = CREATED_TIME;
    }

    /**
     * @return the Full_NAME
     */
    public String getFull_NAME()
    {
        return Full_NAME;
    }

    /**
     * @param Full_NAME the Full_NAME to set
     */
    public void setFull_NAME( String Full_NAME )
    {
        this.Full_NAME = Full_NAME;
    }

    /**
     * @return the ReferenceNumber
     */
    public String getReferenceNumber()
    {
        return ReferenceNumber;
    }

    /**
     * @param ReferenceNumber the ReferenceNumber to set
     */
    public void setReferenceNumber( String ReferenceNumber )
    {
        this.ReferenceNumber = ReferenceNumber;
    }

    /**
     * @return the initJSessionID
     */
    public String getInitJSessionID() {
        return initJSessionID;
    }

    /**
     * @param initJSessionID the initJSessionID to set
     */
    public void setInitJSessionID(String initJSessionID) {
        this.initJSessionID = initJSessionID;
    }
    
    /**
     * @return the alreadyLoggedIn
     */
    public boolean isAlreadyLoggedIn() {
        return alreadyLoggedIn;
    }

    /**
     * @param alreadyLoggedIn the alreadyLoggedIn to set
     */
    public void setAlreadyLoggedIn(boolean alreadyLoggedIn) {
        this.alreadyLoggedIn = alreadyLoggedIn;
    }


    @Override
    public String toString() {
        return "[USER_ID = " + getUSER_ID() + ", USERNAME = " + getUSERNAME() + ", EMAIL = " + getEMAIL() + ", FULL_NAME = " + getFull_NAME() + ", FIRST_NAME = " + getFIRST_NAME() + ", LAST_NAME = " + getLAST_NAME() + ", EMAIL_VERIFICATION_HASH = " + getEMAIL_VERIFICATION_HASH() + ", FUNCTION = " + getFUNCTION() + ", PASSWORD = " + getPASSWORD() + ", STATUS = " + getSTATUS() + " , InitJSessionID = " + getInitJSessionID() + " , CREATED_TIME = " + getCREATED_TIME() + "]";
    }

}
