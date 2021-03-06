package com.buaa.mooc.dao;

import com.buaa.mooc.entity.GroupRecruit;
import com.buaa.mooc.entity.GroupRecruitView;
import com.buaa.mooc.entity.StudentRecruitView;
import com.buaa.mooc.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huxia on 2017/7/2.
 */
public class GroupRecruitDao {
    public List<GroupRecruitView> findByCidwithMemCount(Integer cid) {
        Session session = HibernateUtils.getSession();
        List<GroupRecruitView> results;
        try {
            String hql = "select g from GroupRecruitView as g where g.cid = :cid";
            Query query = session.createQuery(hql);
            query.setParameter("cid", cid);
            results = query.list();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public Map<GroupRecruitView,String> findByCidInfo(Integer cid) {
        Map<GroupRecruitView, String> groupRecruitInfo= new HashMap<>();
        Session session = HibernateUtils.getSession();
        try {
            String hql = "select grv, s.sname " +
                    "from GroupRecruitView as grv, GroupRecruit as gr, Student as s " +
                    "where grv.cid = :cid and grv.grid = gr.grid and gr.convener = s.sid";
            Query query = session.createQuery(hql);
            query.setParameter("cid", cid);
            List result = query.list();
            for (Object obj : result ) {
                Object[] item = (Object[]) obj;
                groupRecruitInfo.put((GroupRecruitView) item[0], (String) item[1]);
            }
            return groupRecruitInfo;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public StudentRecruitView findBySidandCidSRV(Integer sid, Integer cid) {
        Session session = HibernateUtils.getSession();
        List results;
        try {
            String hql = "from StudentRecruitView where cid = :cid and pk.sid = :sid";
            Query query = session.createQuery(hql);
            query.setParameter("cid", cid);
            query.setParameter("sid", sid);
            results = query.list();
            if (results != null && results.size() > 0) {
                return (StudentRecruitView)(results.get(0));
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public List<StudentRecruitView> findByGridSRV(Integer grid) {
        Session session = HibernateUtils.getSession();
        try {
            String hql = "from StudentRecruitView where pk.grid = :grid";
            Query query = session.createQuery(hql);
            query.setParameter("grid", grid);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public GroupRecruit findByGridGR(Integer grid) {
        Session session = HibernateUtils.getSession();
        try {
            return session.load(GroupRecruit.class, grid);
        } catch (Exception e) {
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public void deleteByGridGR(Integer grid) {
        Session session = HibernateUtils.getSession();
        try {
            GroupRecruit groupRecruit = session.load(GroupRecruit.class, grid);
            session.beginTransaction();
            session.delete(groupRecruit);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public void submitGR(Integer grid) {
        Session session = HibernateUtils.getSession();
        try {
            GroupRecruit gr =  session.load(GroupRecruit.class, grid);
            gr.setIsSubmitted(1);
            session.beginTransaction();
            session.update(gr);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public GroupRecruit AddGroupRecruit(Integer convener_sid, String group_name, String information, Integer cid) {
        Session session = HibernateUtils.getSession();
        try {
            session.beginTransaction();
            GroupRecruit groupRecruit = new GroupRecruit();
            groupRecruit.setCid(cid);
            groupRecruit.setConvener(convener_sid);
            groupRecruit.setGroup_name(group_name);
            groupRecruit.setRecruit_information(information);
            groupRecruit.setIsSubmitted(0);
            session.save(groupRecruit);
            session.getTransaction().commit();
            return groupRecruit;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public GroupRecruitView findByGridwithMemCount(Integer grid) {
        Session session = HibernateUtils.getSession();
        try {
            String hql = "select g from GroupRecruitView as g where g.grid = :grid";
            Query query = session.createQuery(hql);
            query.setParameter("grid", grid);
            return (GroupRecruitView) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public static void main(String[] args) {
        GroupRecruitDao groupRecruitDao = new GroupRecruitDao();
        Map<GroupRecruitView, String> map = groupRecruitDao.findByCidInfo(1);
        for (GroupRecruitView item : map.keySet()) {
            System.out.println(item.getGroup_name());
            System.out.println(map.get(item));
        }
    }

}
