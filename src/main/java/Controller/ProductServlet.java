package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Entity.Product;
import Service.ProductService;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") != null) {
            int product_id = Integer.parseInt(req.getParameter("id"));
            ProductService productService = new ProductService();
            Product product = productService.getProduct(product_id);
            if (product != null) {
                req.setAttribute("product", product);
                req.getRequestDispatcher("/WEB-INF/product.jsp").forward(req, resp);
            }
        }
    }
}
