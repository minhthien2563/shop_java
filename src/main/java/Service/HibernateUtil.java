package Service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static SessionFactory sessionFactory;

    public static synchronized SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
            StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties());

            configuration.addAnnotatedClass(Model.Entity.Product.class);
            configuration.addAnnotatedClass(Model.Entity.User.class);

            sessionFactory = configuration.buildSessionFactory(builder.build());
        }

        return sessionFactory;
    }

    public static synchronized Session getSession() {
        return getSessionFactory().openSession();
    }
}