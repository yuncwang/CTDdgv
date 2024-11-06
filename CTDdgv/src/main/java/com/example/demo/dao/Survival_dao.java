package com.example.demo.dao;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Survival_dao{
    String uuid;
    String relativePathtoData;
    String relativePathToPro;
    String rootPath;
    public Survival_dao(String uuid, String relativePathtoData, String relativePathToPro, String rootPath){
        this.rootPath = rootPath;
        this.uuid = uuid;
        this.relativePathtoData = relativePathtoData;
        this.relativePathToPro = relativePathToPro;
    }
    public  void survival() throws RserveException {
        RConnection rConnection = new RConnection(); //没有关闭上一个连接新建连接会出现超时错误
        try {
            String readTablePath_driverGene = rootPath + relativePathtoData + "analysis/results/" + uuid +"/final_result.txt";
            String readTablePath_mut = rootPath + relativePathtoData + "analysis/results/" + uuid +"/p_gene_m.txt";
            String readTablePath_sur = rootPath + relativePathtoData + "uploads/survivals/" + uuid +".txt";
            String wd = rootPath + relativePathtoData + "analysis/survivals/" + uuid + "/";
            String programPath = rootPath + relativePathToPro + "survival.R";
            rConnection.eval("rm(list=ls())");
            rConnection.assign("readTablePath_driverGene",readTablePath_driverGene);
            rConnection.assign("readTablePath_mut",readTablePath_mut);
            rConnection.assign("readTablePath_sur",readTablePath_sur);
            //指定执行脚本路径
            rConnection.assign("programPath",programPath);
            //指定脚本中输出文件路径
            rConnection.assign("wd",wd);
            rConnection.eval("source(programPath)");
            System.out.println("Survival analysis finish...");
        }finally {
            if (rConnection == null) {
                throw new RserveException(rConnection, "Rserve refuse connection");
            } else {
                rConnection.close();
            }
        }

    }
}
