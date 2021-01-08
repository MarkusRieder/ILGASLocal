package ie.irishliterature.shiro.jdbcRealm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.apache.shiro.util.JdbcUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author markus
 */
public class ILGASSecurityRealm extends JdbcRealm {

    /**
     * The default query used to retrieve account data for the user.
     */
    protected static final String AUTHENTICATION_QUERY = "SELECT password FROM ILGAS.users WHERE uname = ?";

    /**
     * The default query used to retrieve the roles that apply to a user.
     */
    protected static final String USER_ROLES_QUERY = "SELECT function FROM ILGAS.users WHERE uname = ?";

    protected String authentication_Query = AUTHENTICATION_QUERY;

    protected String userRoles_Query = USER_ROLES_QUERY;

    protected boolean permissionsLookup_Enabled = false;

//    private static final Logger logger = LogManager.getLogger( LoginService.class );
    private static final Logger logger = LoggerFactory.getLogger( ILGASSecurityRealm.class );

    /**
     * jndiDataSourceName
     */
    protected String jndiDataSourceName;

    public ILGASSecurityRealm() {
        super();
    }

    public String getJndiDataSourceName() {
        return jndiDataSourceName;
    }

    public void setJndiDataSourceName( String jndiDataSourceName ) {
        this.jndiDataSourceName = jndiDataSourceName;
        this.dataSource = getDataSourceFromJNDI( jndiDataSourceName );
    }

    private DataSource getDataSourceFromJNDI( String jndiDataSourceName ) {
        try {
            InitialContext ic = new InitialContext();
            return ( DataSource ) ic.lookup( jndiDataSourceName );
        }
        catch ( NamingException e ) {
            logger.error( "JNDI error while retrieving jndiDataSourceName " + jndiDataSourceName, e );
            System.out.println( "ILGASSecurityRealm NamingException:  e " + e );
            throw new AuthorizationException( e );
        }
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo( AuthenticationToken token ) throws AuthenticationException {

        UsernamePasswordToken upToken = ( UsernamePasswordToken ) token;
        String username = upToken.getUsername();

        System.out.println( "AuthenticationInfo:username " + username );

        // Null username is invalid
        if ( username == null ) {
            throw new AccountException( "Null usernames are not allowed by this realm." );
        }

        Connection conn = null;
        AuthenticationInfo info = null;
        try {
            conn = dataSource.getConnection();

            String password = getPasswordForUser( conn, username );
            System.out.println( "AuthenticationInfo:password " + password );
            if ( password == null ) {
                throw new UnknownAccountException( "No account found for user [" + username + "]" );
            }

            info = new SimpleAuthenticationInfo( username, password.toCharArray(), getName() );
         String host =   upToken.getHost();
         
            System.out.println( " ILGASSecurityRealm token.getHost() " + host );
        }
        catch ( SQLException e ) {
            final String message = "There was a SQL error while authenticating user [" + username + "]";

            logger.warn( "ILGASSecurityRealm " + e );
            System.out.println( "ILGASSecurityRealm AuthenticationInfo:message " + message + " e " + e );
            // Rethrow any SQL errors as an authentication exception
            throw new AuthenticationException( message, e );
        }
        finally {
            JdbcUtils.closeConnection( conn );
        }

        return info;
    }

    private String getPasswordForUser( Connection conn, String username )
            throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        String password = null;
        try {
            ps = conn.prepareStatement( authentication_Query );
            ps.setString( 1, username );

            // Execute query
            rs = ps.executeQuery();

            // Loop over results - although we are only expecting one result,
            // since usernames should be unique
            boolean foundResult = false;
            while ( rs.next() ) {

                // Check to ensure only one row is processed
                if ( foundResult ) {
                    throw new AuthenticationException(
                            "More than one user row found for user ["
                            + username + "]. Usernames must be unique." );
                }

                password = rs.getString( 1 );

                foundResult = true;
            }
        }
        finally {
            JdbcUtils.closeResultSet( rs );
            JdbcUtils.closeStatement( ps );
        }

        return password;
    }

   

    @Override
    @SuppressWarnings( "unchecked" )
    protected Set getRoleNamesForUser( Connection conn, String username ) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Set roleNames = new LinkedHashSet();

        try {
            ps = conn.prepareStatement( userRoles_Query );
            ps.setString( 1, username );
//            ps.setString(2, username);

            // Execute query
            rs = ps.executeQuery();
            System.out.println( "getRoleNamesForUser:ps " + ps );
            // Loop over results and add each returned role to a set
            while ( rs.next() ) {

                String roleName = rs.getString( 1 );
                System.out.println( "getRoleNamesForUser:roleName " + roleName );
                // Add the role to the list of names if it isn't null
                if ( roleName != null ) {
                    roleNames.add( roleName );
                }
                else {
//                    if ( logger.isWarnEnabled() ) {
//                        logger.warn( "Null role name found while retrieving role names for user [" + username + "]" );
//                    }
                }
            }
        }
        finally {
            JdbcUtils.closeResultSet( rs );
            JdbcUtils.closeStatement( ps );
        }

        return roleNames;
    }

}
