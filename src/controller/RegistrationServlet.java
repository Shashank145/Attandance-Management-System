package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import beans.PojoForRagis;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		
		 
	}

     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	super.doGet(req, resp);
    	SessionFactory sf;
    	 Configuration cfg=new Configuration();
		    cfg.configure("resources/hibernate.cfg.xml");
		    sf=cfg.buildSessionFactory();

        Session s=sf.openSession();
	    org.hibernate.Transaction t=s.beginTransaction();
	    
	
		  
		String fname= req.getParameter("fname");
		String lname= req.getParameter("lname");
		String email= req.getParameter("email");
		String password= req.getParameter("password");
		String cpassword= req.getParameter("cpassword");
		String gender= req.getParameter("r1");

		PojoForRagis pj=new PojoForRagis(fname,lname,email,password,cpassword,gender);

		s.save(pj);
		//t.commit();
		
		resp.getWriter().println("Successfull");

		s.close();
		sf.close();
    }
}
