package ie.irishliterature.dao;

import ie.irishliterature.db.DBConn;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.User;
import ie.irishliterature.util.GlobalConstants;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

public class UserDAO {

    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());

    public static User selectUSER(String uname) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        User pojo = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("select uname, EMAIL, FIRST_NAME, LAST_NAME, EMAIL_VERIFICATION_HASH, EMAIL_VERIFICATION_ATTEMPTS, STATUS, CREATED_TIME from ILGAS.users where uname = ?");
            ps.setString(1, uname);
            res = ps.executeQuery();
            if (res != null) {
                while (res.next()) {
                    pojo = new User();
                    pojo.setUSERNAME(res.getString(1));
                    pojo.setEMAIL(res.getString(2));
                    pojo.setFIRST_NAME(res.getString(3));
                    pojo.setLAST_NAME(res.getString(4));
                    pojo.setEMAIL_VERIFICATION_HASH(res.getString(5));
                    pojo.setEMAIL_VERIFICATION_ATTEMPTS(res.getInt(6));
                    pojo.setSTATUS(res.getString(7));
                    pojo.setCREATED_TIME(res.getString(8));
                }
            }

            DBConn.close(conn, ps, res);

        } catch (ClassNotFoundException | SQLException e) {
            DBConn.close(conn, ps, res);
            LOGGER.debug(e.getMessage());
            e.printStackTrace();
            throw new DBException("1 Excepion while accessing database");
        }

        return pojo;
    }

    public static boolean verifyEmailHash(String uname, String hash) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("select 1 from ILGAS.users where uname = ? and EMAIL_VERIFICATION_HASH = ?");
            ps.setString(1, uname);
            System.out.println("username dao verifyEmailHash: " + uname);
            ps.setString(2, hash);
            res = ps.executeQuery();
            if (res != null) {
                while (res.next()) {
                    verified = true;
                }
            }
            DBConn.close(conn, ps, res);
        } catch (ClassNotFoundException | SQLException e) {
            DBConn.close(conn, ps, res);
            LOGGER.debug(e.getMessage());
            throw new DBException("2 Excepion while accessing database");
        }

        return verified;
    }

    public static boolean isEmailExists(String uname) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("select 1 from ILGAS.users where uname = ?");
            ps.setString(1, uname);
            res = ps.executeQuery();
            if (res != null) {
                while (res.next()) {
                    verified = true;
                }
            }

            DBConn.close(conn, ps, res);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps, res);
            throw new DBException("3 Excepion while accessing database");
        }

        return verified;
    }

    public static String insertRow(User pojo) throws DBException {

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        String id = null;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            conn.setAutoCommit(false);
            ps1 = conn.prepareStatement("insert into ILGAS.users (uname,FIRST_NAME,LAST_NAME,PASSWORD,EMAIL,FUNCTION,ROLE, EMAIL_VERIFICATION_HASH) values (?,?,?,?,?,?,?,?.?)");
            ps1.setString(1, pojo.getUSERNAME());
            ps1.setString(2, pojo.getFIRST_NAME());
            ps1.setString(3, pojo.getLAST_NAME());
            ps1.setString(4, pojo.getPASSWORD());
            ps1.setString(5, pojo.getEMAIL());
            ps1.setString(6, pojo.getFUNCTION());
            ps1.setString(7, pojo.getROLE());
            ps1.setString(8, pojo.getEMAIL_VERIFICATION_HASH());

            String uname = pojo.getUSERNAME();
            System.out.println("uname dao insertRow: " + uname);

            String strF = pojo.getFUNCTION();
            System.out.println("strF: " + strF);

            String str = pojo.getPASSWORD();
            System.out.println("str: " + str);
            int len;
            len = str.length();
            System.out.println("length: " + len);

            String em = pojo.getEMAIL();
            System.out.println("em: " + em);

            ps1.executeUpdate();

            ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
            res = ps2.executeQuery();

            System.out.println("res: " + res);

            if (res != null) {
                while (res.next()) {
                    id = res.getString(1);
                }
            }

            conn.commit();
            DBConn.close(conn, ps1, ps2, res);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps1, ps2, res);
            throw new DBException("4 Excepion while accessing database");
        }

        return id;
    }

    public static void deleteRow(User pojo) {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("delete from users where uname = ?");
            ps.setString(1, pojo.getUSERNAME());
            ps.executeUpdate();
            ps.close();
            DBConn.close(conn, ps);

        } catch (SQLException | ClassNotFoundException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps);
        }
    }

    public static void updateStaus(String uname, String status) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("update ILGAS.users set STATUS = ? where uname = ?");
            ps.setString(1, status);
            ps.setString(2, uname);
            ps.executeUpdate();
            DBConn.close(conn, ps);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps);
            throw new DBException("5 Excepion while accessing database");
        }
    }

    public static void updateEmailVerificationHash(String uname, String hash) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("update ILGAS.users set EMAIL_VERIFICATION_HASH = ?, EMAIL_VERIFICATION_ATTEMPTS = ? where uname = ?");
            ps.setString(1, hash);
            ps.setInt(2, 0);
            ps.setString(3, uname);
            ps.executeUpdate();
            DBConn.close(conn, ps);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps);
            throw new DBException(" 6 Excepion while accessing database");
        }
    }

    public static int incrementVerificationAttempts(String uname) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet res = null;
        int attempts = 0;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("update ILGAS.users set EMAIL_VERIFICATION_ATTEMPTS = EMAIL_VERIFICATION_ATTEMPTS + 1 where uname = ?");
            ps.setString(1, uname);
            ps.executeUpdate();

            ps2 = conn.prepareStatement("SELECT EMAIL_VERIFICATION_ATTEMPTS from users");
            res = ps2.executeQuery();

            if (res != null) {
                while (res.next()) {
                    attempts = res.getInt(1);
                }
            }

            DBConn.close(conn, ps, ps2, res);
        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps, ps2, res);
            throw new DBException("7 Excepion while accessing database");
        }

        return attempts;
    }

    public static User verifyLogin(String username, String password) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        User pojo = null;
        ResultSet res = null;
        System.out.println("verifyLogin username before : " + username);
        System.out.println("verifyLogin password before : " + password);

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("select uname, EMAIL, FIRST_NAME, LAST_NAME, STATUS, CREATED_TIME, ROLE, FUNCTION from ILGAS.users where uname = ? and PASSWORD = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            System.out.println("Userdao 1 verifyLogin");
            System.out.println("verifyLogin after : " + username);
            System.out.println("ps: " + ps);

            res = ps.executeQuery();
            if (res != null) {
                while (res.next()) {
                    pojo = new User();

                    System.out.println("Userdao 2 verifyLogin");

                    pojo.setUSERNAME(res.getString(1));
                    pojo.setEMAIL(res.getString(2));
                    pojo.setFIRST_NAME(res.getString(3));
                    pojo.setLAST_NAME(res.getString(4));
                    pojo.setSTATUS(res.getString(5));
                    pojo.setCREATED_TIME(res.getString(6));
                    pojo.setROLE(res.getString(7));
                    pojo.setFUNCTION(res.getString(8));
                }
            }

            DBConn.close(conn, ps, res);
        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps, res);
            throw new DBException("8 Excepion while accessing database");
        }

        return pojo;
    }

    public static boolean verifyUserIdAndPassword(String uname,
            String inputCurrentPassword) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        boolean verified = false;
        ResultSet res = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("select 1 from ILGAS.users where uname = ? and PASSWORD = ?");
            ps.setString(1, uname);
            ps.setString(2, inputCurrentPassword);
            res = ps.executeQuery();
            if (res != null) {
                while (res.next()) {
                    verified = true;
                }
            }

            DBConn.close(conn, ps, res);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps, res);
            throw new DBException("9 Excepion while accessing database");
        }

        return verified;
    }

    public static void updatePassword(String uname, String inputPassword) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("update ILGAS.users set PASSWORD = ? where uname = ?");
            ps.setString(1, inputPassword);
            ps.setString(2, uname);
            ps.executeUpdate();
            DBConn.close(conn, ps);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps);
            throw new DBException("10 Excepion while accessing database");
        }
    }

    public static void updateEmailVerificationHashForResetPassword(String inputEmail,
            String hash) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("update ILGAS.users set EMAIL_VERIFICATION_HASH = ?, EMAIL_VERIFICATION_ATTEMPTS = ?, STATUS = ? where EMAIL = ?");
            ps.setString(1, hash);
            ps.setInt(2, 0);
            ps.setString(3, GlobalConstants.IN_RESET_PASSWORD);
            ps.setString(4, inputEmail);
            ps.executeUpdate();
            DBConn.close(conn, ps);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps);
            throw new DBException("11 Excepion while accessing database");
        }
    }

    public static User selectUSERbyEmail(String inputEmail) throws DBException {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;
        User pojo = null;

        try {

            conn = DBConn.getConnection();
            ps = conn.prepareStatement("select uname, EMAIL, FIRST_NAME, LAST_NAME, EMAIL_VERIFICATION_HASH, EMAIL_VERIFICATION_ATTEMPTS, STATUS, CREATED_TIME from ILGAS.users where EMAIL = ?");
            ps.setString(1, inputEmail);
            res = ps.executeQuery();
            if (res != null) {
                while (res.next()) {
                    pojo = new User();
                    pojo.setUSERNAME(res.getString(1));
                    pojo.setEMAIL(res.getString(2));
                    pojo.setFIRST_NAME(res.getString(3));
                    pojo.setLAST_NAME(res.getString(4));
                    pojo.setEMAIL_VERIFICATION_HASH(res.getString(5));
                    pojo.setEMAIL_VERIFICATION_ATTEMPTS(res.getInt(6));
                    pojo.setSTATUS(res.getString(7));
                    pojo.setCREATED_TIME(res.getString(8));
                }
            }

            DBConn.close(conn, ps, res);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps, res);
            throw new DBException("12 Excepion while accessing database");
        }

        return pojo;
    }

    @SuppressWarnings("unchecked")
    public static ArrayList getAllUsers() throws ClassNotFoundException, DBException {

        ArrayList listUsers = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        String searchQuery = "SELECT * FROM ILGAS.users";

        try {

            conn = DBConn.getConnection();

            ps = conn.prepareStatement(searchQuery);

            System.out.println("UserDAO: getAllUsers::  " + conn);

            res = ps.executeQuery(searchQuery);

            if (res != null) {
                while (res.next()) {
                    User user = new User();

                    user.setUSERNAME(res.getString("uname"));
                    user.setFIRST_NAME(res.getString("first_name"));
                    user.setLAST_NAME(res.getString("last_name"));
                    user.setEMAIL(res.getString("EMAIL"));
                    user.setFUNCTION(res.getString("function"));
                    user.setROLE(res.getString("role"));

                    listUsers.add(user);
                }
            }

            DBConn.close(conn, ps, res);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps, res);
            throw new DBException("12 Excepion while accessing database");
        }

        return listUsers;
    }

    @SuppressWarnings("unchecked")
    public static ArrayList getAllExpertReaders() throws ClassNotFoundException, DBException {

        ArrayList listExpertReaders = new ArrayList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet res = null;

        String searchQuery = "SELECT * FROM ILGAS.users WHERE function = 'Expert Reader'";

        try {
            conn = DBConn.getConnection();

            ps = conn.prepareStatement(searchQuery);

            System.out.println("UserDAO: getAllExpertReaders::  " + conn);

            res = ps.executeQuery(searchQuery);

            if (res != null) {
                while (res.next()) {
                    User expertReader = new User();
//                    expertReader.setUSERNAME(res.getString("uname"));
                    expertReader.setFIRST_NAME(res.getString("first_name"));
                    expertReader.setLAST_NAME(res.getString("last_name"));
                    expertReader.setEMAIL(res.getString("email"));
//                    expertReader.setFUNCTION(res.getString("function"));
//                    expertReader.setROLE(res.getString("role"));

                    listExpertReaders.add(expertReader);
                }
            }

            DBConn.close(conn, ps, res);

        } catch (ClassNotFoundException | SQLException e) {
            LOGGER.debug(e.getMessage());
            DBConn.close(conn, ps, res);
            throw new DBException("12 Excepion while accessing database");
        }
        System.out.println(listExpertReaders);

        return listExpertReaders;
    }
}
