package com.example.demo.dao;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.nio.file.Path;
import java.nio.file.Paths;

public class IdentifyPat_Gene_dao {
    public IdentifyPat_Gene_dao(){}
    public IdentifyPat_Gene_dao(String uuid, String relativePathtoData, String relativePathToPro, String rootPath) throws RserveException {
        RConnection rConnection = new RConnection(); //没有关闭上一个连接新建连接会出现超时错误
        try {
            String readTablePath_driverGene = rootPath + relativePathtoData + "analysis/results/" + uuid +"/final_result.txt";
            String readTablePath_normalize = rootPath + relativePathtoData + "analysis/results/" + uuid +"/normalize/cfDNA_mutation_result.txt";
            String writeTablePath = rootPath + relativePathtoData + "analysis/results/" + uuid + "/p_gene_m.txt";
            String programPath = rootPath + relativePathToPro + "identifyPat_Gene.R";
            rConnection.eval("rm(list=ls())");
            rConnection.assign("readTablePath_driverGene",readTablePath_driverGene);
            rConnection.assign("readTablePath_normalize",readTablePath_normalize);
            //指定执行脚本路径
            rConnection.assign("programPath",programPath);
            //指定脚本中输出文件路径
            rConnection.assign("writeTablePath",writeTablePath);
            rConnection.eval("source(programPath)");
            System.out.println("Indentify Pat_Gene finish...");
        }finally {
            if (rConnection == null) {
                throw new RserveException(rConnection, "Rserve refuse connection");
            } else {
                rConnection.close();
            }
        }

    }

}
