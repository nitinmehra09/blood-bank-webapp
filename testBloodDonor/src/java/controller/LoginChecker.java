package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginAuthenticator;

/**
 *
 * @author Nitin Mehra
 */
@WebServlet(name = "LoginChecker", urlPatterns = {"/LoginChecker"})
public class LoginChecker extends HttpServlet 
{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("login.html");
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        UserDTO user = new UserDTO();
        user.setEmail(email);
        user.setPassword(password);
        
        LoginAuthenticator l1 = new LoginAuthenticator();
        boolean login = l1.isLogin(user);
        
        if(login)
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("email", email);
            System.out.println("login done");
            response.sendRedirect("home.jsp");
        }
        else
        {
            response.sendRedirect("login.jsp");
        }
    }
}
