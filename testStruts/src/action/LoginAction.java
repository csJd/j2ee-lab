package action;

import com.opensymphony.xwork2.ActionSupport;

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

	public String execute() throws Exception {
		if (user.getUsername().equals("wustzz") && user.getPassword().equals("123456"))
			return SUCCESS;
		else
			return ERROR;
	}
}
