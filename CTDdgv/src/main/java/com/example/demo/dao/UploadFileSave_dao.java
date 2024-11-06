package com.example.demo.dao;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import com.example.demo.entity.CreateFolder_entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class UploadFileSave_dao {
    MultipartFile mutation;
    MultipartFile survival;
    HttpServletRequest request;
    String uuid = UUID.randomUUID().toString();
    String realPath;
    public UploadFileSave_dao(){}
    
    public UploadFileSave_dao(String realPath, MultipartFile mutation, HttpServletRequest request){
        this.mutation = mutation;
        this.request = request;
        this.realPath = realPath;
    }
    public UploadFileSave_dao(String realPath, MultipartFile mutation, MultipartFile survival, HttpServletRequest request){
        this.mutation = mutation;
        this.survival = survival;
        this.request = request;
        this.realPath = realPath;
    }
    public void saveMutatioin(){
        String pathTomu = "/file/data/uploads/mutations/";
        String realPath = this.realPath + pathTomu;
        CreateFolder_entity C_upload_sur = new CreateFolder_entity(realPath);//检查上传文件夹是否存在
        C_upload_sur.createFolder();
        String oldname = mutation.getOriginalFilename();
        String newname = uuid + oldname.substring(oldname.lastIndexOf("."), oldname.length());
        try{
        mutation.transferTo(new File(realPath, newname));
        System.out.println(new File(realPath, newname).getAbsolutePath());//输出（上传文件）保存的绝对路径
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void saveSurvival(){
        //String realPath = request.getSession().getServletContext().getRealPath("/file/data/uploads/survivals/"); //这种获取路径的方法保存文件后测试时位于target文件夹下，和后续分析创建的文件目录不一致（位于webapps目录下），保存和引用的文件目录不一致
        String pathTosu =  "/file/data/uploads/survivals/";
        String realPath = this.realPath + pathTosu;
        CreateFolder_entity C_upload_sur = new CreateFolder_entity(realPath);
        C_upload_sur.createFolder();
        String oldname = survival.getOriginalFilename();
        String newname = uuid + oldname.substring(oldname.lastIndexOf("."), oldname.length());
        try{
            survival.transferTo(new File(realPath, newname));
            System.out.println(new File(realPath, newname).getAbsolutePath());//输出（上传文件）保存的绝对路径
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public String getuuid(){
        return uuid;
    }
}
