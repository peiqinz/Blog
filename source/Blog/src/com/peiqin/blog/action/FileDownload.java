package com.peiqin.blog.action;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownload extends ActionSupport{  
    
    private int number ;  
  
    private String fileName;  
  
    public int getNumber() {  
        return number;  
    }  
  
    public void setNumber(int number) {  
        this.number = number;  
    }  
      
    public String getFileName() {  
        return fileName;  
    }  
  
    public void setFileName(String fileName) {  
        this.fileName = fileName;  
    }  
  
    //����һ������������Ϊһ���ͻ�����˵��һ���������������ڷ���������һ�� �����  
    public InputStream getDownloadFile() throws Exception  
    {  
        if(1 == number)  
        {  
           this.fileName = "Dream.jpg" ;  
           //��ȡ��Դ·��  
           return ServletActionContext.getServletContext().getResourceAsStream("D://text.xml") ;  
        }  
          
        else if(2 == number)  
        {  
            this.fileName = "jd2chmԴ������chm��ʽ�ĵ�.rar" ;  
            //�������  
            this.fileName = new String(this.fileName.getBytes("GBK"),"ISO-8859-1");  
            return ServletActionContext.getServletContext().getResourceAsStream("js/bootstrap.js") ;  
        }  
        else  
           return null ;  
    }  
      
    @Override  
    public String execute() throws Exception {  
          
        return SUCCESS;  
    }  
  
}  
