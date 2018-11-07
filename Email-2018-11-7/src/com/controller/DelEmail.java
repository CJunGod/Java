package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javassist.runtime.Inner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Email;
import com.server.EmailDao_Server;
import com.server.EmailImpl_Server;

public class DelEmail extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelEmail() {
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
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		EmailDao_Server es = new EmailImpl_Server();
		if(es.DelEmail(id)>0){
			out.print("<script>");
			out.print("alert('É¾³ý³É¹¦');");
			out.print("window.location.href='../EmailList.jsp'");
			out.print("</script>");
		}else{
			out.print("<script>");
			out.print("alert('É¾³ýÊ§°Ü');");
			out.print("window.location.href='../EmailList.jsp'");
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
