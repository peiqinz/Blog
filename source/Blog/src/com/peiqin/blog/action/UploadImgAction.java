package com.peiqin.blog.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadImgAction extends ActionSupport{
	private File upload;  
    private String uploadContentType;  
    private String uploadFileName;  
  
    public File getUpload() {  
        return upload;  
    }  
  
    public void setUpload(File upload) {  
          
        this.upload = upload;  
    }  
  
    public String getUploadContentType() {  
        return uploadContentType;  
    }  
  
    public void setUploadContentType(String uploadContentType) {  
        this.uploadContentType = uploadContentType;  
    }  
  
    public String getUploadFileName() {  
        return uploadFileName;  
    }  
  
    public void setUploadFileName(String uploadFileName) {  
        this.uploadFileName = uploadFileName;  
    }  
  
    public String execute() throws Exception {  
    	System.out.println("�ϴ�ͼƬ");
        HttpServletResponse response = ServletActionContext.getResponse();  
        response.setCharacterEncoding("GBK");  
        PrintWriter out = response.getWriter();  
  
        String expandedName = "";  //�ļ���չ��  
        if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {  
            //IE6�ϴ�jpgͼƬ��headimageContentType��image/pjpeg����IE9�Լ�����ϴ���jpgͼƬ��image/jpeg  
            expandedName = ".jpg";  
        }else if(uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")){  
            //IE6�ϴ���pngͼƬ��headimageContentType��"image/x-png"  
            expandedName = ".png";  
        }else if(uploadContentType.equals("image/gif")){  
            expandedName = ".gif";  
        }else if(uploadContentType.equals("image/bmp")){  
            expandedName = ".bmp";  
        }else{  
            out.println("<script type=\"text/javascript\">");  
            out.println("alert('��ʽ����')");
            out.println("</script>");  
            return null;  
        }  
     
          
        InputStream is = new FileInputStream(upload);  
        String uploadPath = ServletActionContext.getServletContext()     
                .getRealPath("/img/postImg");  
        String fileName = java.util.UUID.randomUUID().toString();  //����ʱ��+UUID�ķ�ʽ�漴����  
        fileName += expandedName;  
        File toFile = new File(uploadPath, fileName);  
        OutputStream os = new FileOutputStream(toFile);     
        byte[] buffer = new byte[1024];     
        int length = 0;  
        while ((length = is.read(buffer)) > 0) {     
            os.write(buffer, 0, length);     
        }     
        is.close();  
        os.close();  
          
        // ���ء�ͼ��ѡ�����ʾͼƬ  
        out.println("<script type=\"text/javascript\">");    
        out.println("window.parent.CKEDITOR.tools.callFunction(,'" + "img/postImg/" + fileName + "','')");    
        out.println("</script>");  
          
        return null;  
    }  
}
