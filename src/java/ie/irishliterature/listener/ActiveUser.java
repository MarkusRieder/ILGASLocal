/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.listener;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/**
 * Web application lifecycle listener.
 *
 * @author markus
 */
//@WebListener
public class ActiveUser implements HttpSessionBindingListener {

    private String username = null;
    private String password = null;
    // All logins.
    private static Map<ActiveUser, HttpSession> logins = new HashMap<ActiveUser, HttpSession>();

//    public ActiveUser(String name) {
//        this.username = name;
//    }
    public void setUserName( String uname )
    {
        this.username = uname;
    }

    public String getUserName()
    {
        return this.username;
    }

    @Override
    public boolean equals( Object other )
    {
        return ( other instanceof ActiveUser ) && ( username != null ) ? username.equals( ( ( ActiveUser ) other ).username ) : ( other == this );
    }

    @Override
    public int hashCode()
    {
        return ( username != null ) ? ( this.getClass().hashCode() + username.hashCode() ) : super.hashCode();
    }

    @Override
    @SuppressWarnings( "unchecked" )
    public void valueBound( HttpSessionBindingEvent event )
    {
        // TODO Auto-generated method stub

//                HttpSession session = logins.remove(this);
//        if (session != null) {
//            session.invalidate();
//        }
//        logins.put(this, event.getSession());
        ServletContext context = event.getSession().getServletContext();

        System.out.println( "\n" + " ############################ ActiveUser 1 #######################################" + "\n" );

        System.out.println( "ActiveUser valueBound BEFORE logins.add(this)  \n " );
        System.out.println( "Enumeration keys   " );
        Enumeration keys = context.getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
            if ( key == "logins" )
            {
                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
            }
        }

        System.out.println( "\n" + " ############################ END ActiveUser 1 #######################################" + "\n" );

//        System.out.println("ActiveUser valueBound  ServletContext " + sc.getAttributeNames().toString());
//        ActiveUser session = (ActiveUser) event.getSession().getAttribute("userlogged");
//        Set<ActiveUser> user = (Set<ActiveUser>) sc.getAttribute("logins");
        Set<ActiveUser> logins = ( Set<ActiveUser> ) event.getSession().getServletContext().getAttribute( "logins" );
        logins.add( this );
        Set<ActiveUser> userData = ( Set<ActiveUser> ) event.getSession().getServletContext().getAttribute( "userData" );

//        ActiveUser user = (ActiveUser) event.getValue();
//        System.out.println("New user bound in session with name: " + user.getUserName());
//
//        for (ActiveUser users : logins) {
//            System.out.println("Names " + users.getUserName()); // Null Pointer Exception
////                if(session.getUserName().equals(users.getUserName()))
////                {
////                    logins.remove(users);
////                    System.out.println("User already logged in with name "+users.getUserName());
////                }
//        }
        System.out.printf( "ActiveUser valueBound added attribute name: %s, value:%s %n",
                event.getName(), event.getValue() );

        System.out.println( "\n" + " ############################ ActiveUser 2 #######################################" + "\n" );

        System.out.println( "ActiveUser valueBound AFTER logins.add(this)  \n " );
        System.out.println( "Enumeration keys   " );
        keys = context.getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
            if ( key == "currentusers" || key == "userData" || key == "logins" )
            {
                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
            }
        }

        System.out.println( "ActiveUser all logins : " + logins.toString() );

        System.out.println( "\n" + " ############################ END ActiveUser 2 #######################################" + "\n" );

//        }
//        if (user.isEmpty()) {
//            System.out.println("A user session has been created");
//            user.add(session);
//            sc.setAttribute("logins", user);
//        } else {
//            String attr = (String) event.getValue();
//            if ("userlogged".equals(attr)) {
//                //do your stuff here
//
//                for (ActiveUser users : user) {
//                    System.out.println("Names " + users.getUserName()); // Null Pointer Exception
//                    if (session.getUserName().equals(users.getUserName())) {
//                        user.remove(users);
//                        System.out.println("User already logged in with name " + users.getUserName());
//                    }
//                }
//            }
//        }
    }

    @Override
    @SuppressWarnings( "unchecked" )
    public void valueUnbound( HttpSessionBindingEvent event )
    {
        // TODO Auto-generated method stub
//logins.remove(this);

        ServletContext context = event.getSession().getServletContext();

        Set<ActiveUser> logins = ( Set<ActiveUser> ) event.getSession().getServletContext().getAttribute( "logins" );
        Set<ActiveUser> userData = ( Set<ActiveUser> ) event.getSession().getServletContext().getAttribute( "userData" );

        System.out.println( "\n" + " ############################ ActiveUser 3 #######################################" + "\n" );

        System.out.println( "-- HttpSessionBindingEvent#valueUnbound() --" );
        System.out.printf( "removed attribute name: %s, value:%s %n",
                event.getName(), event.getValue() );

        System.out.println( "ActiveUser valueUnbound BEFORE logins.remove(this)  \n " );
        System.out.println( "Enumeration keys   " );
        Enumeration keys = context.getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
            if ( key == "currentusers" || key == "userData" || key == "logins" )
            {
                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
            }
        }

        System.out.println( "\n" + " ############################ END ActiveUser 3 #######################################" + "\n" );

        logins.remove( this );

        System.out.println( "\n" + " ############################ ActiveUser 4 #######################################" + "\n" );

        System.out.println( "ActiveUser valueUnbound AFTER logins.remove(this)  \n " );
        System.out.println( "Enumeration keys   " );
        keys = context.getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
            if ( key == "currentusers" || key == "userData" || key == "logins" )
            {
                System.out.println( "key  :" + key + ": " + context.getAttribute( key ) );
            }
        }
        System.out.println( "\n" + " ############################ END ActiveUser 4 #######################################" + "\n" );

    }

//    private void removeLoginUser(HttpSessionBindingEvent event) {
//        if (user != null) {
//            ServletContext context = event.getSession().getServletContext();
//            Set<ActiveUser> logins = context.getAttribute("loginUsers");
//            logins.remove(this);
//        }
//    }
//
//    private void addLoginUser(HttpSessionBindingEvent event) {
//
//        if (user != null) {
//            ServletContext context = event.getSession().getServletContext();
//            Set<ActiveUser> logins = context.getAttribute("loginUsers");
//            logins.add(this);
//        }
//    }
    @Override
    public String toString()
    {
        return username;
    }

}
