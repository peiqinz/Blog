package com.peiqin.blog.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class AuthorityInterceptor extends MethodFilterInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Map<String, Object> session = ctx.getSession();
		if(session.get("loginuser") == null){
			ActionSupport support = (ActionSupport) invocation.getAction();
			support.addActionMessage("ÇëÏÈµÇÂ¼");
			return Action.LOGIN;
		}else{
			return invocation.invoke();
		}
	}

}
