package com.example.demo.dao;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.nio.file.Path;
import java.nio.file.Paths;


public class mapping_dao {
    String readTablePath;
    public mapping_dao(){}
    public mapping_dao(String readTablePath){
        this.readTablePath = readTablePath;
    }
    public void mapping(String relativePathToData, String relativePathToPro, String uuid,String hg,String rootPath) throws RserveException, REXPMismatchException {
        RConnection rConnection = new RConnection(); //没有关闭上一个连接新建连接会出现超时错误
        try {
            String pathToHg19 = rootPath + relativePathToPro + "driverpover_element/element_hg19/";
            String pathToHg38 = rootPath + relativePathToPro + "driverpover_element/element_hg38/";
            String writeTablePath = rootPath + relativePathToData + "analysis/results/"+uuid+"/element_mapping/";
            String programPath = rootPath + relativePathToPro + "element_Mapping.R";
            rConnection.eval("rm(list=ls())");
            rConnection.assign("programPath",programPath);
            rConnection.assign("readTablePath",readTablePath);
            //System.out.println(rConnection.eval("test1<-1;test1").asString());
            if(hg.equals("hg19")){
                rConnection.assign("hg_bed","_hg19.bed");
                rConnection.assign("hgPath",pathToHg19);
                rConnection.assign("writeTablePath",writeTablePath);
                rConnection.eval("source(programPath)");
            }else if(hg.equals("hg38")){
                rConnection.assign("hg_bed","_hg38.bed");
                rConnection.assign("hgPath",pathToHg38);
                rConnection.assign("writeTablePath",writeTablePath);
                rConnection.eval("source(programPath)");
            }
            System.out.println("Mapping finish...");
        }finally {
            if (rConnection == null) {
                throw new RserveException(rConnection, "Rserve refuse connection...");
            } else {
                rConnection.close();
            }
        }

    }
}
