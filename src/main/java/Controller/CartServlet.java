package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Model.Entity.CartItem;
import Model.Entity.Product;
import Model.Entity.ShoppingSession;
import Service.ProductService;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int quantity = 1;
        int id;
        if (req.getParameter("id") != null) {
            id = Integer.parseInt(req.getParameter("id"));
            ProductService productService = new ProductService();
            Product product = productService.getProduct(id);

            if (product != null) {
                if (req.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(req.getParameter("quantity"));
                }

                HttpSession session = req.getSession();
                if (session.getAttribute("order") == null) {
                    ShoppingSession order = new ShoppingSession();
                    List<CartItem> listItems = new ArrayList<CartItem>();
                    CartItem item = new CartItem();
                    item.setProduct(product);
                    item.setQuantity(quantity);
                    listItems.add(item);
                    order.setProducts(listItems);
                    order.setTotal(product.getPrice() * quantity);
                    session.setAttribute("total", order.getTotal());
                    session.setAttribute("order", order);
                } else {
                    ShoppingSession order = (ShoppingSession) session.getAttribute("order");
                    List<CartItem> listItems = order.getProducts();
                    boolean check = false;
                    int lastTotal = order.getTotal();
                    for (CartItem item : listItems) {
                        if (item.getProduct().getId() == id) {
                            item.setQuantity(item.getQuantity() + quantity);
                            order.setTotal(lastTotal + item.getProduct().getPrice()*quantity);
                            check = true;
                        }
                    }
                    if (check == false) {
                        CartItem item = new CartItem();
                        item.setProduct(product);
                        item.setQuantity(quantity);
                        listItems.add(item);
                        order.setProducts(listItems);
                        order.setTotal(lastTotal + item.getProduct().getPrice()*quantity);
                    }
                    session.setAttribute("order", order);
                    session.setAttribute("total", order.getTotal());
                }

                // resp.sendRedirect(req.getRequestURI());
                // System.out.println("Req URL: " + req.getRequestURL());
                // System.out.println("Ref URL: " + req.getHeader("Referer"));
                // resp.sendRedirect(req.getHeader("Referer"));

                // resp.setHeader("Refresh", "0; url=" + req.getRequestURI());

                resp.sendRedirect(req.getContextPath()+"/product?id="+id);
            }
        }
    }
}