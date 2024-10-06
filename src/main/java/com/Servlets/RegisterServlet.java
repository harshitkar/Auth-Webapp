package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Dao.UserDao;
import com.model.User;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");

		User us = new User();
		us.setName(name);
		us.setPassword(password);
		us.setEmail(email);

		UserDao dao = new UserDao();
		boolean f = dao.addUser(us);

		HttpSession session;
		if (f) {
			session = request.getSession();
			session.setAttribute("reg-success", "Registered Successfully..");
			response.sendRedirect("home.jsp"); // Redirecting to home.jsp after registration success
		} else {
			session = request.getSession();
			session.setAttribute("failed-msg", "Something went wrong on server...");
			response.sendRedirect("register.jsp");
		}
	}
}
