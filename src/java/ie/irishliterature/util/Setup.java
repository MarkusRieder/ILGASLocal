package ie.irishliterature.util;

//http://blog.sodhanalibrary.com/2015/11/user-email-registration-using-java.html#.XA0soxCYRxA
public class Setup {

    public static final String DB_URL = "jdbc:mysql://localhost:3306/ILGAS?autoReconnect=true&useSSL=false&useUnicode=true&charset=UTF-8";

//    public static final String DB_URL = "jdbc:mysql://localhost:3306/ILGAS";
    public static final String DB_USERNAME = "root";
    public static final String DB_PASSWORD = "ankh573";
    public static final String MAIL_USERNAME = "markus@rieder.ie"; // like example@outlook.com
    public static final String MAIL_PASSWORD = "Or10Nn3bu7a";  // your mail password here
    public static final String MAIL_SMTP_HOST = "lh30.dnsireland.com"; // smtp.live.com
//    public static final String MAIL_REGISTRATION_SITE_LINK = "http://localhost:8080/ILGAS/VerifyRegisteredEmailHash";
    public static final String MAIL_REGISTRATION_SITE_LINK = "http://localhost:8080/ILGASLocal/VerifyRegisteredEmailHash";
    //  public static final String MAIL_REGISTRATION_SITE_LINK = "http://localhost:8080/demos/index.jsp";
}
