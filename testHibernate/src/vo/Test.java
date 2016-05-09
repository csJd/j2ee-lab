package vo;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction trans = null;
		try{
			SessionFactory sf = new Configuration().configure().buildSessionFactory();
			session = sf.openSession();
			trans = session.beginTransaction();
			
			User u = new User();
			u.setUsername("hbm");
			u.setPassword("123456");
			
			session.save(u);
			trans.commit();
		}catch(Exception e){
			trans.rollback();
			e.printStackTrace();
		}
		String hql = "from User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		for(User u:list){
			System.out.println("id = "+u.getId()+"  ,username = " + u.getUsername()+"  ,password = " + u.getPassword());
		}
		session.close();
	}

}
