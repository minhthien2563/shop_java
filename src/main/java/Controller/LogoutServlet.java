package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
        }

        if (session.getAttribute("total") != null) {
            session.removeAttribute("total");
        }

        if (session.getAttribute("order") != null) {
            session.removeAttribute("order");
        }

        if (session.getAttribute("success") != null) {
            session.removeAttribute("success");
        }

        session.invalidate();
        resp.sendRedirect(req.getContextPath()+"/home");
    }
}
