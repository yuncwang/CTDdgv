package com.example.demo.service;
import com.example.demo.dao.UploadFileSave_dao;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;



public class uploadFileSave_service {
    MultipartFile mutation;
    MultipartFile survival;
    HttpServletRequest request;
    String realPath;
    public uploadFileSave_service(String realPath, MultipartFile mutation, MultipartFile survival, HttpServletRequest request){
        this.mutation = mutation;
        this.survival = survival;
        this.request = request;
        this.realPath = realPath;
    }
    public uploadFileSave_service(String realPath, MultipartFile mutation,HttpServletRequest request){
        this.mutation = mutation;
        this.request = request;
        this.realPath = realPath;
    }
    public String saveTwoTypeFile() throws RuntimeException{

             UploadFileSave_dao uploadfilesave_dao = new UploadFileSave_dao(realPath,mutation,survival,request);
             uploadfilesave_dao.saveMutatioin();
             uploadfilesave_dao.saveSurvival();
             return uploadfilesave_dao.getuuid();

    }
    public String savaMutationFile() throws RuntimeException{
        UploadFileSave_dao uploadFileSave_dao = new UploadFileSave_dao(realPath,mutation,request);
        uploadFileSave_dao.saveMutatioin();
        return uploadFileSave_dao.getuuid();
    }
}
