package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Email;
import com.server.EmailDao_Server;
import com.server.EmailImpl_Server;

public class Synchronous extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Synchronous() {
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
		EmailDao_Server es = new EmailImpl_Server();
		String lists = request.getParameter("list");
		if(lists.equals("list")){
			List<Email> list = es.selectAll();
			request.setAttribute("list", list);
			request.setAttribute("index", 0);
			request.getRequestDispatcher("../show.jsp").forward(request, response);
		}else if(lists.equals("one")){
			int id = Integer.parseInt(request.getParameter("iid"));
			List<Email> list = es.selectid(id);
			request.setAttribute("list", list);
			request.setAttribute("index", 1);
			request.getRequestDispatcher("../show.jsp").forward(request, response);
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
