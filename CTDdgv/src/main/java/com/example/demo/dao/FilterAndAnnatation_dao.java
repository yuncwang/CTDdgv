package com.example.demo.dao;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FilterAndAnnatation_dao {
    
    public FilterAndAnnatation_dao(){}
    public void filterAndAnnotation( String relativePathToData, String relativePathToPro, String uuid, String rootPath) throws RserveException, REXPMismatchException {
        RConnection rConnection = new RConnection(); //没有关闭上一个连接新建连接会出现超时错误
        try {
            String readTablePath = rootPath + relativePathToData + "analysis/results/"+uuid+"/element_result/";
            String writeTablePath = rootPath + relativePathToData + "analysis/results/"+uuid+"/element_filter/";
            String readMappingPath = rootPath + relativePathToData + "analysis/results/"+uuid+"/element_mapping/";
            String programPath = rootPath + relativePathToPro + "filter_Annotation.R";
            rConnection.eval("rm(list=ls())");
            //指定脚本中读入文件路径
            rConnection.assign("readTablePath",readTablePath);
            rConnection.assign("readMappingPath",readMappingPath);
            //指定执行脚本路径
            rConnection.assign("programPath",programPath);
            //指定脚本中输出文件路径
            rConnection.assign("writeTablePath",writeTablePath);
            rConnection.eval("source(programPath)");
            //System.out.println(rConnection.eval("test2<-2;test2").asString());
            System.out.println("FilterAndAnnatation finish...");
        }finally {
            if (rConnection == null) {
                throw new RserveException(rConnection, "Rserve refuse connection");
            } else {
                rConnection.close();
            }
        }

    }
}
