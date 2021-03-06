package com.buaa.mooc.servlet;

import com.buaa.mooc.dao.HomeworkDao;
import com.buaa.mooc.utils.Validation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.IllegalFormatException;

/**
 * Created by huxia on 2017/6/29.
 */
public class AddHomeworkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer cid = Integer.parseInt(request.getParameterMap().get("cid")[0]);
            Integer _limit = Integer.parseInt(request.getParameter("_limit"));
            Integer proportion = Integer.parseInt(request.getParameter("proportion"));
            String hname = new String(request.getParameter("assign_name").getBytes("iso-8859-1"), "utf-8");
            ParsePosition pos = new ParsePosition(0);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.util.Date startDate = formatter.parse(request.getParameter("startDate").trim(), pos);
            formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            pos = new ParsePosition(0);
            java.util.Date endDate = formatter.parse(request.getParameter("endDate").trim(), pos);


            HomeworkDao homeworkDao = new HomeworkDao();
            homeworkDao.AddHomework(cid, hname, new Timestamp(startDate.getTime()), new Timestamp(endDate.getTime()), _limit,proportion);

            response.sendRedirect("/TeacherHomework?cid="+cid);
        } catch (IllegalFormatException e) {
            e.printStackTrace();
            response.sendRedirect("/AddSemester");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Validation.checkTeacher(request)) {
            response.sendRedirect("/login");
            return;
        }
        Integer cid = Integer.parseInt(request.getParameterMap().get("cid")[0]);
        request.setAttribute("cid",cid);
        RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/teacher_homework_new.jsp");
        rd.forward(request, response);
    }
}
