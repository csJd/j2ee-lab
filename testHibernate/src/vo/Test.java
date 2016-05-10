package vo;

public class Test {
public static void main(String[] args) {
  System.out.println(new Test().test());
 }

public static int test() {
  int i = 1;
  try {
   return i; //   此时执行了return 语句返回值已经确定了，但是该方法还没有执行完毕，
    //      外界还不能访问返回值 或者说 还得不到返回值
  } finally {
   i += 1;//finally里的变量i不能改变之前的return的i的值
   System.out.println("我被执行了！");
  }
 }// 到此方法执行完毕，外界才可以去访问此方法的返回值
}

//import java.util.List;
//
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.cfg.Configuration;
//
//public class Test {
//
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		Session session = null;
//		Transaction trans = null;
//		try{
//			SessionFactory sf = new Configuration().configure().buildSessionFactory();
//			session = sf.openSession();
//			trans = session.beginTransaction();
//			
//			User u = new User();
//			u.setUsername("hbm");
//			u.setPassword("123456");
//			
//			session.save(u);
//			trans.commit();
//		}catch(Exception e){
//			trans.rollback();
//			e.printStackTrace();
//		}
//		String hql = "from User";
//		Query query = session.createQuery(hql);
//		List<User> list = query.list();
//		for(User u:list){
//			System.out.println("id = "+u.getId()+"  ,username = " + u.getUsername()+"  ,password = " + u.getPassword());
//		}
//		session.close();
//	}
//
//}
