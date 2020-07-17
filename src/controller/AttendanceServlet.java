package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;

import beans.PojoForAttendance;
import beans.PojoForRagis;

/**
 * Servlet implementation class AttendanceServlet
 */
@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int i=0;
		String is;
		
		/*do
		{
			 is=String.valueOf(++i);
		   System.out.println(request.getParameter(is));
		    
			
		}while(request.getParameter(is) !=null);*/
		
		
		
		Configuration cfg1=new Configuration();
		cfg1.configure("resources/hibernate.cfg.xml");
		SessionFactory sf1=cfg1.buildSessionFactory();
		Session s1=sf1.openSession();
		
		
		
		Configuration cfg2=new Configuration();
		cfg2.configure("resources/HibernateAtten.cfg.xml");
		SessionFactory sf2=cfg2.buildSessionFactory();
		Session s2=sf2.openSession();
		


		
		
		
		Criteria c=s1.createCriteria(PojoForRagis.class);
		
		Projection p0=Projections.property("id");
		Projection p1=Projections.property("fname");
		Projection p2=Projections.property("lname");
		
		
	    ProjectionList pl=	Projections.projectionList();
	    
	    pl.add(p0);
	    pl.add(p1);
	    pl.add(p2);
	   
	    
		c.setProjection(pl);
		
		List<Object[]> list= c.list();

		for(Object []o:list)
		{
			
		System.out.println(o[0]);
		System.out.println(o[1]);
		System.out.println(o[2]);
		 

		int id=(Integer)o[0];
		String fname=(String)o[1];
		String lname=(String)o[2];
		 is=String.valueOf(++i);
		String attStatus= request.getParameter(is);
		System.out.println(attStatus);
	    
		
		
		
		//PojoForAttendance patta=new PojoForAttendance(date, attStatus, id, subject)

		// s2.save(patta);
			org.hibernate.Transaction t=s2.beginTransaction();
			t.commit();
		}
	     
		
		  s1.close();
		  sf1.close();
		  s2.close();
		  sf2.close();
	}

}
