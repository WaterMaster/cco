package com.buaa.mooc.dao;


import com.buaa.mooc.entity.Course;
import com.buaa.mooc.entity.Student;
import com.buaa.mooc.entity.StudentCourse;
import com.buaa.mooc.entity.StudentCoursePK;
import com.buaa.mooc.entity.Teacher;
import com.buaa.mooc.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class StudentCourseDao {

    public List<Course> getCourses(Integer sid) {
        Session session = HibernateUtils.getSession();
        List<Course> courses = new ArrayList<>();
        try {
            String hql = "select c from Course as c, StudentCourse as sc where c.cid = sc.pk.cid and sc.pk.sid = :sid";
            Query query = session.createQuery(hql);
            query.setParameter("sid", sid);
            courses = query.list();
            return courses;
        } catch (Exception e) {
            e.printStackTrace();
            return courses;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public List<Student> getStudents(Integer cid) {
        Session session = HibernateUtils.getSession();
        List<Student> students = new ArrayList<>();
        try {
            String hql= "from StudentCourse as sc where sc.pk.cid = :cid";
            Query query = session.createQuery(hql);
            query.setParameter("cid", cid);
            students = query.list();
            return students;
        } catch (Exception e) {
            e.printStackTrace();
            return students;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public List<StudentCourse> findByCid(Integer cid){
        Session session = HibernateUtils.getSession();
        List results = null;
        List<StudentCourse> studentCourses = null;
        try {
            studentCourses = new ArrayList<>();
            String hql = "from StudentCourse as sc where sc.pk.cid = :cid";
            Query query = session.createQuery(hql);
            query.setParameter("cid", cid);
            results = query.list();
            if (results != null && results.size() > 0) {
                StudentCourse t;
                for (Object obj : results) {
                    t = (StudentCourse) obj;
                    studentCourses.add(t);
                }
            }
            return studentCourses;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }


    public boolean AddRelationSC(Integer sid, Integer cid) {
        Session session = HibernateUtils.getSession();
        try {
            StudentCourse tc = new StudentCourse();
            StudentCoursePK tcPK = new StudentCoursePK();
            tcPK.setCid(cid);
            tcPK.setSid(sid);
            tc.setPk(tcPK);
            try {
                session.load(StudentCourse.class, tcPK);
            } catch (Throwable e) {
                session.beginTransaction();
                session.save(tc);
                session.getTransaction().commit();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public StudentCourse findBySidAndCid(Integer sid, Integer cid) {
        Session session = HibernateUtils.getSession();
        try {
            StudentCoursePK tcPK = new StudentCoursePK();
            tcPK.setCid(cid);
            tcPK.setSid(sid);
            return session.load(StudentCourse.class, tcPK);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public void SetGidBySidandCid(Integer sid, Integer cid, Integer gid) {
        Session session = HibernateUtils.getSession();
        try {
            StudentCoursePK tcPK = new StudentCoursePK();
            tcPK.setCid(cid);
            tcPK.setSid(sid);
            StudentCourse sc = session.load(StudentCourse.class, tcPK);
            sc.setGid(gid);
            session.beginTransaction();
            session.update(sc);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            HibernateUtils.closeSession(session);
        }
    }

    public static void main(String args[]){
        StudentCourseDao studentCourseDao = new StudentCourseDao();
        List<StudentCourse> studentCourses = studentCourseDao.findByCid(6);
        for(StudentCourse studentCourse:studentCourses){
            System.out.println(studentCourse.getGid());
        }
    }
}
