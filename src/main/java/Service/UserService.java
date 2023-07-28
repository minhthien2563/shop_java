package Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import Model.Entity.User;

public class UserService {
    public User getUserWithEmail(String _email) {
        User user = null;
        try {
            Session session = HibernateUtil.getSession();

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<User> criteria = builder.createQuery(User.class);
            Root<User> root = criteria.from(User.class);
            criteria.select(root).where(builder.equal(root.get("email"), _email));
            user = session.createQuery(criteria).setMaxResults(1).uniqueResult();

            session.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }

        return user;
    }
}
