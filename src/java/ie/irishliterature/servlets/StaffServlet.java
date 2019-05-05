package ie.irishliterature.servlets;

import ie.irishliterature.dao.Test1DAO;
import ie.irishliterature.db.DBException;
import ie.irishliterature.model.GrantApplication;
import java.io.*;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "StaffServlet", urlPatterns = {"/StaffServlet"})
public class StaffServlet extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger(StaffServlet.class.getCanonicalName());
    private static final long serialVersionUID = 7908187011456392847L;


    ////////////////////////////////////////////////////////////////////////////
    ///
    ///  For Irish Literature Staff
    ///
    ////////////////////////////////////////////////////////////////////////////
    private String referenceNumber;  //Array of Author/Title
    private String applicationYear;
    private String applicationNumber;
    private String notesAboutApplication;                   // path to file
    private String dateOfBoardMeeting; //  Date
    private String ApproveWithdrawnReject; //  Date
    private int approveWithdrawnReject = 0;
    private int directorChairDecision = 0;
    private String DirectorChairDecision = "";
    private String amountApproved; //  Date
    private String Date_ILE_Acknowlegement_Approved; //  Date
    private String Date_Published_Books_Received; //  Date
    private String Date_Payment_Made_to_Publisher; //  Date
    private String Payment_Reference_Number;
    private String plannedPageExtent;
    private String proposedPrintRun;
    private int copiesSent;
    private String CopiesSent;
    private String Comments_re_Application;
    private String Board_Meeting;
    private String Date_publisher_informed_of_meeting; //  Date 
    private String Award;
    private int award = 0; //    boolean
    private String Bilingual;
    private int bilingual = 0; //    boolean        
    private String Amount_Requested;
    private String Amount_Approved;
    private String Comments_about_Meeting;
    private String Proposed_Publication_Date; //  Date
    private String Previous_Grant_Aid; // Array of Author/Title
    private String Press_cuttings;  //  boolean
    private String Sales_figures;
    private String Anthology; //Array of Author/Title
    private String Status = "";
    private String Date_Contract_Sent_to_Publisher;
    private String message = "";
    private String PaymentStatus;

    @Override
    public void init() {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();

            //  String task = "Start New Application";
            //  String[] authorArray;
            //  String task = request.getParameter("AssignExpertReader");
            //  String task = request.getParameter("task");
            //  String name = request.getParameter("name");
            //  String value = request.getParameter("value");
            String task = String.valueOf(request.getSession().getAttribute("task"));

            System.out.println("StaffServlet :: ");
            System.out.println("HttpSession session :: sess: " + task);
//            request.setAttribute("username", username);
//            request.setAttribute("password", password);
//            request.setAttribute("firstname", firstname);
//            request.setAttribute("lastname", lastname);
//            request.setAttribute("email", email);
//            request.setAttribute("userID", userID);
//            
//                        // Setting user session
//           
//            session.setAttribute("username", username);
//            session.setAttribute("firstname", firstname);
//            session.setAttribute("lastname", lastname);
//            session.setAttribute("email", email);
//            session.setAttribute("userID", userID);

            String name = request.getParameter("name");
            System.out.println("Here we are >>>>>>>>>.   StaffServlet ::  name " + name);

            java.sql.Timestamp timestamp = getcurrentTimeStamp();
            Status = "open";

            GrantApplication application = new GrantApplication();

            Enumeration en = request.getParameterNames();
            
            /*
             * loop through fieldnames and assign their values to variables if
             * not empty
             */
            
            while (en.hasMoreElements()) {
                Object objOri = en.nextElement();

                String fieldname = (String) objOri;

                switch (fieldname) {
                    case "appReferenceNumber":
                        referenceNumber = request.getParameter(fieldname);
                        applicationNumber = referenceNumber.split("/")[0];
                        applicationYear = referenceNumber.split("/")[1];
                        break;
                    case "appNotesAboutApplication":
                        notesAboutApplication = request.getParameter(fieldname);
                        application.setNotesAboutApplication(notesAboutApplication);
                        break;
                    case "appDateOfBoardMeeting":
                        if (!"".equals(request.getParameter(fieldname))) {
                            dateOfBoardMeeting = request.getParameter(fieldname);
                            application.setBoardMeeting(convertStringDate(dateOfBoardMeeting));
                        }
                        break;
                    case "ApproveWithdrawnReject":
                        if (!"".equals(request.getParameter(fieldname))) {
                            ApproveWithdrawnReject = request.getParameter(fieldname);
                            System.out.println("param00 ApproveWithdrawnReject " + ApproveWithdrawnReject);
                            if ("ticked".equals(ApproveWithdrawnReject)) {
                                approveWithdrawnReject = 1;
                            } else {
                                approveWithdrawnReject = 0;
                            }
                            if (ApproveWithdrawnReject.equals("Approved")) {
                                Status = "pending";
                            }
                            application.setApproveWithdrawnReject(ApproveWithdrawnReject);
                        }
                        break;
                    case "directorChairDecision":
                        if (!"".equals(request.getParameter(fieldname))) {
                            DirectorChairDecision = request.getParameter(fieldname);
                            if ("ticked".equals(DirectorChairDecision)) {
                                directorChairDecision = 1;
                            } else {
                                directorChairDecision = 0;
                            }
                            application.setDirectorChairDecision(directorChairDecision);
                        }
                        break;
                    case "commentsAboutMeeting":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Comments_about_Meeting = request.getParameter(fieldname);
                            application.setBoardComments_Instructions(Comments_about_Meeting);
                        }
                        break;
                    case "appplannedPageExtent":
                        if (!"".equals(request.getParameter(fieldname))) {
                            plannedPageExtent = request.getParameter(fieldname);
                            application.setPlannedPageExtent(Integer.parseInt(plannedPageExtent));
                        }
                        break;
                    case "appproposedPrintRun":
                        if (!"".equals(request.getParameter(fieldname))) {
                            proposedPrintRun = request.getParameter(fieldname);
                            application.setProposedPrintRun(Integer.parseInt(proposedPrintRun));
                        }
                        break;
                    case "award":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Award = request.getParameter(fieldname);
                            if ("ticked".equals(Award)) {
                                award = 1;
                            } else {
                                award = 0;
                            }
                            application.setAward(award);
                        }
                        break;
                    case "amountApproved":
                        if (!"".equals(request.getParameter(fieldname))) {
                            amountApproved = request.getParameter(fieldname);
                            BigDecimal aa = new BigDecimal(amountApproved.replaceAll(",", ""));
                            application.setAmountApproved(aa);
                        }
                        break;
                    case "dateContractSenttoPublisher":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Date_Contract_Sent_to_Publisher = request.getParameter(fieldname);
                            application.setContractSentToPublisher(convertStringDate(Date_Contract_Sent_to_Publisher));
                        }
                        break;
                    case "dateILEAcknowledgementApproved":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Date_ILE_Acknowlegement_Approved = request.getParameter(fieldname);
                            application.setAcknowledgementApproved(convertStringDate(Date_ILE_Acknowlegement_Approved));
                        }
                        break;
                    case "datePublisherInformedOfMeeting":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Date_publisher_informed_of_meeting = request.getParameter(fieldname);
                            application.setPublisherInformedOfMeeting(convertStringDate(Date_publisher_informed_of_meeting));
                        }
                        break;
                    case "datePublishedBooksReceived":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Date_Published_Books_Received = request.getParameter(fieldname);
                            application.setDatePublishedBooksReceived(convertStringDate(Date_Published_Books_Received));
                        }
                        break;
                    case "datePaymentMadeToPublisher":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Date_Payment_Made_to_Publisher = request.getParameter(fieldname);
                            application.setDatePaymentMadeToPublisher(convertStringDate(Date_Payment_Made_to_Publisher));
                        }
                        break;
                    case "paymentReferenceNumber":
                        if (!"".equals(request.getParameter(fieldname))) {
                            Payment_Reference_Number = request.getParameter(fieldname);
                            application.setPaymentReferenceNumber(Payment_Reference_Number);
                        }
                        break;
                    case "paymentStatus":
                        if (!"".equals(request.getParameter(fieldname))) {
                            PaymentStatus = request.getParameter(fieldname);
                            if (PaymentStatus.equals("Paid")) {
                                Status = "closed";

                            }
                            application.setPaymentStatus(PaymentStatus);
                        }
                        break;

                } // end switch

                application.setStatus(Status);
                application.setLASTUPDATED(timestamp);

            }

            System.out.println("Enumeration keys   ");
            Enumeration keys = session.getAttributeNames();
            while (keys.hasMoreElements()) {
                String key = (String) keys.nextElement();
                System.out.println("key  :" + key + ": " + session.getValue(key));
                if ("name".equals(key)) {
                    name = (String) session.getValue(key);
                }
            }
            System.out.println("param1 referenceNumber " + referenceNumber);
            System.out.println("param2 applicationNumber " + applicationNumber);
            System.out.println("param3 applicationYear " + applicationYear);
            System.out.println("param4 notesAboutApplication " + notesAboutApplication);
            System.out.println("param5 dateOfBoardMeeting :" + dateOfBoardMeeting + ":");
            System.out.println("param6  ApproveWithdrawnReject  " + ApproveWithdrawnReject);
            System.out.println("param7  directorChairDecision " + directorChairDecision);
            System.out.println("param8 Comments_about_Meeting " + Comments_about_Meeting);
            System.out.println("param9 plannedPageExtent " + plannedPageExtent);
            System.out.println("param10 proposedPrintRun " + proposedPrintRun);
            System.out.println("param11 Award " + award);
            System.out.println("param12 amountApproved " + amountApproved);
            System.out.println("param13 Date_Contract_Sent_to_Publisher :" + Date_Contract_Sent_to_Publisher + ":");
            System.out.println("param14 Date_ILE_Acknowlegement_Approved " + Date_ILE_Acknowlegement_Approved);
            System.out.println("param15 Date_publisher_informed_of_meeting " + Date_publisher_informed_of_meeting);
            System.out.println("param16 Date_Published_Books_Received " + Date_Published_Books_Received);
            System.out.println("param17 Date_Payment_Made_to_Publisher " + Date_Payment_Made_to_Publisher);
            System.out.println("param18 Payment_Reference_Number " + Payment_Reference_Number);
            System.out.println("param19 PaymentStatus " + PaymentStatus);
            System.out.println("param20 Date_publisher_informed_of_meeting " + Date_publisher_informed_of_meeting);
            System.out.println("param21 Status " + Status);
            System.out.println("param22 timestamp " + timestamp);

            Test1DAO.updateApplication(application, applicationNumber, applicationYear);

            /*
             * reset session
             */
            session.removeAttribute("task");

            message = "The application with reference number: " + referenceNumber + " has been updated ";
            request.setAttribute("message", message);
            request.setAttribute("name", name);
            request.getRequestDispatcher("/WEB-INF/views/response.jsp").forward(request, response);

        } catch (ParseException | SQLException | DBException ex) {
            Logger.getLogger(StaffServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, java.io.IOException {

        throw new ServletException("GET method used with "
                + getClass().getName() + ": POST method required.");
    }

    public Date convertDate(String datum) throws ParseException {

        DateFormat sourceFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date date = sourceFormat.parse(datum);

        return date;

    }

    public java.sql.Date convertStringDate(String datum) throws ParseException {

        System.out.println("convertStringDate datum  " + datum);
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("convertStringDate sdf1  " + sdf1);
        java.util.Date date = sdf1.parse(datum);
        System.out.println("convertStringDate date  " + date);
        java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
        System.out.println("convertStringDate sqlStartDate  " + sqlStartDate);

        return sqlStartDate;
    }

    public java.sql.Date getTodaySQL() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());

    }

    public int getCounter(String counterIndicator) {

        int counter = 0;

        System.out.println("getCounter(String " + counterIndicator);

        if ((counterIndicator.contains("-")) && (!counterIndicator.contains("image-file"))) {

            String counterIndicatorArray[] = counterIndicator.split("-");
            for (int u = 0; u < counterIndicatorArray.length; u++) {
                System.out.println("counterIndicatorArray[" + u + "]" + Arrays.toString(counterIndicatorArray));
            }
            System.out.println("getCounter(counterIndicatorArray.length " + counterIndicatorArray.length);
            System.out.println("getCounter(counterIndicatorArray[counterIndicatorArray.length - 1] " + counterIndicatorArray[counterIndicatorArray.length - 1]);
            counter = Integer.parseInt(counterIndicatorArray[counterIndicatorArray.length - 1]) - 1;

            System.out.println("Integer.parseInt(counterIndicatorArray counter  " + counter);
        }

        System.out.println("counter  " + counter);

        return counter;
    }

    private java.sql.Timestamp getcurrentTimeStamp() {

        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp(today.getTime());

    }

    public String getFdname(String fieldname) {

        String fdname;

        String fdnameArray[] = fieldname.split("-");

        fdname = fdnameArray[0];

        System.out.println("getFdname(String " + fieldname);
        for (int v = 0; v < fdnameArray.length; v++) {
            System.out.println("fdnameArray[" + v + "]" + Arrays.toString(fdnameArray));
        }

        System.out.println("fdname  " + fdname);

        return fdname;
    }

}
