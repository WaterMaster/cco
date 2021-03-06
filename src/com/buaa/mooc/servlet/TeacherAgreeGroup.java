package com.buaa.mooc.servlet;

import com.buaa.mooc.dao.GroupDao;
import com.buaa.mooc.dao.GroupRecruitDao;
import com.buaa.mooc.dao.MessageDao;
import com.buaa.mooc.dao.StudentCourseDao;
import com.buaa.mooc.entity.GroupRecruit;
import com.buaa.mooc.entity.Student;
import com.buaa.mooc.entity.StudentCourse;
import com.buaa.mooc.entity.StudentRecruitView;
import com.buaa.mooc.utils.Validation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by 我不承认 on 2017/7/3.
 */
public class TeacherAgreeGroup extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int grid = Integer.parseInt(request.getParameterMap().get("grid")[0]);
        GroupDao groupDao = new GroupDao();
        GroupRecruitDao groupRecruitDao = new GroupRecruitDao();
        GroupRecruit groupRecruit = groupRecruitDao.findByGridGR(grid);
        List<StudentRecruitView> students = groupRecruitDao.findByGridSRV(grid);
        groupDao.InsertGroup(groupRecruit);
        MessageDao messageDao = new MessageDao();
        if (students != null && students.size() > 0) {
            for (StudentRecruitView stu : students) {
                messageDao.InsertMessage(stu.getPk().getSid(), "你向队伍["+groupRecruit.getGroup_name()+"]的申请已被老师批准。");
            }
        }
        response.sendRedirect("TeacherManGroup?cid="+groupRecruit.getCid());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Validation.checkTeacher(request)) {
            response.sendRedirect("/login");
            return;
        }
        doPost(request,response);
    }
}
