package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Entity.User;
import Service.UserService;

@WebServlet("/toLogin")
public class LoginHandleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("email req: " + req.getParameter("email"));
        System.out.println("password req: " + req.getParameter("password"));
        
        if (req.getParameter("email") != null) {
            if (req.getParameter("password") != null) {
                String email = (String) req.getParameter("email");
                String password = (String) req.getParameter("password");

                UserService userService = new UserService();
                User user = userService.getUserWithEmail(email);

                if (user == null) {
                    req.setAttribute("errorMessage", "Tài khoản không tồn tại!");
                    req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
                    return;
                }

                System.out.println("user get: " + user.getEmail());

                System.out.println("password get: " + user.getPassword() + "password req: " + password);

                if (user.getPassword().equals(password)) {
                    System.out.println("authenticate passed");
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                    resp.sendRedirect(req.getContextPath()+"/home");
                } else {
                    req.setAttribute("errorMessage", "Sai mật khẩu!");
                    req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
                }
            }
        }
    }
}

