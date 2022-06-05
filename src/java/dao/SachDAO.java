
package dao;

import domain.Sach;
import java.*;
import java.util.List;
import org.hibernate.*;
import util.HibernateUtil;
public class SachDAO {
     private Session ses;

    public SachDAO() {
        ses = HibernateUtil.getSessionFactory().openSession();
    }
    
    public List<Sach> getContacts() {
        Transaction tx = ses.beginTransaction();
        List<Sach> ds = ses.createQuery("from Sach").list();
        tx.commit();
        return ds;
    }

    public Sach get(int id) {
        Transaction tx = ses.beginTransaction();
        Sach ds = (Sach) ses.get(Sach.class, id);
        tx.commit();
        return ds;
    }
    public int create (Sach c){
        Transaction tx = ses.beginTransaction();
        ses.saveOrUpdate(c);
        tx.commit();
        return c.getMasach();
    }
    public void delete(Sach c){
        Transaction tx = ses.beginTransaction();
        ses.delete(c);
        tx.commit();
    }
}
