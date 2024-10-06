package com.Dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.User;
public class UserDao {
	private Connection con;
	public UserDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pc2","root","MySQL@104");
	}
	catch(Exception e)	{
		e.printStackTrace();
		System.out.println("error");
	}
		System.out.println(con);
	}
	public boolean addUser(User user) {
		boolean f=false;
		try {
			String query="insert into user(name, email, password) values(?,?,?)";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, user.getName());
			st.setString(2,user.getEmail());
			st.setString(3,user.getPassword());
			int i=st.executeUpdate();
			if(i==1)			{
				f=true;
			}		}
		catch(Exception e)		{
			e.printStackTrace();
		}	
		return f;
	}
	public User loginUser(User user)
	{
		User user1=null;
		try {
			String query="select * from user where email=? and password=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1,user.getEmail());
			pst.setString(2, user.getPassword());
			System.out.println(user.getEmail()+" "+user.getPassword());
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{System.out.println(rs.getString("id"));
				user1=new User();
				user1.setId(rs.getInt("id"));
				user1.setName(rs.getString("name"));
				user1.setEmail(rs.getString("email"));
				user1.setPassword(rs.getString("password"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user1;
	}
}
