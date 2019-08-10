/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ie.irishliterature.util;

import ie.irishliterature.DataTables.DataTableStaff;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author markus
 */
public class DataTablesParamUtility {

    public static DataTableStaff getParam( HttpServletRequest request )
    {

        System.out.println( "DataTablesParamUtility" );
        Enumeration<String> params = request.getParameterNames();
        while ( params.hasMoreElements() )
        {
            String paramName = params.nextElement();
            System.out.println( "Parameter Name - " + paramName + ", Value - " + request.getParameter( paramName ) );
        }
        if ( request.getParameter( "sEcho" ) != null && !"".equals( request.getParameter( "sEcho" ) ) )
        {
            DataTableStaff param = new DataTableStaff();
            param.setsEcho( request.getParameter( "sEcho" ) );
            param.setsSearch( request.getParameter( "sSearch" ) );
            param.setsColumns( request.getParameter( "sColumns" ) );
            param.setiDisplayStart( Integer.parseInt( request.getParameter( "iDisplayStart" ) ) );
            param.setiDisplayLength( Integer.parseInt( request.getParameter( "iDisplayLength" ) ) );
            param.setiColumns( Integer.parseInt( request.getParameter( "iColumns" ) ) );
            param.setiSortingCols( Integer.parseInt( request.getParameter( "iSortingCols" ) ) );
            param.setiSortColumnIndex( Integer.parseInt( request.getParameter( "iSortCol_0" ) ) );
            param.setsSortDirection( request.getParameter( "sSortDir_0" ) );

            System.out.println( "DataTablesParamUtility  " + param );
            return param;
        } else
        {
            System.out.println( "DataTablesParamUtility null " );
            return null;
        }
    }
}
