import org.hibernate.Session;
import org.hibernate.Transaction;

import Model.Entity.Product;
import Service.HibernateUtil;

public class test {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSession(); 
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            Product product = session.get(Product.class, 1);
            System.out.println(product.getId());
            // session.update(product);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }
}
