package dao;

import domain.Loaisach;
import java.*;
import java.util.List;
import org.hibernate.*;
import util.HibernateUtil;

public class LoaiSachDAO {
    private Session ses;

    public LoaiSachDAO() {
        ses = HibernateUtil.getSessionFactory().openSession();
    }
    
    public List<Loaisach> getContacts() {
        Transaction tx = ses.beginTransaction();
        List<Loaisach> ds = ses.createQuery("from Loaisach").list();
        tx.commit();
        return ds;
    }

    public Loaisach get(int id) {
        Transaction tx = ses.beginTransaction();
        Loaisach ds = (Loaisach) ses.get(Loaisach.class, id);
        tx.commit();
        return ds;
    }
    public int create (Loaisach c){
        Transaction tx = ses.beginTransaction();
        ses.saveOrUpdate(c);
        tx.commit();
        return c.getMaloai();
    }
    public void delete(Loaisach c){
        Transaction tx = ses.beginTransaction();
        ses.delete(c);
        tx.commit();
    }
}
