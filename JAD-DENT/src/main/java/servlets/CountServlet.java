package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CountServlet", urlPatterns = {"/CountServlet"})
public class CountServlet extends HttpServlet {
    int totalCount = 0;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el contador de visitas de la solicitud
        
        int visitCount = Integer.parseInt(request.getParameter("visitCount"));
        System.out.println("TOTAL: "+ totalCount);
        System.out.println("VISIT: "+ visitCount);
       
        totalCount = totalCount + visitCount;
         System.out.println("TOTAL: "+ totalCount);        
        // Aquí puedes almacenar el contador en el alcance de la aplicación
        getServletContext().setAttribute("visitCount", totalCount);

        // Puedes realizar otras acciones según tus necesidades, como almacenar el contador en una base de datos, etc.

        // Responder con un mensaje simple
        response.getWriter().write("Contador actualizado a: " + visitCount);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
