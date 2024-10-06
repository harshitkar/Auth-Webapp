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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 123456789L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");

		User user = new User();
		user.setEmail(email);
		user.setPassword(password);

		UserDao dao = new UserDao();
		User user1 = dao.loginUser(user);

		HttpSession session;
		if (user1 != null) {
			session = request.getSession();
			session.setAttribute("userD", user1);
			response.sendRedirect("home.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("login-failed", "Invalid username or password");
			response.sendRedirect("login.jsp");
		}
	}
}
