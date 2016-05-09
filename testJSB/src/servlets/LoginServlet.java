package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDAO dao = new UserDAO();
		if(dao.findUser(username, password)){
			request.getSession().setAttribute("username", username);
			response.sendRedirect("welcome.jsp");
		}
		else{
//			PrintWriter out = response.getWriter();
//			out.print("用户名或密码错误! 3秒后重新登录");
//			response.setHeader("refresh", "3;login.jsp");
			request.getSession().setAttribute("err", "用户名或密码错误!");
			response.sendRedirect("login.jsp");
		}
	}

}
