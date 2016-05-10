package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserService;
import vo.User;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	UserService userservice = new UserService();
	
	public String login() {
		User u = userservice.login(user);
		if(u==null){
			addActionError("用户名或密码错误，请重新输入");
			return INPUT;
		}else{
			ActionContext.getContext().getSession().put("user", u);
			return SUCCESS;
		}
	}
	
	public String register() {
		if(userservice.register(user)){
			ActionContext.getContext().getSession().put("user", user);
			return SUCCESS;
		}
		else{
			addActionError("用户名已经存在，请重新输入");
			return INPUT;
		}
	}
}
