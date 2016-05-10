package com.xy.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.xy.model.User;
import com.xy.service.UserServiceInter;
import com.xy.utils.QueryResult;

public class UserAction {
	@Autowired
	private UserServiceInter userProxy;
	private QueryResult<User> result;
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public QueryResult<User> getResult() {
		return result;
	}

	public void setResult(QueryResult<User> result) {
		this.result = result;
	}

	public UserServiceInter getUserProxy() {
		return userProxy;
	}

	public void setUserProxy(UserServiceInter userProxy) {
		this.userProxy = userProxy;
	}

	public String userinfo(){
		result = userProxy.getScrollData();
		return "success";
	}

	public String useradd(){
		return "success";
	}

	public String useredit(){
		if(user!=null&&user.getId()!=null)
			user = userProxy.findById(user.getId());
		return "success";
	}
	
	public String userdelete(){
		if(user!=null&&user.getId()!=null){
			userProxy.deleteById(user.getId());			
		}
		return "success";
	}

	public String useraddsubmit(){
		if(user!=null&&user.getUsername()!=null&&user.getPassword()!=null){
			QueryResult<User> qResult =  userProxy.getScrollData(0, 1, "o.username=?", new Object[]{user.getUsername()});
			if(qResult==null||qResult.getDatas().size()==0)
				userProxy.save(user);
		}
		return "success";
	}
	
	public String usereditsubmit(){
		if(user!=null&&user.getUsername()!=null&&user.getPassword()!=null){
			userProxy.update(user);
		}
		return "success";
	}
}
