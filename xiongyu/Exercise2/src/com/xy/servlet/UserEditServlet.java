package com.xy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xy.dao.UserDao;
import com.xy.model.User;

public class UserEditServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		String id = request.getParameter("user_id");
		String name = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		if(name==null&&password==null){//跳转到编辑页面
			request.setAttribute("user", userDao.getUser(Integer.parseInt(id)));
			request.getRequestDispatcher("/useredit.jsp").forward(request, response);
		}else{//提交编辑表单
			User user = new User(name, password);
			user.setId(Integer.parseInt(id));
			userDao.editUser(user);
			response.sendRedirect("../index.jsp");			
		}
	}

}
