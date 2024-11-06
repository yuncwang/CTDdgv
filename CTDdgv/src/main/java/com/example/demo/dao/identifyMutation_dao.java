package com.example.demo.dao;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.nio.file.Path;
import java.nio.file.Paths;

public class identifyMutation_dao {

    identifyMutation_dao(){}
    public identifyMutation_dao(String uuid, String relativePathtoData, String relativePathToPro, String rootPath) throws RserveException {
        //因为normalize后的不包含ref,alt等，所以只能用没有标准化之前的原始突变文件
        RConnection rConnection = new RConnection(); //没有关闭上一个连接新建连接会出现超时错误
        try {
            String readTablePath_origin_mutation = rootPath + relativePathtoData + "uploads/mutations/" + uuid +".txt";
            String readTablePath_element_filter = rootPath + relativePathtoData + "analysis/results/" + uuid +"/element_filter/";
            String writeTablePath = rootPath + relativePathtoData + "analysis/results/" + uuid + "/element_hot_mutation/";
            String programPath = rootPath + relativePathToPro + "identify_DriverMutation.R";
            rConnection.eval("rm(list=ls())");
            rConnection.assign("readTablePath_origin_mutation",readTablePath_origin_mutation);
            rConnection.assign("readTablePath_element_filter",readTablePath_element_filter);
            rConnection.assign("writeTablePath",writeTablePath);
            rConnection.assign("programPath",programPath);
            rConnection.eval("source(programPath)");
            System.out.println("Identify mutation finish...");
        }finally {
            if (rConnection == null) {
                throw new RserveException(rConnection, "Rserve refuse connection");
            } else {
                rConnection.close();
            }
        }
    }
}
