package com.buaa.mooc.servlet;

import com.buaa.mooc.dao.MessageDao;
import com.buaa.mooc.entity.Message;
import com.buaa.mooc.utils.Validation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by windrises on 2017/6/28.
 */
public class StudentHomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Validation.checkStudent(request)) {
            response.sendRedirect("/login");
            return;
        }
        Integer sid = (Integer) request.getSession().getAttribute("sid");
        List<Message> messages = new MessageDao().findBySid(sid);
        request.setAttribute("messages", messages);
        RequestDispatcher rd = getServletConfig().getServletContext().getRequestDispatcher("/student_homepage.jsp");
        rd.forward(request, response);
    }
}
