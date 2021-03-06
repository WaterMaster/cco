package com.buaa.mooc.dao;

import com.buaa.mooc.entity.Message;
import com.buaa.mooc.entity.MessagePK;
import com.buaa.mooc.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by 我不承认 on 2017/7/4.
 */
public class MessageDao {
    public void InsertMessage(Integer sid, String text) {
        Session session = HibernateUtils.getSession();
        try {
            session.beginTransaction();
            Message message = new Message();
            MessagePK pk = new MessagePK();
            pk.setSid(sid);
            pk.setInsert_time(new Timestamp(System.currentTimeMillis()));
            message.setPk(pk);
            message.setContent(text);
            session.save(message);
            session.getTransaction().commit();
        }catch (Throwable e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public List<Message> findBySid(Integer sid) {
        Session session = HibernateUtils.getSession();
        try {
            String hql = "from Message where pk.sid = :sid";
            Query query = session.createQuery(hql);
            query.setParameter("sid", sid);
            return query.list();
        }catch (Throwable e) {
            e.printStackTrace();
            return null;
        }finally {
            HibernateUtils.closeSession(session);
        }
    }
}
