package com.peiqin.blog.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import com.baidu.ueditor.ActionEnter;
import com.opensymphony.xwork2.ActionSupport;

public class GetConfigAction extends ActionSupport{
    public String execute() throws IOException{
        //这里就是把controller.jsp代码copy下来
        ServletActionContext.getRequest().setCharacterEncoding( "utf-8" );
        ServletActionContext.getResponse().setHeader("Content-Type" , "text/html");
        String roolPath = ServletActionContext.getServletContext().getRealPath("/");
        //记得把config.json放到/Test/WEB-INF/下
        String configStr = new ActionEnter(ServletActionContext.getRequest(), roolPath).exec();
        System.out.println(roolPath);
        ServletActionContext.getResponse().getWriter().write(configStr);
    	return NONE;
    }
}
