package com.peiqin.blog.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import com.baidu.ueditor.ActionEnter;
import com.opensymphony.xwork2.ActionSupport;

public class GetConfigAction extends ActionSupport{
    public String execute() throws IOException{
        //������ǰ�controller.jsp����copy����
        ServletActionContext.getRequest().setCharacterEncoding( "utf-8" );
        ServletActionContext.getResponse().setHeader("Content-Type" , "text/html");
        String roolPath = ServletActionContext.getServletContext().getRealPath("/");
        //�ǵð�config.json�ŵ�/Test/WEB-INF/��
        String configStr = new ActionEnter(ServletActionContext.getRequest(), roolPath).exec();
        System.out.println(roolPath);
        ServletActionContext.getResponse().getWriter().write(configStr);
    	return NONE;
    }
}
