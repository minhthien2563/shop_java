package Service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Entity.Product;

public class ProductService {
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSession();
            Transaction transaction = session.beginTransaction();
            
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Product> criteria = builder.createQuery(Product.class);
            criteria.from(Product.class);
            productList = session.createQuery(criteria).getResultList();
            
            transaction.commit();
            session.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
        return productList;
    }

    public Product getProduct(int id) {
        Session session = HibernateUtil.getSession();
        Product product = session.get(Product.class, id);
        return product;
    }
}
