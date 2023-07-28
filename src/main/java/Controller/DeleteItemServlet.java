package Controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Entity.CartItem;
import Model.Entity.ShoppingSession;


@WebServlet("/deleteItem")
public class DeleteItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") != null) {
            int id = Integer.parseInt(req.getParameter("id"));
            
            HttpSession session = req.getSession();
            if (session.getAttribute("order") != null) {
                System.out.println(session.getAttribute("order"));

                ShoppingSession order = (ShoppingSession) session.getAttribute("order");
                List<CartItem> listItems = order.getProducts();
                for(CartItem item : listItems) {
                    if (item.getProduct().getId() == id) {
                        int lastTotal = order.getTotal();
                        int itemTotal = item.getProduct().getPrice()*item.getQuantity();
                        int afterTotal = lastTotal - itemTotal;
                        System.out.println("Last total: " + lastTotal);
                        System.out.println("Remove total: " + itemTotal);
                        System.out.println("After total: " + afterTotal);
                        if (lastTotal - afterTotal > 0) //Total ban đầu trừ đi cho total sau khi xóa sản phẩm
                            order.setTotal(afterTotal);
                        else 
                            order.setTotal(0);
                        
                        System.out.println("Passed condition: " + order.getTotal());
                        listItems.remove(item);
                        break;
                    }
                }

                if (listItems.size() < 0) {
                    order.setTotal(0);
                }

                order.setProducts(listItems);
                session.setAttribute("order", order);
                session.setAttribute("total", order.getTotal());

                resp.sendRedirect(req.getContextPath()+"/home");
                System.out.println("Out condition: " + order.getTotal());
                
            }
        }
    }
}
