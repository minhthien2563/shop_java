package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/paymentHandle")
public class PaymentHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
            return;
        }
        
        String name = (String) req.getParameter("name");
        int number = Integer.parseInt(req.getParameter("number"));
        String address = (String) req.getParameter("address");

        session.removeAttribute("order");
        
        session.setAttribute("success", "Bạn đã đặt hàng thành công!");
        resp.sendRedirect(req.getContextPath()+"/home");
        

        System.out.println("Payment handle passed");
    }
}
