package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Impl.UserImpl;
import com.entity.Email;
import com.server.EmailDao_Server;
import com.server.EmailImpl_Server;
import com.server.UserDao_Server;
import com.server.UserImpl_Server;

public class UserLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserLogin() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		UserDao_Server ud = new UserImpl_Server();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		if(ud.SelectLogin(name,password)>0){
			HttpSession session = request.getSession();
			String email = ud.select(name);
			session.setAttribute("email",email);
			session.setAttribute("username", name);
			response.sendRedirect("../EmailList.jsp");
		}else{
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('用户名或者密码输入错误，请重新输入！');");
			out.print("window.location.href='../index.jsp'");
			out.print("</script>");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
