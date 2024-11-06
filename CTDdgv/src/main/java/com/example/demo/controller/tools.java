package com.example.demo.controller;


import com.example.demo.entity.Result_entity;
import com.example.demo.entity.code_entity;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
public class tools {
    @Autowired
    public ServletContext servletContext;
    //获取CTDdgv根目录
    public String getrealPath() {
        Path realPath = Paths.get(servletContext.getRealPath("/")); //Path.get会根据操作系统自动返回不同的路径分隔符
        return realPath.toString().replace("\\", "/");
    }
    @RequestMapping(value = "/tool4_survival" ,produces = MediaType.APPLICATION_JSON_VALUE , method = RequestMethod.POST)
    public code_entity getResult(HttpServletRequest request) {
        String state = null;
        String message = null;
        RConnection rConnection = null;
        try {
            rConnection = new RConnection();
            String disease_type = null;
            String driver_gene = null;
            disease_type = request.getParameter("disease_type");
            driver_gene = request.getParameter("driver_gene");

            String rootPath = getrealPath();

            //因为normalize后的不包含ref,alt等，所以只能用没有标准化之前的原始突变文件

            String readTablePath_MC = rootPath + "/tool_survival/Patient_gene_condition/" + disease_type + ".txt";
            String readTablePath_CL = rootPath + "/tool_survival/Patient_gene_condition/clinical_data.txt";
            String writeTablePath = rootPath + "/tool_survival/tissue/";
            String programPath = rootPath + "/tool_survival/tissue_survival.R";

            System.out.println("突变文件路径" + readTablePath_MC);
            System.out.println("生存文件路径" + readTablePath_CL);
            System.out.println("写出路径" + writeTablePath);
            System.out.println("R脚本路径" + programPath);
            System.out.println("癌症类型" + disease_type);
            System.out.println("基因" + driver_gene);

            rConnection.eval("rm(list=ls())");
            rConnection.assign("readTablePath_MC", readTablePath_MC);
            rConnection.assign("readTablePath_CL", readTablePath_CL);
            rConnection.assign("writeTablePath", writeTablePath);
            rConnection.assign("disease_type", disease_type);
            rConnection.assign("driver_gene", driver_gene);
            rConnection.assign("programPath", programPath);
            rConnection.eval("source(programPath)");
            System.out.println("tool_survival finish...");
            state = "100";
            message = "success";
        } catch (RserveException e) {
            state = "104";
            message = e.toString();
        } finally {
            if (rConnection != null && rConnection.isConnected()) {
                rConnection.close();
            }
            code_entity result = new code_entity();
            result.setState(state);
            result.setMessage(message);
            return result;
        }

    }
}

