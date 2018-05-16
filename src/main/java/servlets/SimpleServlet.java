package servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SimpleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("post");
        super.doPost(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("PUT");
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("DELETE");
        super.doDelete(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html");
        System.out.println("GET");
//        String varTextA = "Hello World!";
//        request.setAttribute("textA", varTextA);
//        String varTextB = "It JSP.";
//        request.setAttribute("textB", varTextB);

//        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
//        dispatcher.forward(request, response);
    }
}
