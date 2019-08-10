/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.misc;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 *
 * @author Markus Rieder
 */
@WebListener
public class ActiveUserListener implements HttpSessionAttributeListener {

    @Override
    public void attributeAdded( HttpSessionBindingEvent event )
    {
//        if (event.getValue() instanceof User) {
////            logins.add(event.getValue());
//            System.out.println("ActiveUserListener");
//            System.out.println("An instance of User has been bound to the session.");
//            String attributeName = event.getName();
//            Object attributeValue = event.getValue();
//            System.out.println("Attribute added : " + attributeName + " : " + attributeValue);
//        }
    }

    @Override
    public void attributeRemoved( HttpSessionBindingEvent event )
    {
//        if (event.getValue() instanceof User) {
////            logins.remove(event.getValue());
//            System.out.println("ActiveUserListener");
//            System.out.println("An instance of User has been unbound from the session.");
//            String attributeName = event.getName();
//            Object attributeValue = event.getValue();
//            System.out.println("Attribute removed : " + attributeName + " : " + attributeValue);
//        }
    }

    @Override
    public void attributeReplaced( HttpSessionBindingEvent event )
    {
//        if (event.getValue() instanceof User) {
////            logins.add(event.getValue());
//            System.out.println("ActiveUserListener");
//            System.out.println("An instance of User has been replaced in the session.");
//            String attributeName = event.getName();
//            Object attributeValue = event.getValue();
//            System.out.println("Attribute replaced : " + attributeName + " : " + attributeValue);
//        }
    }

}
