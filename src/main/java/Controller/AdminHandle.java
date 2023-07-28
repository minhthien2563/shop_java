package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Entity.Product;
import Service.HibernateUtil;
import Service.ProductService;

@WebServlet("/adminHandle")
public class AdminHandle extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getParameter("action");

        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();

        if ("add".equals(action)) {

            String name = (String)request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));

            Product product = new Product();
            product.setName(name);
            product.setPrice(price);

            session.save(product);

            session.getTransaction().commit();

            response.sendRedirect(request.getContextPath()+"/admin");

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            
            ProductService productService = new ProductService();
            Product product = productService.getProduct(id);

            if (request.getParameter("name") != null) {
                String name = (String)request.getParameter("name");
                product.setName(name);
            }

            if (request.getParameter("price") != null) {
                int price = Integer.parseInt(request.getParameter("price"));
                product.setPrice(price);
            }

            session.saveOrUpdate(product);

            transaction.commit();
            session.close();

            response.sendRedirect(request.getContextPath()+"/admin");

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));

            try {
                Product product = session.get(Product.class, id);

                System.out.println("Product name: " + product.getName());
                session.delete(product);

                transaction.commit();

                session.close();

            } catch (Exception ex) {
                transaction.rollback();
            }

            response.sendRedirect(request.getContextPath()+"/admin"); //ham lam san cho thi ko xai
        }
    }
}
