package dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class UserDAO implements IBaseDAO {

	SessionFactory sf= new Configuration().configure().buildSessionFactory();
	public Session getSession(){
		return sf.openSession();
	}
	
	@Override
	public void add(Object obj) {
		// TODO Auto-generated method stub
		Session session = null;
		try{
			session = getSession();
			session.beginTransaction();
			session.save(obj);
			session.getTransaction().commit();
		}catch(Exception e){
			session.getTransaction().rollback();
		}finally{
			if(session!=null) session.close();
		}
	}

	@Override
	public void delete(Object obj) {
		// TODO Auto-generated method stub
		Session session = null;
		try{
			session = getSession();
			session.beginTransaction();
			session.delete(obj);
			session.getTransaction().commit();
		}catch(Exception e){
			session.getTransaction().rollback();
		}finally{
			if(session!=null) session.close();
		}
	}

	@Override
	public void update(Object obj) {
		// TODO Auto-generated method stub
		Session session = null;
		try{
			session = getSession();
			session.beginTransaction();
			session.update(obj);
			session.getTransaction().commit();
		}catch(Exception e){
			session.getTransaction().rollback();
		}finally{
			if(session!=null) session.close();
		}
	}

	@Override
	public Object findById(String cls, Serializable key) {
		// TODO Auto-generated method stub
		Session session = null;
		try{
			session = getSession();
			Object instance = session.get(cls, key);
			return instance;
		}catch(Exception e){
			return null;
		}finally{
			if(session!=null) session.close();
		}
	}

}
