package servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SimpleServlet extends HttpServlet {
    private static final String INFO = "INFO";
    private List<String> stringList = new ArrayList<String>();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        stringList.add(request.getParameter("value"));
        System.out.println("POST");
        HttpSession session = request.getSession();
        session.setAttribute(INFO, "Added element:" + request.getParameter("value"));
        setStringListSessionParam(request);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("PUT");
        HttpSession session = request.getSession();
        try {
            String prevValue = stringList.set(0, request.getParameter("value"));
            session.setAttribute(INFO, "Change first element (" + prevValue
                    + " => " + request.getParameter("value") + ")");
        }catch (IndexOutOfBoundsException e) {
            session.setAttribute(INFO, "List is empty");
        }
        setStringListSessionParam(request);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("DELETE");
        HttpSession session = request.getSession();
        try {
            String removedValue = stringList.remove(Integer.parseInt(request.getParameter("value")));
            session.setAttribute(INFO, "Removed value: " + removedValue);
        }catch (IndexOutOfBoundsException e) {
            session.setAttribute(INFO, "There are only " + stringList.size() + " elements in list");
        }catch (NumberFormatException e) {
            session.setAttribute(INFO, "Expected integer, but was: " + request.getParameter("value"));
        }
        setStringListSessionParam(request);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GET");
        HttpSession session = request.getSession();
        try {
            String value = stringList.get(Integer.parseInt(request.getParameter("value")));
            session.setAttribute(INFO, value);
        }catch (IndexOutOfBoundsException e) {
            session.setAttribute(INFO, "There are only " + stringList.size() + " elements in list");
        }catch (NumberFormatException e) {
            session.setAttribute(INFO, "Expected integer, but was: " + request.getParameter("value"));
        }
        setStringListSessionParam(request);
    }

    private void setStringListSessionParam(HttpServletRequest req){
        HttpSession session = req.getSession();
        if(session.getAttribute("state") == null) {
            session.setAttribute("state", stringList);
        }
    }
}
