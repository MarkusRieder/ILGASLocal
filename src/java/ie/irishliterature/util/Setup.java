package ie.irishliterature.util;

public class Setup {

//    public static final String DB_URL = "jdbc:mysql://localhost:3306/ILGAS?autoReconnect=true&useSSL=false&useUnicode=yes&charset=UTF-8";
    public static final String DB_URL = "jdbc:mysql://localhost:3306/ILGAS?" + "zeroDateTimeBehavior=convertToNull&autoReconnect=true&useSSL=false&useUnicode=yes&charset=UTF-8&serverTimezone=Europe/Dublin";
    public static final String JDBC_DRIVER = "com.mysql.jdbc.jdbc2.optional.MysqlDataSource";
//      public static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    //            Class.forName( "com.mysql.jdbc.Driver" );
    public static final String DB_USERNAME = "root";
    public static final String DB_PASSWORD = "ankh573";
    public static final String MAIL_USERNAME = "markus@rieder.ie"; // like example@outlook.com
    public static final String MAIL_PASSWORD = "?lZTPB6_Heke";  // your mail password here
    public static final String MAIL_SMTP_HOST = "lh30.dnsireland.com"; // smtp.live.com
    public static final String MAIL_REGISTRATION_SITE_LINK = "https://www.literatureirelandgrantapplication.com/ILGAS/VerifyRegisteredEmailHash";
    public static final String VERSION = "1.6.4 #171";
    public static final String CREDIT = "2017-2021 mgr Software";

    // getter function;
    // name modified to make it clear, later on, 
    // that I am calling this function
    // and not accessing the constant
    public String VERSION() {
        return VERSION;
    }

    public String CREDIT() {
        return CREDIT;
    }
}
