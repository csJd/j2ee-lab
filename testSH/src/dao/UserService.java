package dao;

import java.util.List;

import org.hibernate.Query;

import vo.User;

public class UserService {
	UserDAO userDao = new UserDAO();

	public User findUser(String username, String pwd) {
		String hql = "from User as u where u.username=? and u.password = ?";
		Query query = userDao.getSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, pwd);
		List<User> list = query.list();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	public User findUser(String username) {
		String hql = "from User as u where u.username=?";
		Query query = userDao.getSession().createQuery(hql);
		query.setParameter(0, username);
		List<User> list = query.list();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	public User findUser(int id) {
		return (User) userDao.findById("vo.User", id);
	}

	public List<User> findUsers(String property, Object value){
		try{
			String hql="from User as u where u."+property+"=?";
			Query query = userDao.getSession().createQuery(hql);
			query.setParameter(0, value);
			return query.list();
		}catch(Exception e){
			return null;
		}
	}
	
	public List<User> findAllUsers(String property, Object value){
		try{
			String hql="from User";
			Query query = userDao.getSession().createQuery(hql);
			return query.list();
		}catch(Exception e){
			return null;
		}
	}

	public User login(User user) {
		return findUser(user.getUsername(), user.getPassword());
	}

	public boolean register(User user) {
		User u = findUser(user.getUsername());
		if (u == null) {
			userDao.add(user);
			return true;
		}
		return false;
	}

}
