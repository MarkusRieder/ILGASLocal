/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.listener;

import java.util.Enumeration;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author markus
 */
@WebListener
public class MySessionListener implements HttpSessionListener {

    ServletContext ctx = null;
    static int total = 0, current = 0;

    @Override
    @SuppressWarnings( "unchecked" )
    public void sessionCreated( HttpSessionEvent se )
    {

        System.out.println( "\n" + " ############################ MySessionListener 1 #######################################" + "\n" );

        System.out.println( "-- HttpSessionListener#sessionCreated invoked --" );
        HttpSession session = se.getSession();
        System.out.println( "session id: " + session.getId() );

//        total++;
//        current++;
//
//        ctx = se.getSession().getServletContext();
//        ctx.setAttribute("totalusers", total);
//        ctx.setAttribute("currentusers", current);
//
//        System.out.println("totalusers: " + total);
//        System.out.println("currentusers: " + current);
        Set<ActiveUser> logins = ( Set<ActiveUser> ) se.getSession().getServletContext().getAttribute( "logins" );

        if ( logins != null )
        {
            System.out.println( "MySessionListener logins size: " + logins.size() );
            System.out.println( "MySessionListener logins: " + logins.toString() );

//            for (Object object : logins) {
//                String element = (String) object;
//                System.out.println("LoginServlet element logins " + element);
//            }
        } else
        {
            System.out.println( "MySessionListener logins null" );
        }
        System.out.println( "\n" + " ############################ END MySessionListener 1 #######################################" + "\n" );
//        
//        
//        for (Object object : logins) {
//                String element = (String) object;
//                System.out.println("LoginServlet element logins " + element);
//            }
//        logins.add(this);
//        for (ActiveUser users : logins) {
//            System.out.println("Names " + users.getUserName()); // Null Pointer Exception
//        }
//      session.setMaxInactiveInterval(60);//in seconds
    }

    @Override
    public void sessionDestroyed( HttpSessionEvent se )
    {

        System.out.println( "\n" + " ############################ MySessionListener 2 #######################################" + "\n" );

        System.out.println( "-- HttpSessionListener#sessionDestroyed invoked --" );
//        current--;
//        ctx.setAttribute("currentusers", current);
        HttpSession session = se.getSession();
        System.out.println( "Destroyed  session id: " + session.getId() );

        System.out.println( "Logout servlet \n " );
        System.out.println( "Enumeration keys   " );
        System.out.println( "Check for  Info:   Enumeration keys\n"
                + "Info:   key  :firstname: Sparky\n"
                + "Info:   key  :name: Sparky The Black Cat\n"
                + "Info:   key  :userID: 88\n"
                + "Info:   key  :logins: moist\n"
                + "Info:   key  :email: markus@rieder.ie\n"
                + "Info:   key  :username: test3\n"
                + "Info:   key  :lastname: The Black Cat  " );
        Enumeration keys = se.getSession().getAttributeNames();
        while ( keys.hasMoreElements() )
        {
            String key = ( String ) keys.nextElement();
//            if (key == "currentusers" || key == "totalusers" || key == "logins") {
            System.out.println( "key  :" + key + ": " + se.getSession().getAttribute( key ) );
        }

//Info:   Enumeration keys
//Info:   key  :firstname: Sparky
//Info:   key  :name: Sparky The Black Cat
//Info:   key  :userID: 88
//Info:   key  :logins: moist
//Info:   key  :email: markus@rieder.ie
//Info:   key  :username: test3
//Info:   key  :lastname: The Black Cat
        System.out.println( "\n" + " ############################ END MySessionListener 2 #######################################" + "\n" );
    }
}
